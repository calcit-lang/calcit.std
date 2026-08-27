#!/usr/bin/env bash

set -euo pipefail

case "$(uname -s)" in
  Darwin)
    library="dylibs/libcalcit_std.dylib"
    symbols="$(nm -gU "$library")"
    ;;
  Linux)
    library="dylibs/libcalcit_std.so"
    symbols="$(nm -D --defined-only "$library")"
    ;;
  *)
    echo "unsupported platform for symbol audit: $(uname -s)" >&2
    exit 1
    ;;
esac

expected=(
  calcit_ffi_buffer_version
  calcit_ffi_buffer_free
  calcit_ffi_async_version
  parse_time_calcit_ffi_v1
  now_bang_calcit_ffi_v1
  get_timestamp_calcit_ffi_v1
  format_time_calcit_ffi_v1
  extract_time_calcit_ffi_v1
  from_ymd_calcit_ffi_v1
  from_ywd_calcit_ffi_v1
  add_duration_calcit_ffi_v1
  read_file_calcit_ffi_v1
  write_file_calcit_ffi_v1
  append_file_calcit_ffi_v1
  path_exists_calcit_ffi_v1
  read_dir_calcit_ffi_v1
  create_dir_calcit_ffi_v1
  create_dir_all_calcit_ffi_v1
  rename_path_calcit_ffi_v1
  check_write_file_calcit_ffi_v1
  walk_dir_calcit_ffi_v1
  glob_call_calcit_ffi_v1
  read_file_by_line_calcit_ffi_blocking_v1
  set_timeout_calcit_ffi_async_v1
  set_interval_calcit_ffi_async_v1
  stream_command_calcit_ffi_async_v1
  on_ctrl_c_calcit_ffi_async_v1
  md5_calcit_ffi_v1
  parse_json_calcit_ffi_v1
  stringify_json_calcit_ffi_v1
  join_path_calcit_ffi_v1
  path_dirname_calcit_ffi_v1
  path_basename_calcit_ffi_v1
  execute_command_calcit_ffi_v1
  rand_calcit_ffi_v1
  rand_int_calcit_ffi_v1
  call_nanoid_calcit_ffi_v1
  rand_hex_color_calcit_ffi_v1
)

for symbol in "${expected[@]}"; do
  if ! grep -Eq "[[:space:]]_?${symbol}$" <<<"$symbols"; then
    echo "missing C-safe export: $symbol" >&2
    exit 1
  fi
done

if grep -Eq '[[:space:]]_?(abi_version|edn_version|stream_command|read_file_by_line|set_timeout|set_interval)$' <<<"$symbols"; then
  echo "found a legacy Rust-layout FFI export in $library" >&2
  exit 1
fi

echo "verified ${#expected[@]} C-safe calcit.std exports in $library"
