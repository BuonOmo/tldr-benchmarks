# TLDR Benchmarks

A collection of benchmarks for the various TLDR implementations.

These benchmarks aim to provide a comparison for one who wants to
choose an implementation based on both performance and simplicity.

## For Mac OS X

| Client                                                                 | Language   | Mean (ms) | Deviation (ms) | Time to Update Cache | Comment      |
| ---------------------------------------------------------------------- | ---------- | --------- | -------------- | -------------------- | ------------ |
| [tealdeer](https://github.com/tealdeer-rs/tealdeer)                    | Rust       | 139.6     | 48.9           | 00:05.554            | on brew      |
| [tlrc](https://github.com/tldr-pages/tlrc)                             | Rust       | 140.6     | 46.3           | 00:03.111            | on brew      |
| [fast-tldr](https://github.com/gutjuri/fast-tldr)                      | Haskell    | 141.8     | 68.2           | 00:04.587            | not packaged |
| [tldr-c-client](https://github.com/tldr-pages/tldr-c-client)           | C          | 152.5     | 40.6           | 00:04.359            | on brew      |
| [tldr-python-client](https://github.com/tldr-pages/tldr-python-client) | Python     | 269.7     | 44.0           | 00:02.144            | needs pip    |
| [tldr-bash](https://github.com/ewels/tldr-bash)                        | BASH       | 314.1     | 64.4           | 00:05.861            | single file  |
| [tldr-node-client](https://github.com/tldr-pages/tldr-node-client)     | JavaScript | 530.0     | 106.3          | 01:42.680            | needs npm    |


## For Ubuntu

| Client                                              | Language | Mean (ms) | Deviation (ms) | Time to Update Cache | Comment     |
| --------------------------------------------------- | -------- | --------- | -------------- | -------------------- | ----------- |
| [tealdeer](https://github.com/tealdeer-rs/tealdeer) | Rust     | 18.2      | 2.4            | 00:01.426            | on apt      |
| [tldr-bash](https://github.com/ewels/tldr-bash)     | BASH     | 78.2      | 0.7            | 00:01.686            | single file |

