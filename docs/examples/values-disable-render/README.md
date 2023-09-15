# Disable templating

> Introduced in [:material-tag: v0.20.0](https://github.com/helmwave/helmwave/releases/tag/v0.20.0) as `render: false`

> Changed in [:material-tag: v0.32.0](https://github.com/helmwave/helmwave/releases/tag/v0.32.0) as `renderer: copy`

Sometimes we need to disable templating values. For example, prometheus rules.

```yaml title="helmwave.yml"
{% include "./helmwave.yml" %}
```


```yaml title="values.yml"
{% include "./values.yml" %}
```
