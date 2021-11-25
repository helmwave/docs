# Apps per namespace

If you want to install each application in your own namespace. 

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

Create main `helmwave.yml.tpl`

```yaml
{% include "helmwave.yml.tpl" %}
```

We will manage list apps with additional `vars.yaml` file

```yaml
{% include "vars.yaml" %}
```

Run all

```shell
helmwave yml
helmwave build
helmwave up
```

if we want to deploy only `plantuml`

```shell
helmwave yml
helmwave build -t plantuml
helmwave up
```

looks how to work HELMWAVE_TAGS