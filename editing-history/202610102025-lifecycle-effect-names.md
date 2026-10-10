# 定时器和信号订阅的效果命名

`set-timeout!`、`set-interval!`、`on-ctrl-c!` 表示启动或注册宿主工作，与既有
`FfiTask .cancel!/.cancel-with!` 保持一致。`!` 不是失败标记；参数、具体 callback
签名、任务返回类型、native symbol、事件队列、取消与退出策略均不改变。

维护者明确授权人工审阅后的受保护迁移。由于原示例经过 `let` 宏，自动语义改名
保留了审阅边界；本次通过官方 CLI 的 dry-run 和 definition-scoped revision 事务
建立新入口，将旧名改为带 `:deprecated` 的同一函数引用，并更新实际调用和示例。
不增加 wrapper、unsafe、Dynamic 或新迁移规则，不删除旧入口。

原日期测试还有四处 `w-log`，用现有、已证明同契约的 `core-macro-alias-v1`
和 revision 守卫迁移为 `dbg`，保留原表达式和测试预期。

验证复用三个 Calcit 附带的引用相等测试、原 timer/process/Ctrl+C smoke、
全部附带测试、公开定义严格检查、零类型债务、文档、C-safe exports 与实际 dylib。
工具链固定正式 Calcit alpha.27；模块版本仍保持 0.2.39，发布时再同步升级。
