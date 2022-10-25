# Restart pods via git-commit

**Project Structure**

```
.
├── helmwave.yml
└── values.yml
```

`cat helmwave.yml`

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

Suppose that `CI_COMMIT_SHORT_SHA` contains commit short sha hash.

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
