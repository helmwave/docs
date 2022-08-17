# [helmwave.github.io/docs](https://helmwave.github.io/docs)

> The helmwave's docs


## Build


### Local dev

```bash
pip install -r requirements.txt
mkdocs serve
mike serve
```

### Prod

Done automatically via GitHub Actions. Fresh created branches will update `latest` symlink, other pushes will just trigger deploy of corresponding version.

The only thing you need to update is helmwave version in:

- [examples](docs/examples)
- [docs/tpl.md](docs/tpl.md)
- [docs/install.md](docs/install.md)
- [docs/cli.md](docs/cli.md)
- [docs/yaml.md](docs/yaml.md)
- [docs/ci.md](docs/ci.md)