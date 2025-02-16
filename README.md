# TLDR Benchmarks

A collection of benchmarks for the various TLDR implementations.

These benchmarks aim to provide a comparison for one who wants to
choose an implementation based on overall performance, installation
time and project maintenance.

## For Mac OS X

| Client                                                                 | Language   | Time to show `tar` page (mean ± σ) | Time to Generate Cache | Time to check for cache update (mean ± σ) | Last Commit         | Comment      |
| ---------------------------------------------------------------------- | ---------- | ---------------------------------- | ---------------------- | ----------------------------------------- | ------------------- | ------------ |
| [tealdeer](https://github.com/tealdeer-rs/tealdeer)                    | Rust       | 152.0 ms ± 53.4                    | 00:05.45               | 5462.7 ms ± 381.2                         | 5 weeks ago         | on brew      |
| [fast-tldr](https://github.com/gutjuri/fast-tldr)                      | Haskell    | 171.1 ms ± 57.0                    | 00:06.971              | 5023.3 ms ± 578.5                         | 1 year, 1 month ago | not packaged |
| [tlrc](https://github.com/tldr-pages/tlrc)                             | Rust       | 206.6 ms ± 228.4                   | 00:02.872              | 658.4 ms ± 69.8                           | 2 days ago          | on brew      |
| [tldr-c-client](https://github.com/tldr-pages/tldr-c-client)           | C          | 234.6 ms ± 119.0                   | 00:04.44               | 3726.2 ms ± 375.7                         | 4 months ago        | on brew      |
| [tldr-bash](https://github.com/ewels/tldr-bash)                        | BASH       | 238.4 ms ± 35.8                    | 00:05.337              | 825.4 ms ± 182.0                          | 6 years ago         | single file  |
| [tldr-python-client](https://github.com/tldr-pages/tldr-python-client) | Python     | 300.9 ms ± 50.4                    | 00:02.771              | 1423.0 ms ± 127.5                         | 4 months ago        | needs pip    |
| [tldr-node-client](https://github.com/tldr-pages/tldr-node-client)     | JavaScript | 966.0 ms ± 414.1                   | 02:01.11               | 96950.0 ms ± 4431.6                       | 3 weeks ago         | needs npm    |


## For Ubuntu

| Client                                              | Language | Time to show `tar` page (mean ± σ) | Time to Generate Cache | Time to check for cache update (mean ± σ) | Last Commit | Comment     |
| --------------------------------------------------- | -------- | ---------------------------------- | ---------------------- | ----------------------------------------- | ----------- | ----------- |
| [tealdeer](https://github.com/tealdeer-rs/tealdeer) | Rust     | 18.0 ms ± 1.3                      | 00:01.404              | 1939.0 ms ± 8.9                           | 5 weeks ago | on apt      |
| [tldr-bash](https://github.com/ewels/tldr-bash)     | BASH     | 78.5 ms ± 2.7                      | 00:02.13               | 603.0 ms ± 10.6                           | 6 years ago | single file |

