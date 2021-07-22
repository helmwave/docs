# Yaml

```yaml
project: Test07
version: dev
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
releases:
- store:
    pullPolicy: Always
  chart:
    name: bitnami/nginx
    cafile: ""
    certfile: ""
    keyfile: ""
    insecureskiptlsverify: false
    keyring: ""
    password: ""
    repourl: ""
    username: ""
    verify: false
    version: ""
  name: nginx
  namespace: test
  description: ""
  depends_on: []
  values: 
  - .helmwave/values/nginx@test/5ae83192a2a53eec01dee5207fcf3cccbc5af87f.yml
  - tests/07_values.yaml
  tags: []
  timeout: 0s
  maxhistory: 0
  createnamespace: false
  resetvalues: false
  recreate: false
  force: false
  atomic: false
  cleanuponfail: false
  subnotes: false
  disablehooks: false
  disableopenapivalidation: false
  waitforjobs: false
  wait: false
  skipcrds: false
  devel: false
  reusevalues: false
```


## Project

Reserved for future.

## Version

Check current version and project version.

In the future it is planned to be used for major compatibility. 

## Repositories[]

field | required | type  | default
:----:|:----:|:----:|:----:
name |  ✅   |  string | ""
url  |  ✅   |  url    | ""
username | 🙅 | string | ""
password | 🙅 | string | ""
certfile | 🙅 | string | ""
keyfile | 🙅 | string  | ""
cafile| 🙅 | string    | ""
insecureskiptlsverify | 🙅 | bool | false
force | 🙅 | bool | false


## Releases[]


field | required | type  | default
:----:|:----:|:----:|:----:
name            | ✅ | string | ""
namespace       | ✅ | string | ""
chart.name      | ✅ | string | ""
chart.username  | 🙅 | string | ""
chart.password  | 🙅 | string | ""
chart.certfile  | 🙅 | string | ""
chart.keyfile   | 🙅 | string  | ""
chart.cafile    | 🙅 | string    | ""
chart.insecureskiptlsverify | 🙅 | bool | false
description      | 🙅 | string  | ""
depends_on       | 🙅 | array   | []
values           | 🙅 | array   | []
tags             | 🙅 | array   | []
store            | 🙅 | object  | {}
timeout          | 🙅 | interval   | 0s
maxhistory       | 🙅 | int   | 0
createnamespace  | 🙅 | bool    | false
resetvalues      | 🙅 | bool    | false
recreate| 🙅 | bool    | false
force| 🙅 | bool    | false
atomic| 🙅 | bool    | false
cleanuponfail| 🙅 | bool    | false
subnotes| 🙅 | bool    | false
disablehooks| 🙅 | bool    | false
disableopenapivalidation| 🙅 | bool    | false
waitforjobs| 🙅 | bool    | false
wait| 🙅 | bool    | false
skipcrds| 🙅 | bool    | false
devel| 🙅 | bool    | false
reusevalues| 🙅 | bool    | false


