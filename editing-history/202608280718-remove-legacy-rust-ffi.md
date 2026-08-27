# Remove legacy Rust FFI exports / 删除遗留 Rust FFI 导出

## 中文

- 删除 `abi_version` 和 `edn_version` probes。
- 从所有内部 Rust handlers 移除 `no_mangle`，`cdylib` 仅导出 buffer、async 和 blocking protocol v1 的 `extern "C"` symbols。
- 删除已由 C-safe async/blocking adapters 取代的 `stream_command`、`read_file_by_line`、`set_timeout` 和 `set_interval` legacy callback implementations。
- 保留 Rust handlers 作为 adapter 内部实现，升级 Calcit 要求到 0.13.57。
- 扩展 CI 符号审计，明确拒绝遗留 Rust-layout 导出。

## English

- Remove the `abi_version` and `edn_version` probes.
- Remove `no_mangle` from every internal Rust handler so the `cdylib` exports only buffer, async, and blocking protocol-v1 `extern "C"` symbols.
- Remove the legacy `stream_command`, `read_file_by_line`, `set_timeout`, and `set_interval` callback implementations superseded by C-safe async/blocking adapters.
- Retain Rust handlers as adapter internals and upgrade the Calcit requirement to 0.13.57.
- Extend the CI symbol audit to reject legacy Rust-layout exports explicitly.
