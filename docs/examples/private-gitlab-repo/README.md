# Private GitLab repo 

Learn more about GitLab :simple-helm: helm Registry [here](https://docs.gitlab.com/ee/user/packages/helm_repository/)

```shell
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
{% include ".gitlab-ci.yml" %}
```
