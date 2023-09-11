# Disable templating

Sometimes we need to disable templating values. For example, prometheus rules.

```yaml title="helmwave.yml"
{% include "./helmwave.yml" %}
```


```yaml title="values.yml"
{% include "./values.yml" %}
```
