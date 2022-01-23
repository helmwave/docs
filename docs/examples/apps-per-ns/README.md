# Apps per namespace

> [Source](https://github.com/helmwave/docs/tree/0.16.x/docs/examples/apps-per-ns)

If you want to install each application in your own namespace. 

## Create the project

**Project structure**
```yaml
├── README.md
├── helmwave.yml.tpl
├── values
│   ├── harbor.yml
│   ├── minio.yml
│   ├── plantuml.yml
│   └── renovate.yml
└── vars.yaml

```

**Step 1. Create `helmwave.yml.tpl`**

```yaml
{% include "helmwave.yml.tpl" %}
```

**Step 2. Create `vars.yaml`**

We will manage list apps with additional `vars.yaml` file

```yaml
{% include "vars.yaml" %}
```

**Step 3. Render `helmwave.yml.tpl` ->  `helmwave.yml`**

```shell
helmwave yml
```

You will get it

```yaml
{% include "helmwave.yml" %}
```



**Step 4. Build plan**

```shell
helmwave build
```

**Step 5. Deploy plan**

if we want to deploy only `plantuml`

```shell
helmwave build -t plantuml
helmwave up
```

looks how to work [HELMWAVE_TAGS](https://helmwave.github.io/docs/0.16.x/yaml/#tags)

## CI/CD with Gitlab-CI


```yaml
variables:
  HELMWAVE_LOG_LEVEL: debug

Deploy to prod:
  stage: deploy
  when: manual
  environment:
    name: prod
  image:
    name: ghcr.io/helmwave/helmwave:0.16.2
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

if you want to deploy only `plantuml` via CI.

![](https://habrastorage.org/webt/bd/aq/3r/bdaq3rroa0ak03g3qycvlp84w90.png)

![](https://habrastorage.org/webt/ew/2k/5v/ew2k5vrv7tmbcjpngwehknymjy4.png)