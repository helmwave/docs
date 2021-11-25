# 🧋 Continuous Integration

Helmwave was built from the very first commit with the idea of running it as part of the CI pipeline in mind.

Let's see how we can get it working on popular CI software.

--- 

## :material-github: GitHub action

- [official github action](https://github.com/marketplace/actions/helmwave)


## :material-gitlab: Gitlab-CI

```yaml
variables:
  HELMWAVE_LOG_LEVEL: debug

helmwave:
  stage: deploy
  environment:
    name: "ref/$CI_COMMIT_REF_SLUG"
  image:
    name: diamon/helmwave:0.16.2
    entrypoint: [""]
  before_script:
    - printenv | grep HELMWAVE
  script:
    - helmwave yml # if it needs
    - helmwave build
    - helmwave up
  artifacts:
    paths:
    - .helmwave
    expire_in: 2 week
```

See [example](https://helmwave.github.io/docs/0.16.x/examples/apps-per-ns/#cicd-with-gitlab-ci)