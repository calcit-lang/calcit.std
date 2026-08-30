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
  - "calcit.std.json"
  - "calcit.std.path"
---

# Calcit Std native capabilities

`calcit.std` groups native host capabilities by namespace. Keep these effects at application boundaries; pure updaters, projection functions, and render functions should receive values rather than invoking filesystem, process, or timer APIs directly.

## Capability map

- `calcit.std.fs`: file reads/writes, directories, globbing, rename, and line iteration.
- `calcit.std.process`: synchronous execution and cancellable streamed output.
- `calcit.std.time`: cancellable timeout and interval tasks.
- `calcit.std.date`: typed Date values, parsing, formatting, extraction, and arithmetic.
- `calcit.std.json`: JSON parsing and formatting at external boundaries.
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
def task $ calcit.std.time/set-interval 1000 $ fn ()
  println |tick

task.cancel-with :reload
```

Cancellation stops ordinary events while preserving exactly one terminal completion or failure event. Queue backpressure is bounded; do not treat a pending callback as durable application state.

## Storage boundary

Use filesystem APIs to persist a fully validated serialized value. Write to a snapshot copy during migrations, verify decode/encode equivalence, then replace the live file atomically. Persistent schema evolution belongs to the application, not `calcit.std.fs`.
