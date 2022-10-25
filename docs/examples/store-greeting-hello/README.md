# How to use [Store](../../yaml/#store)

**Project Structure**

```console
.
├── README.md
├── a.yml
├── b.yml
└── helmwave.yml

```

`cat helmwave.yml`

```yaml
{% include "helmwave.yml" %}
```

`cat a.yml`

```yaml
{% include "a.yml" %}
```

`cat b.yml`

```yaml
{% include "b.yml" %}
```

After running `helmwave build` you get rendered values inside `.helmwave/values`:

`a.yml`

```yaml
image:
    repository: nginx

greeting: hello
```

`b.yml`

```yaml
image:
tag: v1.0.0

message: hello world
```
