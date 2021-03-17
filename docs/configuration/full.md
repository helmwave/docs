# 🧬 Full yaml

## General

top level configuration

```yaml
project: my-project
version: 0.9.3

repositories: []
releases: []
```

## 🗄 Repository

Array of [repositories](https://github.com/helm/helm/blob/617c9e1b1297a75fd89d72ec3595d7bc62bf9367/pkg/repo/chartrepo.go#L42)

```yaml
repositories:
- name: bitnami
  url: https://charts.bitnami.com/bitnami
  username: ""
  password: ""
  certfile: ""
  keyfile: ""
  cafile: ""
  insecureskiptlsverify: false
  force: false
```

## 🛥 Release

Array of releases

- Options provides [action.upgrade](https://github.com/helm/helm/blob/617c9e1b1297a75fd89d72ec3595d7bc62bf9367/pkg/action/upgrade.go#L42)

```yaml
releases:
- name:  ""
  chart: ""
  tags: []
  values: []
  store: {}
  options:
    chartpathoptions:
      cafile: ""
      certfile: ""
      keyfile: ""
      insecureskiptlsverify: false
      keyring: ""
      password: ""
      repourl: ""
      username: ""
      verify: false
      version: 1.0.0
    install: true
    devel: false
    namespace: test1
    skipcrds: false
    timeout: 15m0s
    wait: true
    waitforjobs: false
    disablehooks: false
    dryrun: false
    force: false
    resetvalues: false
    reusevalues: false
    recreate: false
    maxhistory: 10
    atomic: false
    cleanuponfail: false
    subnotes: false
    description: ""
    postrenderer: null
    disableopenapivalidation: false
```
