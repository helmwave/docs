### `--graph-width`

> Introduced in [:material-tag: v0.27.1](https://github.com/helmwave/helmwave/releases/tag/v0.27.1)


You can change logic of graph rendering by changing this flag.

- 1: `--graph-width=1` - disable graph rendering
- 2: `--graph-width=0` - try to detect max width of ceil by release name
- N<0: `--graph-width=-10` - drop 10 symbols.
- N>1: `--graph-width=10` - show only first 10 symbols.
