# 🧋 Continuous Integration

Helmwave was built from the very first commit with the idea of running it as part of the CI pipeline in mind.

Let's see how we can get it working on popular CI software.

--- 

## :material-github: GitHub action

You can use [official github action](https://github.com/marketplace/actions/helmwave-installer)

```yaml
name: Deploy
on:
  push:


jobs:
  external:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - uses: helmwave/setup-action@v0.2.0
        name: Install helmwave
        with:
          version: '⟨⟨ ver ⟩⟩'
      - name: templating helmwave.yml.tpl  
        run: '[[ -f "helmwave.yml.tpl" ]] && helmwave yml'
      - name: plan
        run: helmwave build
      - name: deploy
        run: helmwave up
```

## :material-gitlab: Gitlab-CI

```yaml
variables:
  HELMWAVE_LOG_LEVEL: debug

helmwave:
  stage: deploy
  environment:
    name: "ref/$CI_COMMIT_REF_SLUG"
  image:
    name: ghcr.io/helmwave/helmwave:⟨⟨ ver ⟩⟩
    entrypoint: [""]
  before_script:
    - env | grep HELMWAVE
  script:
    - '[[ -f "helmwave.yml.tpl" ]] && helmwave yml'
    - cat helmwave.yml
    - helmwave build
    - helmwave up
  artifacts:
    paths:
    - .helmwave
    expire_in: 2 weeks
```

See the [:material-duck: example](../examples/apps-per-ns/#cicd-with-gitlab-ci)


###  Kube-Linter and Helmwave

```yaml
stages:
  - build
  - lint
  - deploy


variables:
  HELMWAVE_PLAN: $CI_PROJECT_DIR/.helmwave


.helmwave: &helmwave
  before_script:
    - printenv | grep HELMWAVE
    - ls -la $HELMWAVE_PLAN || true
  after_script:
    - ls -la $HELMWAVE_PLAN
  image:
    name: ghcr.io/helmwave/helmwave:⟨⟨ ver ⟩⟩
    entrypoint: [ '' ]

###############  BUILD  ################
plan:
  stage: build
  extends: .helmwave
  artifacts:
    paths:
      - .helmwave
    expire_in: 1 week
  script:
    - '[[ -f "helmwave.yml.tpl" ]] && helmwave yml'
    - cat helmwave.yml
    - helmwave build

###############  LINT  ################
kube-linter:
  stage: lint
  image:
    name: stackrox/kube-linter:0.2.5-alpine
    entrypoint: [ '' ]
  script:
    - /kube-linter lint $HELMWAVE_PLAN


kubeval:
  stage: lint
  image:
    name: garethr/kubeval
    entrypoint: [ '' ]
  script:
    - /kubeval --force-color $HELMWAVE_PLAN/manifest/*.yml


pluto:
  stage: lint
  image:
    name: quay.io/fairwinds/pluto:v5.1
    entrypoint: [ '' ]
  script:
    - /pluto detect-files -d $HELMWAVE_PLAN

###############  Deploy  ################
up:
  stage: deploy
  extends: .helmwave
  when: manual
  script:
    - helmwave up
```