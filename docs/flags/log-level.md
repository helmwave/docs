### `--log-level`

This option manage how much information you want to get. This modern way instead of verbose (`-vvvvv`) logging.

|                    _                     | `info` (default) | `debug` | `warn` | `fatal` | `panic` | `trace` |
|:----------------------------------------:|:----------------:|:-------:|:------:|:-------:|:-------:|:-------:|
|               general info               |        ✅         |    ✅    |   ✅    |    ✅    |    ✅    |    ✅    |
|           incompatible version           |        ❌         |    ✅    |   ✅    |    ✅    |    ✅    |    ✅    |
|     helm-debug without `--progress`      |        ❌         |    ✅    |   ✅    |    ✅    |    ✅    |    ✅    |
|       helm-debug with `--progress`       |        ✅         |    ✅    |   ✅    |    ✅    |    ✅    |    ✅    |
|       lifecycle hooks `show=true`        |        ✅         |    ✅    |   ✅    |    ✅    |    ✅    |    ✅    |
|       lifecycle hooks `show=false`       |        ❌         |    ✅    |   ✅    |    ✅    |    ✅    |    ✅    |
|               file content               |        ❌         |    ✅    |   ❌    |    ✅    |    ✅    |    ✅    |
| :simple-helm: helm manifests, bug report |        ❌         |    ❌    |   ❌    |    ❌    |    ❌    |    ✅    |
