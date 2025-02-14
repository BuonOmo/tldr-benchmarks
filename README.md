# TLDR Benchmarks

A collection of benchmarks for the various TLDR implementations.

These benchmarks aim to provide a comparison for one who wants to
choose an implementation based on overall performance, installation
time and project maintenance.

## For Mac OS X

| Client                                                                 | Language   | Mean (ms) | Deviation (ms) | Time to Update Cache | Last Commit         | Comment      |
| ---------------------------------------------------------------------- | ---------- | --------- | -------------- | -------------------- | ------------------- | ------------ |
| [fast-tldr](https://github.com/gutjuri/fast-tldr)                      | Haskell    | 145.4     | 59.5           | 00:05.558            | 1 year, 1 month ago | not packaged |
| [tldr-c-client](https://github.com/tldr-pages/tldr-c-client)           | C          | 160.7     | 60.2           | 00:05.400            | 4 months ago        | on brew      |
| [tealdeer](https://github.com/tealdeer-rs/tealdeer)                    | Rust       | 166.9     | 94.1           | 00:06.691            | 5 weeks ago         | on brew      |
| [tlrc](https://github.com/tldr-pages/tlrc)                             | Rust       | 196.3     | 53.9           | 00:03.41             | 6 days ago          | on brew      |
| [tldr-python-client](https://github.com/tldr-pages/tldr-python-client) | Python     | 283.0     | 60.9           | 00:02.492            | 4 months ago        | needs pip    |
| [tldr-bash](https://github.com/ewels/tldr-bash)                        | BASH       | 359.6     | 74.4           | 00:07.382            | 6 years ago         | single file  |
| [tldr-node-client](https://github.com/tldr-pages/tldr-node-client)     | JavaScript | 673.8     | 185.0          | 02:03.361            | 3 weeks ago         | needs npm    |


## For Ubuntu

| Client                                              | Language | Mean (ms) | Deviation (ms) | Time to Update Cache | Last Commit | Comment     |
| --------------------------------------------------- | -------- | --------- | -------------- | -------------------- | ----------- | ----------- |
| [tealdeer](https://github.com/tealdeer-rs/tealdeer) | Rust     | 20.6      | 2.9            | 00:01.530            | 5 weeks ago | on apt      |
| [tldr-bash](https://github.com/ewels/tldr-bash)     | BASH     | 80.2      | 2.6            | 00:01.878            | 6 years ago | single file |

