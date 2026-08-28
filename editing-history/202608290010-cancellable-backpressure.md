# std 可取消背压 / Cancellable std backpressure

## 中文

- 升级已发布的 `calcit_native_ffi 0.1.3`，process、timer 与 Ctrl+C 普通事件统一使用 `publish_emit_until`。
- 增加 process/timer 在持续 `QUEUE_FULL` backlog 中取消并可靠 terminal 的回归测试。

## English

- Upgrade to the published `calcit_native_ffi 0.1.3` and route ordinary process, timer, and Ctrl+C events through `publish_emit_until`.
- Add regressions for cancelling process/timer streams during persistent `QUEUE_FULL` backlog while still publishing terminal events reliably.
