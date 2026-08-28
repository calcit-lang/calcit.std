查看 Calcit 命令行工具的用法:

```bash
calcit docs agents --full
```

`calcit.cirru` 是唯一源码 Snapshot，必须通过 `calcit edit` / `calcit tree`
修改。native 动态边界只使用版本化 C-safe buffer/async/blocking ABI；
Calcit 0.13.57 已删除 legacy Rust ABI fallback。

提交前运行 `cargo fmt --check`、`cargo test`、
`cargo clippy --all-targets -- -D warnings`、`caps --strict --ci`、Calcit
check/quality gate，并用 release dylib 执行 `calcit calcit.cirru` 的真实回归。
