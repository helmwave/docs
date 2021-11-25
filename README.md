# [helmwave.github.io/docs](https://helmwave.github.io/docs)

> The helmwave's docs


## Build


### Local dev

```bash
pip install -r requirements.txt
mkdocs serv
```

### Prod

```bash
pip install -r requirements.txt
mike deploy --push 0.12.x
```

## Deploy new branch
- [ ] Sed previous version with new. (0.15.1 -> 0.16.0)
- [ ] Sed previous links (0.16.x -> 0.17.x)
