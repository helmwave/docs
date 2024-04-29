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

