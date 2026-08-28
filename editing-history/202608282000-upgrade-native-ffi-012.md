# 升级共享 native FFI 0.1.2 / Upgrade shared native FFI to 0.1.2

- 将 calcit_native_ffi 从 0.1.1 升级到 0.1.2。
- 将模块要求的 Calcit 版本同步到 0.13.58。
- 复用共享 host raw ABI contracts，使 Calcit host 与 native module 使用同一套 C ABI 定义。
- 公共 symbol、Cirru EDN payload 与模块业务生命周期保持不变。

---

- Upgraded calcit_native_ffi from 0.1.1 to 0.1.2.
- Synchronized the required Calcit version to 0.13.58.
- Reused the shared host raw ABI contracts so the Calcit host and native modules consume one C ABI definition.
- Kept public symbols, Cirru EDN payloads, and module-specific lifecycles unchanged.
