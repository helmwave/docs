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
mike deploy --push --update-aliases 0.19.x latest
```

## Deploy new branch
- [ ] Sed previous version with new. (0.19.1 -> 0.20.1)
- [ ] Sed previous links (0.19.x -> 0.20.x)
