# TLDR Benchmarks

A collection of benchmarks for the various TLDR implementations.

These benchmarks aim to provide a comparison for one who wants to
choose an implementation based on both performance and simplicity.

## For Mac OS X

| Client                                                                 | Language   | Mean (ms) | Deviation (ms) | Time to update cache | Easy to install |
| ---------------------------------------------------------------------- | ---------- | --------- | -------------- | -------------------- | --------------- |
| [tldr-c-client](https://github.com/tldr-pages/tldr-c-client)           | C          | 135.1     | 41.2           | 00:05.7              | yes             |
| [tlrc](https://github.com/tldr-pages/tlrc)                             | Rust       | 143.9     | 41.5           | 00:02.873            | yes             |
| [tealdeer](https://github.com/tealdeer-rs/tealdeer)                    | Rust       | 165.4     | 71.1           | 00:05.20             | yes             |
| [fast-tldr](https://github.com/gutjuri/fast-tldr)                      | Haskell    | 255.6     | 283.6          | 00:05.537            | no              |
| [tldr-bash](https://github.com/ewels/tldr-bash)                        | BASH       | 293.7     | 68.6           | 00:05.745            | yes             |
| [tldr-python-client](https://github.com/tldr-pages/tldr-python-client) | Python     | 376.5     | 146.0          | 00:02.250            | needs pip       |
| [tldr-node-client](https://github.com/tldr-pages/tldr-node-client)     | JavaScript | 917.2     | 526.6          | 01:47.386            | needs npm       |


## For Ubuntu

Coming soon...
