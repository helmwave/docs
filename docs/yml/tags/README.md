# 🔖 Tags

> It allows you to choose releases for sync


Suppose the `helmwave.yml.tpl` looks like:

```yaml
{% include "helmwave.yml.tpl" %}
```

This command will deploy only `redis-a` & `memcached-a`

```sh
$ helmwave -t a deploy
```

This command will deploy only `redis-a` & `redis-b`

```sh
$ helmwave -t redis deploy
```

This command will deploy only `redis-b`

```sh
$ helmwave -t redis,b deploy
```
