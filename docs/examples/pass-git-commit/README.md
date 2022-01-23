# Restart pods via git-commit

> [Source](https://github.com/helmwave/docs/tree/0.16.x/docs/examples/pass-git-commit)


**Project Structure**

```
.
├── helmwave.yml
└── values.yml
```

`helmwave.yml`

```yaml
{% include "helmwave.yml" %}
```

`nginx/template/deployment.yaml` looks like that:

```yaml
    ...
    metadata:  
      {{- with .Values.podAnnotations }}  
      annotations:  
        {{- toYaml . | nindent 8 }}  
      {{- end }}
    ...
```

We will pass pod annotations with  `values`


`values.yml`

```yaml
{% include "values.yml" %}
```

**Run**

```console
helmwave build
helmwave up
```

or `helmwave up --build`

