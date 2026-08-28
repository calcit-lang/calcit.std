# 使用共享 native FFI 基础模块 / Adopt the shared native FFI foundation

## 中文

- 使用 `calcit_native_ffi 0.1.0` 提供 C-safe buffer、async 和 blocking ABI。
- 删除 `src/ffi.rs` 中重复的 descriptor、buffer ownership、Cirru EDN 编解码和 adapter 模板，只保留 std 调用点需要的薄兼容层。
- 保持现有导出符号、status code、无限重试 backpressure 策略和业务行为不变。
- 补充中英双语维护边界和验证说明。
- 将真实 async smoke 从过时的 snapshot 后置参数迁移到当前 `calcit eval --dep -- <snippet>` CLI，确保模块加载后仍实际执行测试表达式。
- 为 async callback 补充显式 Unit 返回，并允许 smoke 通过 `CALCIT_STD_MODULE_DIR` 验证隔离模块副本。

## English

- Use `calcit_native_ffi 0.1.0` for the C-safe buffer, async, and blocking ABI.
- Remove duplicated descriptor, buffer ownership, Cirru EDN codec, and adapter boilerplate from `src/ffi.rs`, retaining only thin wrappers required by std call sites.
- Preserve exported symbols, status codes, the unbounded retry backpressure policy, and existing behavior.
- Document the maintenance boundary and verification workflow in Chinese and English.
- Migrate the real async smoke from the obsolete snapshot-trailing form to the current `calcit eval --dep -- <snippet>` CLI, ensuring the test expression is executed after loading the module.
- Give async callbacks explicit Unit returns and let the smoke validate an isolated module copy through `CALCIT_STD_MODULE_DIR`.
