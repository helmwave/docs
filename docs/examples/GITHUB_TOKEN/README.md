# GITHUB_TOKEN [ [source] ](https://github.com/helmwave/helmwave.github.io/tree/main/docs/examples/GITHUB_TOKEN)



#### Suppose the `helmwave.yml.tpl` looks like


```yaml
{% include "helmwave.yml.tpl" %}
```


This command will render `helmwave.yml.tpl` to `helmwave.yml`

```bash
$ export NS=stage
$ export CI_PROJECT_NAME=my-project
$ export GITHUB_TOKEN=my-secret-token
$ helmwave yml
[🙃 aka INFO]: 🛠 Your planfile is .helmwave/planfile
[🙃 aka INFO]: 📄 Render file
        from: helmwave.yml.tpl
        to: helmwave.yml
```

#### Once applied, your `helmwave.yml` will look like

```yaml
{% include "helmwave.yml" %}
```

