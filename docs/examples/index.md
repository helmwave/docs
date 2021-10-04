# Examples

## Managed environments for an app

```yaml
version: 0.13.0

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