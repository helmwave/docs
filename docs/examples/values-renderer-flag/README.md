# Renderer flag for values

## Disable templating

Sometimes we need to disable templating values. For example prometheus rules.


```yaml title="values.yml"
{% include "./values.yml" %}
```


```yaml title="helmwave.yml"
{% include "./helmwave.yml" %}
```

## Decode with SOPS

> Introduced in [:material-tag: v0.32.0](https://github.com/helmwave/helmwave/releases/tag/v0.32.0)

[SOPS](https://github.com/getsops/sops) is an awesome to provide easy way to encode and decode files.
Helmwave allows you to automatically decode them during `helmwave build`.

```yaml title="values-sops.yml"
{% include "./values-sops.yml" %}
```


```yaml title="helmwave.yml"
{% include "./helmwave-sops.yml" %}
```