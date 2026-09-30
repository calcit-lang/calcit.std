# 读取命名迁移与类型别名门禁

## 目标与边界

对应 calcit#1457 / 0.28.0：读取入口收敛为 `read-file`、`read-dir`、`walk-dir`；原有带 `!` 的名字保留为 deprecated 源码值别名。写操作及 blocking/async callback 入口不在本次改名范围。Rust native ABI、返回值与抛错语义不变，不把 std 包装成 FsPath 的 Result API。

别名引用完整 Calcit namespace，避免已有 core 同名定义优先级造成误引用；这不是额外 npm/FFI 加载通道。测试同样使用完整名称，避免只验证到 core 的读取实现。

## 验证

已发布的 `0.28.0-alpha.1` 从 crates.io 安装后，9 个 definition `:tests` 通过：文本读取、直接目录、递归目录、三个旧入口和 callback、三个失败路径。失败测试检查原 native ABI export 名，确认真正到达 std。目录结果不依赖文件系统排序。原有 Rust、clippy、caps、public check、文档、生成产物与 release dylib 回归均执行；C-safe timer/process/cancellation/Ctrl+C 回归也通过。

六个新旧入口的 Number 参数都必须在 FFI 前被严格检查拒绝。alpha.1 中三个旧源码别名漏过该检查，独立无 FFI 复现已提交 calcit#1579。本次保留硬性 CI 负例，不以运行时 FFI 报错冒充类型检查，不增加 wrapper 或 Dynamic 豁免。修复后的精确发布版本与消费者复验完成前，本迁移只能作为 draft，不能合并或声明完成。

## alpha.2 发布包复验

calcit#1580 修复合并且精确 main 门禁成功后，已从 crates.io 安装 `calcit 0.28.0-alpha.2`，而非继续使用显示 alpha.1 的源码候选。依赖、CI 和版本说明同时更新到 alpha.2。9 个文件系统附带测试通过，六个新旧入口的 Number 参数全部在预处理阶段报告 `W_FN_ARG_TYPE_MISMATCH`；旧 alias 的源表达式仍保留 `read-file!/read-dir!/walk-dir!`，不以原函数名覆盖 caller 信息。

实际发布 CLI 上严格入口、零类型债务、全部 15 个公开 filesystem 定义检查、bindgen stale check、38 个 native ABI export、默认 native 程序、C-safe timer/process/cancellation/Ctrl+C、文档与五组 async/blocking 示例均通过。12 个 Rust host/ownership 测试、fmt 和 all-target clippy 也通过。保留最新 PR HEAD 的远程 CI/review 合并门禁；本记录不宣称整个 0.28 milestone 完成。

review 的 CI 安全意见按本仓库 checkout/Rust action 的既有不可变约定处理：setup action 固定正式 `v1.5.0` 注释 tag peel 后的 commit `ca701be5a471759e442aa053cd100720bbe1f09f`，并保留版本说明。已核对正式 Release、tag object 与 commit；该 SHA 仅用于 action 执行完整性，不代替 Calcit 依赖的精确已发布版本，也不使用未发布源码。修改后重新等待最新 HEAD CI/review。

## 后续

先修复共同源码别名调用检查，再升级本仓库至包含修复的已发布版本，并重新执行所有门禁。旧名字的移除窗口需与 core 兼容策略和真实消费者升级一起确定，本次不删除。
