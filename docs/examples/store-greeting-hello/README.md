# Same values -> different  fields

> [ [source] ](https://github.com/helmwave/docs/tree/0.17.x/docs/examples/store-greeting-hello)

[Store](https://helmwave.github.io/docs/0.17.x/yaml/#store) is very helpful when you need to pass the same values to different fields with your releases.


**Project Structure**

```console
.
├── README.md
├── a.yml
├── b.yml
└── helmwave.yml

```

**`helmwave.yml`**


```yaml
{% include "helmwave.yml" %}
```

*a.yml*

```yaml
{% include "a.yml" %}
```


*b.yml*

```yaml
{% include "b.yml" %}
```

*After run `helmwave build` you get*


*a.yml* 


```yaml
image:
  repository: nginx

greeting: hello
```

*b.yml*


```yaml
image:
  tag: v1.0.0

message: hello world
```
