# CI_COMMIT_SHORT_SHA [ [source] ](https://github.com/helmwave/helmwave.github.io/tree/main/docs/examples/CI_COMMIT_SHORT_SHA)

[deployment](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/) looks like that:
```yaml
    ...
    metadata:  
      {{- with .Values.podAnnotations }}  
      annotations:  
        {{- toYaml . | nindent 8 }}  
      {{- end }}
    ...
```

#### Project Structure

```
.
├── README.md
├── helmwave.yml.tpl
└── values.yml

```

#### `helmwave.yml.tpl`

```yaml
{% include "helmwave.yml.tpl" %}
```

#### `values.yml`

```yaml
{% include "values.yml" %}
```
