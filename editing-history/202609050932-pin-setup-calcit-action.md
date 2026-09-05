# Pin setup-calcit action / 固定 setup-calcit Action

## English

- Replaced the mutable `calcit-lang/setup-calcit@v1` workflow reference with the immutable commit `704b3f5cd6f9ce3bd1e0c926dbdd1d181adb8180`.
- Verified through the GitHub API that both annotated tags `v1` and `v1.4.0` peel to this commit. This is also the action revision whose behavior passed the Calcit 0.13.77 workflow in PR #60.
- Preserved the existing `tools: calcit,caps` input and all job behavior.

## 中文

- 将可移动的 `calcit-lang/setup-calcit@v1` workflow 引用替换为不可变 commit `704b3f5cd6f9ce3bd1e0c926dbdd1d181adb8180`。
- 已通过 GitHub API 核验注解标签 `v1` 与 `v1.4.0` 均解析到该 commit；PR #60 的 Calcit 0.13.77 workflow 也已使用该 revision 对应行为并通过。
- 保留原有 `tools: calcit,caps` 输入与全部 job 行为。
