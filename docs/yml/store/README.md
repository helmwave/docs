# 🗳️ Store

> It allows pass you custom values to render release.

#### `helmwave.yml.tpl`:

Please note that `my-custom-values.yml` file is common for both helm releases

```yaml 
{% include "helmwave.yml.tpl" %}
```

#### `my-custom-values.yml`:

```yaml
{% include "my-custom-values.yml" %}
```

*Let's generate [plan](https://helmwave.github.io/cli/#planfile-plan)*

```bash
$ helmwave plan
```

Helmwave created plan!

```
.helmwave/
├── my-custom-values.yml.backend@my-ns.plan
└── my-custom-values.yml.frontend@my-ns.plan
```

#### `my-custom-values.yml.frontend@my-ns.plan`

```
{% include ".helmwave/my-custom-values.yml.frontend@my-ns.plan" %}
```


#### `my-custom-values.yml.backend@my-ns.plan`

```
{% include ".helmwave/my-custom-values.yml.backend@my-ns.plan" %}
```

