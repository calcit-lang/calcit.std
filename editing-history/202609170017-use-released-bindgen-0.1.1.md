# 使用已发布的 calcit-bindgen 0.1.1 / Use released calcit-bindgen 0.1.1

## 中文

- 将 CI 从 Interface IR v3 支持分支的临时 Git revision 切换到 crates.io 发布的 `calcit-bindgen 0.1.1`。
- 使用正式发布包重新生成 `generated/ffi/`，让 ownership manifest 记录准确的 generator 版本。
- 更新维护说明与用户文档中的 generator 版本，保持生成物只能通过 bindgen 更新的边界。

## English

- Move CI from the temporary Interface IR v3 Git revision to the crates.io release `calcit-bindgen 0.1.1`.
- Regenerate `generated/ffi/` with the released package so the ownership manifest records the exact generator version.
- Update the maintenance and user documentation while preserving the rule that generated artifacts only change through bindgen.

## 验证 / Verification

- `calcit-bindgen generate generated/ffi/interface.json --out generated/ffi --backend rust`
- `calcit-bindgen check generated/ffi/interface.json --out generated/ffi --backend rust`
- `cargo fmt --check`
- `cargo test`
- `cargo clippy --all-targets -- -D warnings`
