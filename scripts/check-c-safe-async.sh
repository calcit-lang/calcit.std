#!/usr/bin/env bash

set -euo pipefail

module_dir="${CALCIT_STD_MODULE_DIR:-./}"

run_smoke() {
  local source="$1"
  local snippet
  snippet="$(<"$source")"
  calcit eval --dep "$module_dir" -- "$snippet" &
  local task_pid=$!
  (
    sleep 10
    kill -TERM "$task_pid" 2>/dev/null || true
  ) &
  local watchdog_pid=$!
  local status=0
  wait "$task_pid" || status=$?
  kill "$watchdog_pid" 2>/dev/null || true
  wait "$watchdog_pid" 2>/dev/null || true
  if [[ "$status" -ne 0 ]]; then
    echo "async smoke failed: $source (status $status)" >&2
    return "$status"
  fi
}

run_smoke tests/ffi-async/timeout.cirru
run_smoke tests/ffi-async/interval-cancel.cirru
run_smoke tests/ffi-async/process-cancel.cirru

ctrl_snippet="$(<tests/ffi-async/ctrl-c.cirru)"
ctrl_log="$(mktemp)"
trap 'rm -f "$ctrl_log"' EXIT
calcit eval --dep "$module_dir" -- "$ctrl_snippet" > "$ctrl_log" 2>&1 &
ctrl_pid=$!
(
  sleep 10
  kill -TERM "$ctrl_pid" 2>/dev/null || true
) &
watchdog_pid=$!
for _ in {1..100}; do
  if grep -Fxq ctrl-c-ready "$ctrl_log"; then
    kill -INT "$ctrl_pid" 2>/dev/null || true
    break
  fi
  if ! kill -0 "$ctrl_pid" 2>/dev/null; then break; fi
  sleep 0.05
done
status=0
wait "$ctrl_pid" || status=$?
kill "$watchdog_pid" 2>/dev/null || true
wait "$watchdog_pid" 2>/dev/null || true
cat "$ctrl_log"
if [[ "$status" -ne 0 ]] || ! grep -Fxq ctrl-c-received "$ctrl_log"; then
  echo "async smoke failed: Ctrl+C stream (status $status)" >&2
  exit 1
fi

echo "verified C-safe timer, process, cancellation, and Ctrl+C async paths"
