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
calcit.std.fs/check-write-file! a b
calcit.std.fs/path-exists? a
calcit.std.fs/read-dir! a

calcit.std.fs/create-dir! path
calcit.std.fs/create-dir-all! path

calcit.std.fs/rename! from to
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

calcit.std.date/extract-time (get-time!)
; {} (:minute 6) (:hour 16) (:month 11) (:second 48) (:day 10)

calcit.std.date/from-ymd 2021 11 11
; ([] :single 1636560000000)
calcit.std.date/from-ywd 2021 45 6)
; ([] :single 1636732800000)
```

```cirru
calcit.std.regex/re-matches |2 |\d
calcit.std.regex/re-find |a4 |\d
calcit.std.regex/re-find-index |a1 |\d
calcit.std.regex/re-find-all |123 |\d+
```

```cirru
calcit.std.rand/rand
calcit.std.rand/rand 10
calcit.std.rand/rand 10 100 (; "from 10 to 100")

calcit.std.rand/rand-int
calcit.std.rand/rand-int 10
calcit.std.rand/rand-int 10 100 (; "from 10 to 100")

calcit.std.rand/rand-nth ([] 1 2 3)
calcit.std.rand/rand-shift 10 4 (; "10+-4")
calcit.std.rand/rand-between 10 20

calcit.std.rand/nanoid!
calcit.std.rand/nanoid! 9
calcit.std.rand/nanoid! 9 |abcd (; "charset")

calcit.std.rand/rand-hex-color!
```

```cirru
calcit.std.time/set-timeout 1000 $ fn ()
  println |timeout

calcit.std.time/set-interval 1000 $ fn ()
  println |repeated
```

```cirru
calcit.std.hash/md5 |content
```

```cirru
calcit.std.path/join-path & xs

calcit.std.path/path-dirname |a/b/c
; |a/b

calcit.std.path/path-basename |a/b/c
; |c
```

### License

MIT
