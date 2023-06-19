# Tags

It allows you to choose releases for build.

It works with next flags for [`build` command](../cli/#step-1-building-a-plan)

??? success "Flags"

    ```shell
    ⟨⟨ run_script("helmwave build -h | grep tags | cut -c 4-") | indent(4) ⟩⟩
    ```

#### How to work with `--tags` and `--match-all-tags`?

!!! example inline "Suppose we have next `helmwave.yml` with 4 releases"

    1. redis-a
    2. redis-b
    3. memcached-a
    4. memcached-b

<img width="200" src="https://habrastorage.org/webt/45/f7/o_/45f7o_wad_mokyvpy-rtmqs7rno.png" />

:material-duck: example of `helmwave.yml` for this case.

```yaml title="helmwave.yml"
{% include "helmwave.yml" %}
```

=== "Match all redises"

    ```bash
    helmwave build -t redis
    [🙃 aka INFO]: 🏗 Plan
            releases: 
              - redis-a@test
              - redis-b@test
    ```

=== "Match the group `a`"

    ```bash
    helmwave build -t a 
    [🙃 aka INFO]: 🏗 Plan
            releases: 
              - redis-a@test
              - memcached-a@test
    ```

=== "Match the group `b`"

    ```bash
    helmwave build -t ab
    [🙃 aka INFO]: 🏗 Plan
            releases: 
              - redis-b@test
              - memcached-b@test
    ```

=== "Match any tags"

    If you know SQL. It looks like that:
    
    ```sql
    SELECT * FROM releases WHERE tag = "redis" OR tag = "a"
    ```
    
    ```bash
    helmwave build -t redis -t a 
    [🙃 aka INFO]: 🏗 Plan
            releases: 
              - redis-a@test
              - redis-b@test
              - memcached-a@test
    ```

=== "Match all tags"

    All that was above, we used the logical `OR` operator.
    If you need strongly logic with `AND` you should use `--match-all-tags` flag. 
    This flag changes logic for query releases.
    
    ```bash
    helmwave build --match-all-tags -t redis -t a 
    [🙃 aka INFO]: 🏗 Plan
            releases: 
              - redis-a@test
    ```