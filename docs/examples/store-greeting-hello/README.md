# How to use [Store](../../yaml/#store)

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

=== "a.yml"

    ```yaml
    {% include "a.yml" %}
    ```

=== "b.yml"

    ```yaml
    {% include "b.yml" %}
    ```


*After run `helmwave build` you get*

=== "a.yml"

    ```yaml
    image:
      repository: nginx
    
    greeting: hello
    ```

=== "b.yml"

    ```yaml
    image:
    tag: v1.0.0
    
    message: hello world
    ```
