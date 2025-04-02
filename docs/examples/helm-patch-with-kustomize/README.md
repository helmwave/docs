# Helm patch with Kustomize

Helm charts often miss required fields, leading to frequent forking to add necessary elements. This example shows how to patch a Helm chart without forking, using the external tool kustomize.

Suppose we have the chart `hello`. (It was created by `$ helm create hello`). The deployment doesn't have `priorityClassName` in this chart.

For example, we'll add `priorityClassName: high` for the deployment.

Describe your patch with Kustomize

```yaml title="kustomization.yaml"
{% include "./kustomization.yaml" %}
```

Kustomize has [official](https://helm.sh/docs/topics/advanced/#usage) trick [script](https://github.com/thomastaylor312/advanced-helm-demos/tree/master/post-render) for helm.

```bash title="kustomize.sh"
{% include "./kustomize.sh" %}
```

Ask helmwave use kustomize

```yaml title="helmwave.yml"
{% include "./helmwave.yml" %}
```

## Result

```bash
helmwave build
cat .helmwave/manifest/world@my-namespace.yml| grep priorityClassName
      priorityClassName: high
```