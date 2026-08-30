# True line streaming for files / 文件真实逐行流式读取

## 中文

- 将 `read-file-by-line!` 从“先收集完整文件再逐行回调”改为通过固定大小 `BufReader` 边读边回调，峰值内存从 O(file size) 降为 O(reader buffer + longest line)。
- 保持 `BufRead::lines` 语义：移除行尾 `\n` 以及其前面的 `\r`；callback error、task closing 或 host rejection 会立即停止读取。
- 新增 CRLF/LF 行语义、callback 失败后不再读取，以及 1,000,000 行常量内存生成器压力测试。
- 将 Calcit callback 类型由 `Dynamic` 收紧为 `Fn(String) -> Unit`，升级最低 Calcit 版本至包含 blocking Unit transport 修复的 `0.13.68`，并在 Actions 中执行公开 API example。
- 公开 API 回归暴露并验证了 Calcit blocking callback 的 Unit/EDN 传输修复（calcit#536）；example 同时按 `first` 的 typed `Option` 返回值断言。

## English

- Change `read-file-by-line!` from collecting the complete file before callbacks to invoking callbacks while reading through a fixed-size `BufReader`, reducing peak memory from O(file size) to O(reader buffer + longest line).
- Preserve `BufRead::lines` semantics by removing trailing `\n` and a preceding `\r`; callback errors, task closing, and host rejection stop reading immediately.
- Add coverage for CRLF/LF semantics, no further reads after callback failure, and a 1,000,000-line constant-memory generated-input stress case.
- Tighten the Calcit callback type from `Dynamic` to `Fn(String) -> Unit`, raise the minimum Calcit version to `0.13.68` with the blocking Unit transport fix, and execute the public API example in Actions.
- The public API regression exposed and validates the Calcit blocking callback Unit/EDN transport fix (calcit#536); the example also asserts the typed `Option` result returned by `first`.
