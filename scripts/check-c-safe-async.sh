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
calcit eval --dep "$module_dir" -- "$ctrl_snippet" &
ctrl_pid=$!
(
  sleep 10
  kill -TERM "$ctrl_pid" 2>/dev/null || true
) &
watchdog_pid=$!
sleep 1
kill -INT "$ctrl_pid"
status=0
wait "$ctrl_pid" || status=$?
kill "$watchdog_pid" 2>/dev/null || true
wait "$watchdog_pid" 2>/dev/null || true
if [[ "$status" -ne 0 ]]; then
  echo "async smoke failed: Ctrl+C stream (status $status)" >&2
  exit "$status"
fi

echo "verified C-safe timer, process, cancellation, and Ctrl+C async paths"
