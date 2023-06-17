---
ignore_macros: true
---

# AWS secret manager

**Project structure**

```
├── README.md
├── helmwave.yml
└── values-secret.yaml
```

**Step 1. Create next secret**

```bash
aws secretsmanager create-secret --name hello/foobar --secret-string '{"foo":"bar"}'
```

**Step 2. Create `helmwave.yml`**

```yaml
{% include "helmwave.yml" %}
```

**Step 3. Create `values-secret.yaml`**

```yaml
{% include "values-secret.yaml" %}
```

**Step 4. Run `helmwave build --templater gomplate`**

You will get `secret: {"foo":"bar"}`
