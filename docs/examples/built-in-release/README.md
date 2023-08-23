# Release object

> This an example is demonstrating how to use the `release` object.

**Project Structure**

```shell
⟨⟨ run_script("tree docs/examples/built-in-release") ⟩⟩
```

**Create `helmwave.yml`**

```yaml title="helmwave.yml"
{% include "./helmwave.yml" %}
```


**Create `_.yml`**

```yaml title="_.yml"
{% include "./_.yml" %}
```

**Run build**

```shell
helmwave build
```

**Show rendered values**

```shell
tree .helmwave 
.helmwave
├── manifest
│   ├── a@test.yml
│   └── b@test.yml
├── planfile
└── values
    ├── a@test
    │   └── 454b1cc1f7b3ffe503edf44c0ad0eea2ac39923c.yml
    └── b@test
        └── 454b1cc1f7b3ffe503edf44c0ad0eea2ac39923c.yml
```

> TODO: fix titles

=== "`a` values"

    ```yaml title="454b1cc1f7b3ffe503edf44c0ad0eea2ac39923c.yml"
    release:
      chart:
        name: bitnami/nginx
      name: a
      namespace: test
      values:
        - src: _.yml
          dst: /var/folders/jn/gs32zb3s5939nf71b3836nq40000gr/T/values/a@test/454b1cc1f7b3ffe503edf44c0ad0eea2ac39923c.yml
    ```

=== "`b` values"
    
    ```yaml
    release:
      chart:
        name: bitnami/nginx
      name: b
      namespace: test
      values:
        - src: _.yml
          dst: /var/folders/jn/gs32zb3s5939nf71b3836nq40000gr/T/values/b@test/454b1cc1f7b3ffe503edf44c0ad0eea2ac39923c.yml
    ```
