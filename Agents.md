查看 Calcit 命令行工具的用法:

```bash
calcit docs agents --full
```

`calcit.cirru` 是唯一源码 Snapshot，必须通过 `calcit edit` / `calcit tree`
修改。native 方法优先使用 C-safe buffer/async/blocking ABI；legacy Rust ABI
只作为迁移期间的逐方法 fallback。

提交前运行 `cargo fmt --check`、`cargo test`、
`cargo clippy --all-targets -- -D warnings`、`caps --strict --ci`、Calcit
check/quality gate，并用 release dylib 执行 `calcit calcit.cirru` 的真实回归。
