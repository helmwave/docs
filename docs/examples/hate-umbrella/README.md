# Umbrella chart is evil

> Helmwave is only what you actually need.

Why Umbrella chart is evil?

- You must keep extra chart.
- You have new layer for conventional values.
- Umbrella chart doesn't provide separate your environments.
- When sub-chart modified you need fix it twice.

Suppose that you need to describe next architecture.

```mermaid
graph LR
  frontend --> api --> rabbitmq & minio_s3
  consumer --> rabbitmq & minio_s3 & postgresql
```

**helmwave.yml**

```yaml
{% include "helmwave.yml" %}
```