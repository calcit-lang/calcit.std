## Calcit STD

> standard libray for Calcit in Rust runtime.

### Usages

_TODO_

Install to `~/.config/calcit/modules/`, compile and provide dylib file:

```bash
cargo build --release
mkdir dylibs/ && cp -v target/release/libcalcit_std.dylib dylibs/ # supported macos only
```

Providing:

```cirru
calcit.std.fs/read-file!
calcit.std.fs/write-file!
```

### License

MIT
