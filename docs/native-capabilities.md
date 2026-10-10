---
title: "Calcit Std native capabilities"
summary: "Choose filesystem, process, time, date, JSON, path, random, and hash APIs while keeping blocking and async host effects explicit"
scope: "module"
kind: "reference"
category: "stdlib"
aliases:
  - "calcit std"
  - "filesystem"
  - "process stream"
  - "timer task"
  - "Ctrl-C"
  - "native capability"
  - "read file by line"
entry_for:
  - "calcit.std.fs"
  - "calcit.std.process"
  - "calcit.std.time"
  - "calcit.std.date"
  - "calcit.std.path"
---

# Calcit Std native capabilities

`calcit.std` groups native host capabilities by namespace. Keep these effects at application boundaries; pure updaters, projection functions, and render functions should receive values rather than invoking filesystem, process, or timer APIs directly.

## Capability map

- `calcit.std.fs`: file reads/writes, directories, globbing, rename, and line iteration.
- `calcit.std.process`: synchronous execution and cancellable streamed output.
- `calcit.std.time`: cancellable timeout and interval tasks.
- `calcit.std.date`: typed Date values, parsing, formatting, extraction, and arithmetic.
- JSON 解析/序列化使用 core 的受审阅边界，不再引用已删除的 `calcit.std.json`；开放解析结果仍须在进入业务层前 decode 到具体类型。
- `calcit.std.path`: platform-aware path composition and inspection.
- `calcit.std.rand` and `calcit.std.hash`: random identifiers and hashing helpers.

## Typed FFI contract pilot

`calcit.std.hash/md5` is the sync-pure reference contract for typed FFI
generation. Its `(String) -> String` logical schema is lowered as a synchronous
`pure-function` over `edn-buffer-v1`, with no callback, resource, or host-state
lifecycle.

```bash
calcit calcit.cirru ffi export --json --ns calcit.std.hash
```

This read-only export gives bindgen a minimal deterministic baseline before it
handles opaque resources and async streams. `md5` remains an ordinary
method-free hashing helper; the contract metadata does not move host effects
into pure application updaters.

`calcit.std.hash/md5` 是 typed FFI generator 的同步纯函数基准契约：逻辑签名
为 `(String) -> String`，通过 `edn-buffer-v1` 同步 lowering，不涉及 callback、
resource 或 host-state 生命周期。该只读导出为后续 opaque resource 与 async
stream 生成提供最小确定性基线。

## Blocking and asynchronous work

`read-file-by-line!` uses the blocking host protocol so callbacks execute on the Calcit host thread. Lines are delivered lazily from a fixed-size reader; the module retains at most the reader buffer and current longest line rather than the full file. Line terminators follow `BufRead::lines` semantics (`\n` and a preceding `\r` are removed), and callback failure or host closing stops the read immediately.

Process streams, timers, and Ctrl-C subscriptions return typed `FfiTask` capabilities. Retain the task when lifecycle control matters and cancel it explicitly during shutdown or reload.

```cirru.no-check
def task $ calcit.std.time/set-interval! 1000 $ fn ()
  println |tick

task.cancel-with! :reload
```

Cancellation stops ordinary events while preserving exactly one terminal completion or failure event. Queue backpressure is bounded; do not treat a pending callback as durable application state.

启动或注册宿主工作使用 `set-timeout!`、`set-interval!` 和 `on-ctrl-c!`。
旧 `set-timeout`、`set-interval`、`on-ctrl-c` 仅保留为同一函数的弃用引用，
不是第二套 scheduler；两种拼写共享具体 callback 签名、`FfiTask` 返回值和宿主 symbol。
保留原任务并在适当的生命周期取消；改名不会增加 callback 次数或改变终止策略。

取消任务使用 `.cancel!` 或携带原因的 `.cancel-with!`，`!` 表示显式资源生命周期操作，
不是失败标记。它们与旧 `.cancel` / `.cancel-with` 指向同一 core 实现，
不改变取消次数、事件顺序或 terminal completion/failure 语义；旧名仅用于迁移兼容。

## Storage boundary

同步读取使用 `calcit.std.fs/read-file/read-dir/walk-dir`，返回具体 `String`
或 `List<String>`，失败沿 native FFI 抛错。`!` 不表示任何可能失败的读取；
旧读取名只是带弃用提示的过渡引用。新旧入口不改宿主 symbol，也不把 native
接口改成 core `FsPath` 的 Result 模型。callback 流式 `read-file-by-line!`
继续保持独立 blocking 契约。

Use filesystem APIs to persist a fully validated serialized value. Write to a snapshot copy during migrations, verify decode/encode equivalence, then replace the live file atomically. Persistent schema evolution belongs to the application, not `calcit.std.fs`.
