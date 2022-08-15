# Private GitLab repo 

> [ [Source] ](https://github.com/helmwave/docs/tree/0.21.x/docs/examples/private-gitlub-repo)

Learn more about GitLab Helm Registry:  https://docs.gitlab.com/ee/user/packages/helm_repository/


```console
.
├── README.md
└── helmwave.yml.tpl
```

**Suppose the `helmwave.yml.tpl` looks like**


```yaml
{% include "helmwave.yml.tpl" %}
```

Your `.gitlab-ci.yml` 

```yaml
helmwave:
  stage: deploy
  image:
    name: ghcr.io/helmwave/helmwave:0.21.1
    entrypoint: [""]
  before_script:
  - printenv | grep HELMWAVE
  script:
  - helmwave yml
  - helmwave build
  - helmwave up
  artifacts:
    paths:
    - .helmwave
    expire_in: 2 week
```

