# Store

[`Store`](../../yaml/#store) is very useful feature when you need to share the same values between different values fields.

**Project Structure**

```shell
.
├── a.yml
├── b.yml
└── helmwave.yml

```

```yaml title="helmwave.yml"
{% include "helmwave.yml" %}
```


```yaml title="a.yml"
{% include "a.yml" %}
```


```yaml title="b.yml"
{% include "b.yml" %}
```

After running `helmwave build` you will get rendered values inside `.helmwave/values`:

```yaml title="a.yml"
image:
  repository: nginx

greeting: hello
```


```yaml title="b.yml"
image:
  tag: v1.0.0

message: hello world
```
