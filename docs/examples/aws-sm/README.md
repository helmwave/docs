# How to use AWS secret manager?

> [Source](https://github.com/helmwave/docs/tree/0.18.x/docs/examples/aws-sm)

**Project structure**
```
├── README.md
├── helmwave.yml
└── vaules-secret.yaml
```

**Step 1. Create next secret**

```bash
aws secretsmanager create-secret --name hello/foobar --secret-string '{"foo":"bar"}'
```


**Step 2. Create `helmwave.yml`**

```yaml
{% include "helmwave.yml" %}
```

**Step 3. Create `vaules-secret.yaml`**

```yaml
{% include "vaules-secret.yaml" %}
```


**Step 4. Run `helmwave build`**

You will get `secret: {"foo":"bar"}`
