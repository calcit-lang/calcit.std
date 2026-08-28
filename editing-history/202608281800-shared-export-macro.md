# 统一共享导出模板 / Shared export template

- 升级到 calcit_native_ffi 0.1.1。
- 同步 native 方法使用共享 C-safe EDN 导出模板，减少模块内重复的解码、panic 隔离、编码与所有权代码。
- 异步或阻塞入口继续保留模块专属生命周期逻辑，并复用共享 adapter。

---

- Upgraded to calcit_native_ffi 0.1.1.
- Routed native methods through the shared C-safe EDN export template, reducing duplicated decoding, panic isolation, encoding, and ownership code.
- Kept module-specific lifecycle logic at async or blocking entry points while continuing to reuse shared adapters.
