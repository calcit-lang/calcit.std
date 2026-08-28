## Calcit STD

> Calcit 在 Rust runtime 上的标准原生模块。
>
> Standard native module for Calcit on the Rust runtime.

### Usages

Install to `~/.config/calcit/modules/`, compile and provide dylib file:

```bash
cargo build --release
mkdir -p dylibs/ && cp -v target/release/libcalcit_std.dylib dylibs/ # supported macos only
```

全部 30 个同步原生方法使用 C-safe buffer protocol v1。`read-file-by-line!`
使用 blocking protocol v1，因此回调始终在 Calcit host 线程执行，不会让 Rust
closure 或 EDN 容器跨越 dylib 边界。timer、process output 和 Ctrl+C subscription
使用 async protocol v1，并返回 opaque、可取消的 task capability。

All 30 synchronous native methods use C-safe buffer protocol v1.
`read-file-by-line!` uses blocking protocol v1, so its callback stays on the
Calcit host thread without passing Rust closures or EDN containers across the
dylib boundary. Timers, process output, and Ctrl+C subscriptions use async
protocol v1 and return opaque cancellable task capabilities.

ABI descriptor、buffer ownership、Cirru EDN transport、backpressure 和 adapter
实现统一来自 [`calcit_native_ffi`](https://github.com/calcit-lang/calcit-native-ffi)。
本仓库只保留 std 业务逻辑和少量兼容 wrapper，避免各原生模块复制协议模板。

ABI descriptors, buffer ownership, Cirru EDN transport, backpressure, and
adapters come from
[`calcit_native_ffi`](https://github.com/calcit-lang/calcit-native-ffi). This
repository keeps only std-specific behavior and thin compatibility wrappers,
so native modules do not fork protocol boilerplate.

process output、timer 与 Ctrl+C 普通事件在等待 host queue 时会检查各自的取消
状态，最长 10ms 响应一次；持续 `QUEUE_FULL` 默认 5 秒后失败。terminal
`complete` / `fail` 不应用业务取消 predicate，确保任务可靠收尾。

Ordinary process-output, timer, and Ctrl+C events observe their own
cancellation state while waiting for host queue capacity, with at most 10ms
between checks; persistent `QUEUE_FULL` fails after the default five-second
deadline. Terminal `complete` / `fail` events do not use the business
cancellation predicate, ensuring reliable task cleanup.

维护者在构建并复制 release dylib 后，可运行
`bash scripts/check-c-safe-ffi.sh` 检查所有预期 C entry point。

After building and copying the release dylib, maintainers can run
`bash scripts/check-c-safe-ffi.sh` to verify every expected C entry point, and
`bash scripts/check-c-safe-async.sh` for real timer, process, cancellation, and
Ctrl+C callback paths. Set `CALCIT_STD_MODULE_DIR` when validating an isolated
module copy.

Providing:

```cirru.no-check
calcit.std.fs/read-file! a
calcit.std.fs/write-file! a b
calcit.std.fs/append-file! a b
calcit.std.fs/check-write-file! a b
calcit.std.fs/path-exists? a
calcit.std.fs/read-dir! a
calcit.std.fs/walk-dir! a
calcit.std.fs/glob! |src/*.rs

calcit.std.fs/create-dir! path
calcit.std.fs/create-dir-all! path

calcit.std.fs/rename! from to

calcit.std.fs/read-file-by-line! a $ fn (line) (println line)
```

```cirru.no-check
calcit.std.process/execute! a

def process-task $ calcit.std.process/stream!
  [] |sh |-c "|printf 'ready\\n'; exec sleep 5"
  fn (event) (println event)
  , (%none)

process-task.cancel-with :shutdown
```

```cirru
calcit.std.json/stringify-json ({} (:answer 42)) true

calcit.std.json/parse-json "|{\"a\": [1, 2], \":b\": 3}"
```

Date object is wrapped as `%{} Date {:date <timestamp>}`:

```cirru
calcit.std.date/get-time!
; %{} Date (:date &any-ref)

calcit.std.date/parse-time "|2014-11-28 21:00:09 +09:00" "|%Y-%m-%d %H:%M:%S %z"

calcit.std.date/format-time (calcit.std.date/get-time!) (%some "|%Y-%m-%d %H:%M:%S %z")

calcit.std.date/extract-time $ calcit.std.date/get-time!
; {} (:minute 6) (:hour 16) (:month 11) (:second 48) (:day 10)

calcit.std.date/from-ymd 2021 11 11
; %{} Date (:date 1636560000000)
calcit.std.date/from-ywd 2021 45 6
; %{} Date (:date 1636732800000)

calcit.std.date/add-duration (calcit.std.date/get-time!) 4 :days
```

```cirru
calcit.std.rand/rand
calcit.std.rand/rand 10
calcit.std.rand/rand 10 100 (; "from 10 to 100")

calcit.std.rand/rand-int
calcit.std.rand/rand-int 10
calcit.std.rand/rand-int 10 100 (; "from 10 to 100")

calcit.std.rand/rand-nth ([] 1 2 3)
calcit.std.rand/rand-shift 10 4 (; "10+-4")
calcit.std.rand/rand-between 10 20

calcit.std.rand/nanoid!
calcit.std.rand/nanoid! 9
calcit.std.rand/nanoid! 9 |abcd (; "charset")

calcit.std.rand/rand-hex-color!
```

```cirru.no-check
def timeout-task $ calcit.std.time/set-timeout 1000 $ fn ()
  println |timeout

def interval-task $ calcit.std.time/set-interval 1000 $ fn ()
  println |repeated

interval-task.cancel-with :shutdown
```

```cirru
calcit.std.hash/md5 |content
```

```cirru
calcit.std.path/join-path |a |b |c

calcit.std.path/path-dirname |a/b/c
; |a/b

calcit.std.path/path-basename |a/b/c
; |c
```

### License

MIT
