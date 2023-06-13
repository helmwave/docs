# Single app multi envs

When we work with helm, sometimes we need dynamics chose environment.

```shell
export CI_ENVIRONMENT_NAME=stage
helm upgrade --install my-release my-chart-repo/my-chart-app -f values/_.yml -f values/$CI_ENVIRONMENT_NAME.yaml
```

**Project structure**

```
.
├── helmwave.yml.tpl
└── values
    ├── _.yml
    ├── prod.yml
    ├── qa.yml
    └── stage.yml
```

`cat helmwave.yml.tpl`

```yaml
{% include "helmwave.yml.tpl" %}
```

`cat values/_.yml`

```yaml
{% include "values/_.yml" %}
```

`cat values/prod.yml`

```yaml
{% include "values/prod.yml" %}
```

`cat values/qa.yml`

```yaml
{% include "values/qa.yml" %}
```

`cat values/stage.yml`

```yaml
{% include "values/stage.yml" %}
```

**Run**

```shell
export CI_ENVIRONMENT_NAME=stage
helmwave yml
helmwave build
helmwave up
```

or in one command 

```shell
helmwave up --build --yml
```
