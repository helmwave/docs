# Kubedog

[full documentation](../../anno/#kubedogs)

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

```console
helmwave up --build --kubedog
```

or 

```console
export HELMWAVE_KUBEDOG_ENABLED=true
export HELMWAVE_AUTO_BUILD=true
helmwave up
```

Log with helmwave v0.22.2

![img.png](img.png)
