---
ignore_macros: true
---

# Delimiter flags for values

Sometimes we need to include strings in values that will be templated by :simple-helm: helm itself (via `tpl` function). In this case we can change helmwave delimiters, so it won't render foreign expressions.

`cat values.yml`

```yaml
{% include "values.yml" %}
```

`cat helmwave.yml`
```yaml
{% include "helmwave.yml" %}
```
