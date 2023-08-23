# Graph

This example shows how to use the `graph` command with the `--graph-width` flag.


```yaml title="helmwave.yml"
{% include "./helmwave.yml" %}
```

=== "--graph-width 20"

    ```shell
    helmwave graph --graph-width 20
    [🙃 aka INFO]: show graph:
    ┌──────────────────┐   ┌──────────────────┐
    │ short-name@my... ├───┤ long-name-wit... │
    └──────────────────┘   └──────────────────┘
    ```

=== "--graph-width 15"

    ```shell
    helmwave graph --graph-width 15
    [🙃 aka INFO]: show graph:
    ┌──────────────────┐   ┌──────────────────┐
    │ short-name@my... ├───┤ long-name-wit... │
    └──────────────────┘   └──────────────────┘
    ```

=== "--graph-width -15"

    ```shell
    helmwave graph --graph-width -15
    [🙃 aka INFO]: show graph:
    ┌─────────────────────────┐   ┌─────────────────────────┐
    │ short-name@my-namespace ├───┤ long-name-with-very-... │
    └─────────────────────────┘   └─────────────────────────┘

    ```

=== "--graph-width -5"

    ```shell
    helmwave graph --graph-width -5
    [🙃 aka INFO]: show graph:
    ┌─────────────────────────┐   ┌───────────────────────────────────┐
    │ short-name@my-namespace ├───┤ long-name-with-very-long-name@... │
    └─────────────────────────┘   └───────────────────────────────────┘
    ```

