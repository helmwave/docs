# CI_COMMIT_TAG  [ [source] ](https://github.com/helmwave/helmwave.github.io/tree/main/docs/examples/CI_COMMIT_TAG)

## Receipt

Suppose `my-chart` has default `values.yaml`:

```yaml
image:
  repository: registry.gitlab.local/example/app
  tag: v1.0.0
...
```

#### Project Structure

```
.
├── helmwave.yml.tpl
└── values.yml

```

#### `helmwave.yml.tpl`

```yaml
{% include "helmwave.yml.tpl" %}
```

#### `values.yml`

This values will override default values 

```yaml
{% include "values.yml" %}
```

## Deploy

```shell
$ helmwave deploy
```


### CLI analog via helm3

```shell
$ helm upgrade --instal my-release my-chart-repo/my-app --set="image.tag=$CI_COMMIT_TAG" -n my-namespace
```