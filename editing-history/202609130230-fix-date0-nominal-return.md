# Fix `Date0` nominal return typing / 修复 `Date0` 具名返回类型

Use the nominal `Date0` constructor in `get-time!` so strict consumers retain the declared struct identity instead of inferring an anonymous struct.

在 `get-time!` 中使用具名 `Date0` 构造器，确保严格类型消费者保留声明的 Struct 身份，而不是推断为匿名 Struct。

Regenerate the managed FFI interface artifacts for the `0.2.32` package version.

同时为 `0.2.32` 包版本重新生成受管理的 FFI 接口产物。
