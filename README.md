# Calcit STD

Calcit Rust runtime 的标准原生模块。

## 对使用者的影响

**0.2.47 候选配对正式 Calcit 0.32.1**。下游需固定验收后实际发布的新 tag，并在目标平台重新构建 dylib；候选不等于已发布版本，旧 tag 不移动。
这是 native 模块，不添加 npm runtime 或 JS 工具链，也不承诺仅凭 Linux CI 覆盖所有平台 ABI。

本轮 Snapshot、65 个定义的实现和语义 schema、原断言、Rust 业务逻辑与依赖保持。
模块/Cargo 版本配对更新，原 `calcit-bindgen 0.1.1` 重新生成管理产物的包版本和摘要；Rust adapter 仅版本注释变化，不手改生成文件。
不修改文件系统、进程、定时器、返回类型、C-safe ABI 协议或失败行为，不新增改写规则、预算和校验脚本。

从 0.31 或更早版本升级的消费者仍需注意 0.32 的 native `identical?` 对容器采用身份比较，与 JS 对齐；比较内容使用 `=`。
独立 first/get 得到的 Option 不代表相同包装对象，必要时先解包再比较元素身份，详见 [0.32 迁移说明](https://github.com/calcit-lang/calcit/blob/0.32.0/docs/run/upgrade.md)。

## 工具链与验证

精确 CLI/模块版本见 `deps.cirru`，安装构建使用 `--locked`，不在消费者安装时隐式修改 Cargo.lock。
旧兼容别名和弃用迁移窗口保留，不因本次 patch 配对删除仍被下游使用的入口。

本地已通过原门禁：Rust fmt、12 项 Rust 测试、严格 clippy、release dylib、38 个 C-safe 导出符号、Caps strict、67 个全定义、完整 strict、53 个公开定义及 stream-process 入口检查。
65 个源码定义均为完整类型，未解决 Dynamic/弃用调用为零；不以这些计数代替严格检查。
原17项文件系统附带测试、3项生命周期别名测试、六种非法读取参数在 FFI 前被拒绝、文档与异步示例、原定时器/进程取消/Ctrl+C 回归，以及独立新夹具中的默认 native 回归通过。
这些运行证据限定于实际构建平台；Linux 结果以候选精确提交的原 CI 为准。

```sh
caps --strict --ci
cargo fmt --check
cargo test --locked
cargo clippy --locked --all-targets -- -D warnings
bash build.sh
calcit --check-only --all-defs
calcit fix --workflow strict --verify
calcit test --tag filesystem --require-match
calcit test --tag lifecycle --require-match
bash scripts/check-c-safe-ffi.sh
bash scripts/check-c-safe-async.sh
```

默认 `calcit calcit.cirru` 还运行原文件系统/日期/随机/路径回归和 Demo；其文件夹操作写入测试用的 target 路径，重复运行应准备干净测试夹具。
完整原门禁、FFI contract check、文档/示例与负参数检查见 [工作流](.github/workflows/check.yaml)，没有新增验证入口。

## Usages

在目标平台安装并构建 native dylib：

```sh
caps --strict --ci
bash build.sh
```

原构建脚本使用 release/locked，并复制当前平台的库到 `dylibs`；macOS 为 `.dylib`，Linux 为 `.so`。

全部 30 个同步原生方法使用 C-safe buffer protocol v1。`read-file-by-line!`
使用 blocking protocol v1，因此回调始终在 Calcit host 线程执行，不会让 Rust
closure 或 EDN 容器跨越 dylib 边界。timer、process output 和 Ctrl+C subscription
使用 async protocol v1，并返回 opaque、可取消的 task capability。

All 30 synchronous native methods use C-safe buffer protocol v1.
`read-file-by-line!` uses blocking protocol v1, so its callback stays on the
Calcit host thread without passing Rust closures or EDN containers across the
dylib boundary. Timers, process output, and Ctrl+C subscriptions use async
protocol v1 and return opaque cancellable task capabilities.

`read-file-by-line!` 通过固定大小 `BufReader` 立即逐行调用 callback，不再先把
完整文件收集到内存；峰值为 O(reader buffer + longest line)。行为与 Rust
`BufRead::lines` 一致：移除 `\n` 以及其前面的 `\r`。callback error、task
closing 或 host rejection 会立即停止后续读取。

`read-file-by-line!` invokes the callback immediately for each line through a
fixed-size `BufReader` instead of collecting the complete file first. Peak
memory is O(reader buffer + longest line). Matching `BufRead::lines`, it removes
the trailing `\n` and an immediately preceding `\r`. Callback errors, task
closing, and host rejection stop further reads immediately.

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

工具链使用 `deps.cirru` 声明的精确已发布 Calcit 版本。项目在默认严格模式下保持零类型债务，不使用
`--compat-types`；可选参数使用 `Option`，集合 schema 均声明具体元素类型。

Ordinary process-output, timer, and Ctrl+C events observe their own
cancellation state while waiting for host queue capacity, with at most 10ms
between checks; persistent `QUEUE_FULL` fails after the default five-second
deadline. Terminal `complete` / `fail` events do not use the business
cancellation predicate, ensuring reliable task cleanup.

`calcit.std.hash/md5` 已使用 `calcit-bindgen 0.1.1` 的 managed Rust adapter，
不再手写 symbol、arity、EDN codec 或 buffer export。维护者可只读导出类型化
contract，并检查仓库内 generated artifact 是否过期：

```bash
mkdir -p target/ffi-interface
calcit calcit.cirru ffi export --format json --ns calcit.std.hash > target/ffi-interface/calcit-std-hash.json
calcit-bindgen check target/ffi-interface/calcit-std-hash.json --out generated/ffi --backend rust
```

`calcit.std.hash/md5` now uses the managed Rust adapter from
`calcit-bindgen 0.1.1`; its symbol, arity, EDN codec, and buffer export are no
longer handwritten. CI exports the typed contract and rejects stale generated
artifacts with the commands above.

维护者在构建并复制 release dylib 后，可运行
`bash scripts/check-c-safe-ffi.sh` 检查所有预期 C entry point。

After building and copying the release dylib, maintainers can run
`bash scripts/check-c-safe-ffi.sh` to verify every expected C entry point, and
`bash scripts/check-c-safe-async.sh` for real timer, process, cancellation, and
Ctrl+C callback paths. Set `CALCIT_STD_MODULE_DIR` when validating an isolated
module copy.

Providing:

```cirru.no-check
calcit.std.fs/read-file a

calcit.std.fs/write-file! a b

calcit.std.fs/append-file! a b

calcit.std.fs/check-write-file! a b

calcit.std.fs/path-exists? a

calcit.std.fs/read-dir a

calcit.std.fs/walk-dir a

calcit.std.fs/glob! |src/*.rs

calcit.std.fs/create-dir! path

calcit.std.fs/create-dir-all! path

calcit.std.fs/rename! from to

calcit.std.fs/read-file-by-line! a $ fn (line) (println line)
```

同步读取首选 `read-file/read-dir/walk-dir`，不是因为可能失败就加 `!`。
它们仍经由相同 native C-safe ABI，返回 `String/List<String>`，失败抛错，
不是 core `FsPath` 的 Result 接口。旧 `read-file!/read-dir!/walk-dir!` 标记
弃用并保留为实现引用，迁移窗口与真实消费者门禁完成前不删除。
`read-file-by-line!` 逐行执行调用方 callback，是单独的 blocking 协议；本批不改名
或改变它的取消、错误和内存行为。目录读取不承诺顺序。

现有 CLI 可查询具体模块入口并执行附带语义测试：

```bash
calcit calcit.cirru query context calcit.std.fs/read-file --format edn
calcit calcit.cirru test --tag filesystem --require-match
```

部署前固定匹配的已发布 CLI，不把本地 unreleased 编译产物当正式兼容证据。

```cirru.no-check
calcit.std.process/execute! ([] |ls |-la) (Option :none)

def process-task $ calcit.std.process/stream! ([] |sh |-c "|printf 'ready\\n'; exec sleep 5")
  fn (event) (println event)
  Option :none

process-task.cancel-with! :shutdown
```

JSON parsing and serialization now use the Calcit core APIs directly:

```cirru
json-stringify $ {} $ :answer 42

json-parse "|{\"a\": [1, 2], \"b\": 3}"
```

The former `calcit.std.json` wrappers were removed because their open Dynamic
parse result cannot satisfy a zero-debt library contract. Use the reviewed core
boundary and decode external data into a closed type before business logic.

Date values are represented as `%{} Date0 {:date <timestamp-ms>}`:

```cirru
calcit.std.date/get-time!

; %{} Date0 $ :date 1735689600000

calcit.std.date/parse-time "|2014-11-28 21:00:09 +09:00" "|%Y-%m-%d %H:%M:%S %z"

calcit.std.date/format-time (calcit.std.date/get-time!) (Option :some "|%Y-%m-%d %H:%M:%S %z")

calcit.std.date/extract-time $ calcit.std.date/get-time!

; {} (:minute 6) (:hour 16) (:month 11) (:second 48) (:day 10)

calcit.std.date/from-ymd 2021 11 11

; %{} Date0 $ :date 1636560000000

calcit.std.date/from-ywd 2021 45 6

; %{} Date0 $ :date 1636732800000

calcit.std.date/add-duration (calcit.std.date/get-time!) 4 :days
```

```cirru
calcit.std.rand/rand (Option :none) (Option :none)

calcit.std.rand/rand (Option :some 10) (Option :none)

calcit.std.rand/rand (Option :some 10) (Option :some 100) (; "from 10 to 100")

calcit.std.rand/rand-int (Option :none) (Option :none)

calcit.std.rand/rand-int (Option :some 10) (Option :none)

calcit.std.rand/rand-int (Option :some 10) (Option :some 100) (; "from 10 to 100")

calcit.std.rand/rand-nth $ [] 1 2 3

calcit.std.rand/rand-shift 10 4 $ ; 10+-4

calcit.std.rand/rand-between 10 20

calcit.std.rand/nanoid! (Option :none) (Option :none)

calcit.std.rand/nanoid! (Option :some 9) (Option :none)

calcit.std.rand/nanoid! (Option :some 9) (Option :some |abcd) (; charset)

calcit.std.rand/rand-hex-color!
```

```cirru.no-check
def timeout-task $ calcit.std.time/set-timeout! 1000 $ fn () (println |timeout)

def interval-task $ calcit.std.time/set-interval! 1000 $ fn () (println |repeated)

interval-task.cancel-with! :shutdown
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

For a searchable capability map and lifecycle guidance, use
`calcit docs read native-capabilities.md --module calcit.std` after
the module is installed.

MIT
