# Render flag for values

> [ [Source] ](https://github.com/helmwave/docs/tree/0.21.x/docs/examples/values-render-flag)

Sometimes we need to disable render values. For example prometheus rules.

`cat values.yml`

```yaml
{% include "values.yml" %}
```


`cat helmwave.yml`
```yaml
{% include "helmwave.yml" %}
```
