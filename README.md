## Calcit STD

> standard libray for Calcit in Rust runtime.

### Usages

Install to `~/.config/calcit/modules/`, compile and provide dylib file:

```bash
cargo build --release
mkdir dylibs/ && cp -v target/release/libcalcit_std.dylib dylibs/ # supported macos only
```

Providing:

```cirru
calcit.std.fs/read-file! a
calcit.std.fs/write-file! a b
calcit.std.fs/path-exists? a
calcit.std.fs/read-dir? a

calcit.std.process/execute! a
```

### License

MIT
