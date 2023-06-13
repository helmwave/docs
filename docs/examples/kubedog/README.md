# 🐶 Kubedog

!!! info "The first thing you need to do is turn on `kubedog`"

    ```shell
    export HELMWAVE_KUBEDOG_ENABLED=true
    ```

Kubedog will track all your resources by default.
For more information, see the [annotation's documentation](../../anno/#kubedogs).

**Project Structure**

```
.
├── helmwave.yml
└── values.yml
```

Create `helmwave.yml`

```yaml
{% include "helmwave.yml" %}
```

Then you should create `values.yml`

```yaml
{% include "values.yml" %}
```

We are going to use `commonAnnotations`. 

> `commonAnnotations` is a part of bitnami common library [chart](https://github.com/bitnami/charts/tree/master/bitnami/common).

**Run**

```shell
helmwave up --build --kubedog
```

or 

```shell
export HELMWAVE_KUBEDOG_ENABLED=true
export HELMWAVE_AUTO_BUILD=true
helmwave up
```

**Output**

![img.png](img.png)
