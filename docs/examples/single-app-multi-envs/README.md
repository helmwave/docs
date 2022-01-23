# Single app multi envs

> [ [source] ](https://github.com/helmwave/docs/tree/0.16.x/docs/examples/single-app-multi-envs)

When we work with helm sometimes we need dynamics chose environment.

```shell
export CI_ENVIRONMENT_NAME=stage
helm upgrade --install my-release my-chart-repo/my-chart-app -f values/_.yml -f values/$CI_ENVIRONMENT_NAME.yaml
```


## Project structure

```
.
├── helmwave.yml.tpl
└── values
    ├── _.yml
    ├── prod.yml
    ├── qa.yml
    └── stage.yml
```

`helmwave.yml.tpl`


```yaml
{% include "helmwave.yml.tpl" %}
```

 `_.yml`

```yaml
{% include "values/_.yml" %}
```

 `prod.yml`

```yaml
{% include "values/prod.yml" %}
```

 `qa.yml`

```yaml
{% include "values/qa.yml" %}
```

`stage.yml`

```yaml
{% include "values/stage.yml" %}
```

## Run

```shell
export CI_ENVIRONMENT_NAME=stage
helmwave yml
helmwave build
helmwave up
```

or one command 

```
helmwave up --build --yml
```
