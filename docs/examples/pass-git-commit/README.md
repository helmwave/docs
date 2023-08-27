# Restart pods via git-commit

**Project Structure**

```shell
⟨⟨ run_script("tree docs/examples/pass-git-commit") ⟩⟩
```

```yaml title="helmwave.yml"
{% include "./helmwave.yml" %}
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

```yaml title="values.yml"
{% include "./values.yml" %}
```

**Run**

```shell
helmwave build
helmwave up
```

or `helmwave up --build`
