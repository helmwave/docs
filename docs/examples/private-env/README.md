# Private environment

**`helmwave.yml`**

```yaml
{% include "helmwave.yml" %}
```

**Disable diff**

You can also use `local`

```shell
export HELMWAVE_DIFF_MODE=none
```

**build a plan**

you can also use `--charts-cache-dir`.

```shell
helmwave build
```

**upload plan to private environment**

```shell
whatever you want
```

**on the private environment**

```shell
helmwave up
```