# Private GitLab repo 

Learn more about GitLab :simple-helm: helm Registry [here](https://docs.gitlab.com/ee/user/packages/helm_repository/)

```shell
.
├── README.md
├── .gitlab-ci.yml
└── helmwave.yml.tpl
```

```yaml title="helmwave.yml.tpl"
{% include "helmwave.yml.tpl" %}
```


```yaml title=".gitlab-ci.yml"
{% include ".gitlab-ci.yml" %}
```
