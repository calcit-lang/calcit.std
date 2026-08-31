# 使用生成的 MD5 adapter / Use the generated MD5 adapter

## 中文

- 将真实 `calcit.std.hash/md5` 从手写 `export_edn_buffer_method_v1!` 迁到
  `calcit-bindgen 0.1.0` 管理的 typed Rust adapter。
- 业务实现现在只接收 `&str` 并返回 `String`；generated boundary 负责 symbol、
  arity、String codec、错误路径和 buffer protocol export。
- CI 从当前 calcit.cirru 只读导出 Interface IR v2，并以 Rust backend 执行
  stale-binding check；不使用 main branch 或 commit hash 安装 generator。
- 对齐 Cargo package version 与 deps.cirru 的 0.2.29，并增加 UTF-8 MD5 单测。
- 将开发工具链固定版本同步到最新 Calcit 0.13.72，同时保留 README 中
  0.13.69+ 的运行时兼容下限。
- 将验证 workflow 的 `GITHUB_TOKEN` 显式限制为只读仓库内容权限。

## English

- Migrate the real `calcit.std.hash/md5` export from a handwritten
  `export_edn_buffer_method_v1!` call to the typed Rust adapter managed by
  `calcit-bindgen 0.1.0`.
- Business code now accepts `&str` and returns `String`; the generated boundary
  owns the symbol, arity, String codec, error path, and buffer-protocol export.
- CI exports Interface IR v2 read-only from the current calcit.cirru and runs a
  Rust-backend stale-binding check without installing the generator from a
  branch or commit hash.
- Align the Cargo package version with deps.cirru 0.2.29 and add a UTF-8 MD5 test.
- Align the development toolchain pin with the latest Calcit 0.13.72 while
  retaining the documented 0.13.69+ runtime compatibility floor.
- Explicitly restrict the validation workflow's `GITHUB_TOKEN` to read-only
  repository contents.
