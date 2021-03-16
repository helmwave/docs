# CI

Helmwave was built from the very first commit with the idea of running it as part of the CI pipeline in mind.

Let's see how we can get it working on popular CI software.

## Github action

- [official github action](https://github.com/marketplace/actions/helmwave)


## Gitlab-CI

```yaml
variables:
  HELMWAVE_LOG_LEVEL: debug

helmwave-deploy:
  stage: deploy
  environment:
    name: "ref/$CI_COMMIT_REF_SLUG"
  image:
    name: diamon/helmwave:0.9.3
    entrypoint: [""]
  script:
    - helmwave deploy


stop environment:
  stage: deploy
  image:
    name: lachlanevenson/k8s-kubectl:v1.18.4
    entrypoint: [""]
  variables:
    GIT_STRATEGY: none
  script:
    - kubectl delete ns $CI_COMMIT_REF_SLUG
  when: manual
  environment:
    name: "ref/$CI_COMMIT_REF_SLUG"
    action: stop
```

