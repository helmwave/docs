## Managed environments for an app

```yaml
version: 0.16.0

.options: &options
  wait: true
  namespace: test

releases:
  - name: app
    chart:
      name: charts/backend
    <<: *options
    tags:
      - app
      - product
    values:
      # all products & all envs
      - values/product/_/_.yml
      # all products & an env
      - values/product/_/{{ requiredEnv "CI_ENVIRONMENT" }}.yml
      # a product & all envs
      - values/product/app/_.yml
      # a product & an env
      - values/product/app/{{ requiredEnv "CI_ENVIRONMENT" }}.yml
```

This example does something similar to this

```bash
export CI_ENVIRONMENT=stage

helm upgrade --install app charts/backend \
   --namespace test --wait \
   -f values/product/_/_.yml \
   -f values/product/_/$CI_ENVIRONMENT.yml \
   -f values/product/app/_.yml \
   -f values/product/app/$CI_ENVIRONMENT.yml
```


## Git tag –> Docker image tag

> Pass git tag to docker image tag

default values:

```yaml
image:
  repository: registry.gitlab.local/example/app
  tag: latest
```

Create 2 files `helmwave.yml` and `my-values.yml`.

`helmwave.yml`

```yaml
releases:
- name: my-release
  namespace: default
  chart: 
    name: my-chart-repo/my-chart-app
  values:
    - my-values.yml
```

`my-values.yml`

```yaml
image:
  tag: {{ env "CI_COMMIT_TAG" }}
```

## How to use secret manager?

**Step 1. Create next secret**

```bash
aws secretsmanager create-secret --name hello/foobar --secret-string '{"foo":"bar"}'
```


**Step 2. Create `helmwave.yml`**

```yaml
repositories:
  - name: bitnami
    url: https://charts.bitnami.com/bitnami

template:
  gomplate:
    enabled: true
    data:
      sources:
        secret:
          url:
            scheme: aws+sm
            path: 'hello/foobar'

releases:
  - name: app
    chart:
      name: bitnami/nginx
    namespace: test
    values:
      - vaules-secret.yaml
```

**Step 3. Create `vaules-secret.yaml`**

```yaml
secret: {{ datasource "secret" }}
```


**Step 4. Run `helmwave build`**

You will get `secret: {"foo":"bar"}`

