# Apps per namespace

If you want to install each application in your own namespace. 

## Create the project

**Project structure**

```shell
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

```yaml title="helmwave.yml.tpl"
{% include "./helmwave.yml.tpl" %}
```

**Step 2. Create `vars.yaml`**

We will manage list apps with additional `vars.yaml` file

```yaml title="vars.yaml"
{% include "./vars.yaml" %}
```

**Step 3. Render `helmwave.yml.tpl` ->  `helmwave.yml`**

```shell
helmwave yml
```

You will get it

```yaml title="helmwave.yml"
{% include "./helmwave.yml" %}
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

Check out how to use [HELMWAVE_TAGS](../../yaml/#tags)

## CI/CD with Gitlab-CI

```yaml title=".gitlab-ci.yml"
{% include "./.gitlab-ci.yml" %}
```

if you want to deploy only `plantuml` via CI.

![How to run GitLab CI pipeline](https://habrastorage.org/webt/bd/aq/3r/bdaq3rroa0ak03g3qycvlp84w90.png)

![Helmwave output](https://habrastorage.org/webt/ew/2k/5v/ew2k5vrv7tmbcjpngwehknymjy4.png)
