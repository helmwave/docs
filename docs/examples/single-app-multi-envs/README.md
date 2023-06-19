# Single app multi envs

When we work with helm, sometimes we need dynamics chose environment.

```shell
export CI_ENVIRONMENT_NAME=stage
helm upgrade --install my-release my-chart-repo/my-chart-app -f values/_.yml -f values/$CI_ENVIRONMENT_NAME.yaml
```

**Project structure**

```
.
├── helmwave.yml.tpl
└── values
    ├── _.yml
    ├── prod.yml
    ├── qa.yml
    └── stage.yml
```


```yaml title="helmwave.yml.tpl"
{% include "helmwave.yml.tpl" %}
```

=== "`values/_.yml`"

    Common values for all envs
    ```yaml
    {% include "values/_.yml" %}
    ```

=== "`values/prod.yml`"

    ```yaml
    {% include "values/prod.yml" %}
    ```

=== "`values/qa.yml`"

    ```yaml
    {% include "values/qa.yml" %}
    ```

=== "`values/stage.yml`"

    ```yaml
    {% include "values/stage.yml" %}
    ```

**step 0: templating**

```shell
export CI_ENVIRONMENT_NAME=stage
helmwave yml
```

You will get next `helmwave.yml`:

```yaml title="helmwave.yml"
{% include "helmwave.yml" %}
```
