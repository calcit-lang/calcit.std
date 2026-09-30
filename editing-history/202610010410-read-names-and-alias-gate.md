# 读取命名迁移与类型别名门禁

## 目标与边界

对应 calcit#1457 / 0.28.0：读取入口收敛为 `read-file`、`read-dir`、`walk-dir`；原有带 `!` 的名字保留为 deprecated 源码值别名。写操作及 blocking/async callback 入口不在本次改名范围。Rust native ABI、返回值与抛错语义不变，不把 std 包装成 FsPath 的 Result API。

别名引用完整 Calcit namespace，避免已有 core 同名定义优先级造成误引用；这不是额外 npm/FFI 加载通道。测试同样使用完整名称，避免只验证到 core 的读取实现。

## 验证

已发布的 `0.28.0-alpha.1` 从 crates.io 安装后，9 个 definition `:tests` 通过：文本读取、直接目录、递归目录、三个旧入口和 callback、三个失败路径。失败测试检查原 native ABI export 名，确认真正到达 std。目录结果不依赖文件系统排序。原有 Rust、clippy、caps、public check、文档、生成产物与 release dylib 回归均执行；C-safe timer/process/cancellation/Ctrl+C 回归也通过。

六个新旧入口的 Number 参数都必须在 FFI 前被严格检查拒绝。alpha.1 中三个旧源码别名漏过该检查，独立无 FFI 复现已提交 calcit#1579。本次保留硬性 CI 负例，不以运行时 FFI 报错冒充类型检查，不增加 wrapper 或 Dynamic 豁免。修复后的精确发布版本与消费者复验完成前，本迁移只能作为 draft，不能合并或声明完成。

## 后续

先修复共同源码别名调用检查，再升级本仓库至包含修复的已发布版本，并重新执行所有门禁。旧名字的移除窗口需与 core 兼容策略和真实消费者升级一起确定，本次不删除。
