# Private GitHub repo 

```shell
.
├── README.md
├── helmwave.yml
└── helmwave.yml.tpl
```

**Suppose the `helmwave.yml.tpl` looks like**

```yaml title="helmwave.yml.tpl"
{% include "helmwave.yml.tpl" %}
```

This command will render `helmwave.yml.tpl` to `helmwave.yml`

```bash
$ export NS=stage
$ export GITHUB_TOKEN=my-secret-token
$ helmwave yml
[🙃 aka INFO]: 📄 YML is ready!
        build plan with next command: helmwave build -f helmwave.yml
```

Once applied, your `helmwave.yml` will look like

```yaml title="helmwave.yml"
{% include "helmwave.yml" %}
```
