## 中文

查看 Calcit 命令行工具的用法：

```bash
calcit docs agents --full
```

`calcit.cirru` 是唯一源码 Snapshot，必须通过 `calcit edit` / `calcit tree`
修改。native 动态边界只使用版本化 C-safe buffer/async/blocking ABI；
Calcit 0.13.57 已删除 legacy Rust ABI fallback。

提交前运行 `cargo fmt --check`、`cargo test`、
`cargo clippy --all-targets -- -D warnings`、`caps --strict --ci`、Calcit
check/quality gate，并用 release dylib 执行 `calcit calcit.cirru` 的真实回归。

FFI 公共协议、descriptor 校验、buffer ownership、Cirru EDN transport 和
adapter 由 `calcit_native_ffi` 维护。本仓库只实现 std 的业务行为；若协议能力
不足，应先扩展共享 crate 并补齐契约测试，不要在本仓库复制模板实现。
`generated/ffi/` 由 `calcit-bindgen 0.1.0` 管理，不得手改；修改
`calcit.std.hash/md5` contract 后必须重新生成，并运行同 backend 集合的 `check`。

## English

Read the current Calcit command-line agent guide before editing source:

```bash
calcit docs agents --full
```

`calcit.cirru` is the only source snapshot and must be changed through
`calcit edit` / `calcit tree`. Native dynamic boundaries use only the
versioned C-safe buffer, async, and blocking ABI; Calcit 0.13.57 removed the
legacy Rust ABI fallback.

Before committing, run `cargo fmt --check`, `cargo test`,
`cargo clippy --all-targets -- -D warnings`, `caps --strict --ci`, the Calcit
check/quality gate, and a real `calcit calcit.cirru` regression with the
release dylib.

`calcit_native_ffi` owns the shared protocol, descriptor validation, buffer
ownership, Cirru EDN transport, and adapters. This repository implements only
std behavior. If the protocol lacks a capability, extend the shared crate and
its contract tests instead of copying the template here.
`generated/ffi/` is managed by `calcit-bindgen 0.1.0` and must not be edited
by hand. Regenerate after changing the `calcit.std.hash/md5` contract and run
`check` with the same backend set.
