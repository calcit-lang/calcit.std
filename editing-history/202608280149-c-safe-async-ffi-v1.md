# C-safe async FFI v1 for timers, processes, and signals

- Added versioned async C ABI entry points for one-shot timers, coalescible interval streams, process output streams, and Ctrl+C subscriptions.
- Represented cancellation contexts with generation-independent registry IDs rather than Rust pointers; every accepted cancellation publishes one terminal acknowledgement.
- Used condition variables for prompt timer cancellation, serialized stdout/stderr events with child termination, and a single non-blocking signal handler feeding a dispatcher thread.
- Tightened the public Calcit APIs to return cancellable `AnyRef` capabilities, use concrete callback schemas, and accept `Option<String>` for the process working directory via `.unwrap-or`.
- Added malformed-duration, event ordering, process cancellation, and signal cancellation Rust tests plus real Calcit host smoke tests guarded by a ten-second watchdog.
- Made long-lived attached examples cancel their returned task explicitly, and enabled README code-block validation without executing side-effect-only API sketches.
- Expanded the symbol audit from 34 to 38 C-safe exports and reduced the reviewed `typeNotFull` baseline from 16 to 12.
