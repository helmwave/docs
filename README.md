# [docs.helmwave.app](https://docs.helmwave.app)

> The helmwave's docs

## Build

### Local dev

```bash
pip install -r requirements.txt
mkdocs serve
mike serve
```

### Prod

Done automatically via GitHub Actions.
Fresh-created branches will update `latest` symlink, other pushes will just trigger deploy of a corresponding version.

The only thing you need to update is `helmwave` version in:

- [mkdocs.yml](mkdocs.yml): `extra.ver`

