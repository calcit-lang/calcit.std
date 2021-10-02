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
```

```cirru
calcit.std.process/execute! a
```

```cirru
calcit.std.json/stringify-json data true

calcit.std.json/parse-json "|{\"a\": [1, 2], \":b\": 3}"
```

```cirru
calcit.std.date/get-time!

calcit.std.date/parse-time "|2014-11-28 21:00:09 +09:00" "|%Y-%m-%d %H:%M:%S %z"

calcit.std.date/format-time 1417176009000 "|%Y-%m-%d %H:%M:%S %z"
```

```cirru
calcit.std.regex/re-matches |2 |\d
calcit.std.regex/re-find |a4 |\d
calcit.std.regex/re-find-index |a1 |\d
calcit.std.regex/re-find-all |123 |\d+
```

### License

MIT
