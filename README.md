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

```bash
pip install -r requirements.txt
mike deploy --push --update-aliases 0.16.x latest
```

## Deploy new branch
- [ ] Sed previous version with new. (0.15.1 -> 0.16.0)
- [ ] Sed previous links (0.16.x -> 0.17.x)
