# Values dependencies

Sometimes we need to include values from another values file. In this case we can use `getValues` function.

```yaml title="helmwave.yml"
{% include "./helmwave.yml" %}
```

```yaml title="values/common.yml"
{% include "./values/common.yml" %}
```

```yaml title="values/nginx.yml"
{% include "./values/nginx.yml" %}
```

```yaml title="values/redis.yml"
{% include "./values/redis.yml" %}
```

In this example we have `values-common.yml` to store some common values independently of the chart. It is defined as a
values file for each release. We use `getValues` function to reference these values.

Rendered values files will look like that:

```yaml title="nginx/common.yml"
{% include "./rendered/nginx/common.yml" %}
```

```yaml title="nginx/nginx.yml"
{% include "./rendered/nginx/nginx.yml" %}
```

```yaml title="redis/common.yml"
{% include "./rendered/redis/common.yml" %}
```

```yaml title="redis/redis.yml"
{% include "./rendered/redis/redis.yml" %}
```

## Cross-release values

> Introduced in [:material-tag: v0.43.0](https://github.com/helmwave/helmwave/releases/tag/v0.43.0)

Starting from v0.43.0, `getValues` also supports fetching rendered values from depending releases.
The depending release must be declared in `depends_on`.

```yaml
{{ $redisValues := getValues "redis@my-namespace" "values/redis.yml" }}
```

See [Cross-release reference](../cross-release-reference/README.md) for a complete example.
