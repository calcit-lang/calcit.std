# C-safe buffer and blocking FFI v1

- Added C-safe buffer protocol v1 adapters for all 30 synchronous native methods.
- Migrated `read-file-by-line!` to blocking protocol v1 with host-owned callback buffers and same-thread callback execution.
- Added size-before-copy descriptor checks, allocator-correct frees, panic containment, malformed payload tests, and a complete exported-symbol audit.
- Removed an unused machine-specific macro fixture that required forbidden compile-time host FFI, and migrated the remaining platform macro to a strict phase-aware contract.
- Replaced unresolved Dynamic/nil debt with a generic `rand-nth`, explicit Unit returns, concrete Date implementation schema, and `Option<String>` formatting.
- Replaced filesystem/process panic paths with structured errors, upgraded Calcit to 0.13.52 and `setup-calcit@v1.3.0`, and established a reviewed static-quality baseline.
- Cleared strict clippy findings introduced by the newer stable toolchain used by GitHub Actions.
- Switched the artifact from Rust `dylib` to self-contained `cdylib`, preventing Linux symbol interposition with a Calcit host built by a different rustc while keeping temporary no-mangle legacy exports available.
- Added a focused traced random-call smoke to diagnose and guard Linux cross-toolchain loading before the full suite.
- Retired the collision-prone legacy Rust-ABI `rand` export after its C-safe replacement landed; exporting a global ELF symbol named `rand` can interpose libc's `rand` on Linux and reinterpret a C call as `Vec<Edn>`.
