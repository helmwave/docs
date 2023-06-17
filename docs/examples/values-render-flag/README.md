---
ignore_macros: true
---

# Render flag for values

Sometimes we need to disable render values. For example prometheus rules.

`cat values.yml`

```yaml
{% include "values.yml" %}
```

`cat helmwave.yml`
```yaml
{% include "helmwave.yml" %}
```
