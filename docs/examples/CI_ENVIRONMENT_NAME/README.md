# CI_ENVIRONMENT_NAME [ [source] ](https://github.com/helmwave/helmwave.github.io/tree/main/docs/examples/CI_ENVIRONMENT_NAME)

#### Project structure

```
.
├── helmwave.yml.tpl
└── values
    ├── _.yml
    ├── prod.yml
    └── stage.yml
```

#### `helmwave.yml.tpl`


```yaml
{% include "helmwave.yml.tpl" %}
```

#### `_.yml`

```yaml
{% include "values/_.yml" %}
```

#### `prod.yml`

```yaml
{% include "values/prod.yml" %}
```

#### `stage.yml`

```yaml
{% include "values/stage.yml" %}
```