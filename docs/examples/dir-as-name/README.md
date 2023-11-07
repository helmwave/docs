# Directory as release

If you want to install each application in your own namespace.

## Create the project

**Project structure**

```shell
.
├── README.md
├── helmwave.yml.tpl
└── releases
    ├── my-app-a
    │   └── values.yml
    ├── my-app-b
    │   └── values.yml
    └── my-app-c
        └── values.yml

```


```yaml title="helmwave.yml.tpl"
{% include "./helmwave.yml.tpl" %}
```

**Build**

```shell
export APP=my-app-b
helmwave build --templater gomplate --yml -t $APP --diff-mode local
```


```yaml title="helmwave.yml"
{% include "./helmwave.yml" %}
```

