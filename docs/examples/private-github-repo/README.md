# Private GitHub repo 

> [Source](https://github.com/helmwave/docs/tree/main/docs/examples/private-github-repo)



#### Suppose the `helmwave.yml.tpl` looks like


```yaml
{% include "helmwave.yml" %}
```


This command will render `helmwave.yml.tpl` to `helmwave.yml`

```bash
$ export NS=stage
$ export GITHUB_TOKEN=my-secret-token
$ helmwave yml
[🙃 aka INFO]: 🛠 Your planfile is .helmwave/planfile
[🙃 aka INFO]: 📄 Render file
        from: helmwave.yml
        to: helmwave.yml
```

#### Once applied, your `helmwave.yml` will look like

```yaml
{% include "helmwave.yml" %}
```

