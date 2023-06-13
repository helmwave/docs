# 🧬 helmwave.yml

Works on [helm](https://github.com/helmwave/helmwave/blob/v0.27.3/go.mod)

|    field     | required |  type  | default |
|:------------:|:--------:|:------:|:-------:|
|   project    |    🙅    | string |   ""    |
|   version    |    🙅    | string |   ""    |
| repositories |    🙅    | array  |   []    |
|  registries  |    🙅    | array  |   []    |
|   releases   |    🙅    | array  |   []    |

> Nothing is required.

## project

> Reserved for the future.

## version

Helmwave will check the current version and project version.

In the future, it is planned to check major compatibility. 

## registries[]

> [OCI registries](https://helm.sh/docs/topics/registries/)

|  field   | required |  type  | default |
|:--------:|:--------:|:------:|:-------:|
|   host   |    ✅     | string |   ""    |
| username |    🙅    | string |   ""    |
| password |    🙅    | string |   ""    |
| insecure |    🙅    |  bool  |  false  |

**Examples**

- [private oci](../examples/oci-private)
- [public (github) oci](../examples/oci-public)

## repositories[]

> Helm [repositories](https://helm.sh/docs/helm/helm_repo) also know as `helm repo add`

|          field           | required |  type  | default |
|:------------------------:|:--------:|:------:|:-------:|
|           name           |    ✅     | string |   ""    |
|           url            |    ✅     |  url   |   ""    |
|         username         |    🙅    | string |   ""    |
|         password         |    🙅    | string |   ""    |
|         certFile         |    🙅    | string |   ""    |
|         keyFile          |    🙅    | string |   ""    |
|          caFile          |    🙅    | string |   ""    |
| insecure_skip_tls_verify |    🙅    |  bool  |  false  |
|   pass_credentials_all   |    🙅    |  bool  |  false  |
|          force           |    🙅    |  bool  |  false  |

This repository will be stored in a local helm repositories database.

### name

Local name alias.

### url

URL of the repository.

### force

Update existing repository exists if settings differ.

## releases[]

> Almost all options that are here are native helm options.

|            field            | required |       type       | default | `helmwave build` |
|:---------------------------:|:--------:|:----------------:|:-------:|:----------------:|
|          **name**           |    ✅     |      string      |   ""    |        ✅         |
|        **namespace**        |    ✅     |      string      |   ""    |        ✅         |
|          **chart**          |    ✅     | string or object |   {}    |        ✅         |
|            store            |    🙅    |      object      |   {}    |        ✅         |
|         depends_on          |    🙅    |      array       |   []    |        ✅         |
|           values            |    🙅    |      array       |   []    |        ✅         |
|            tags             |    🙅    |      array       |   []    |        ✅         |
|        post_renderer        |    🙅    |      array       |   []    |        ✅         |
|    offline_kube_version     |    🙅    |      string      |   ""    |        ✅         |
|           timeout           |    🙅    |     interval     |   5m    |                  |
|         max_history         |    🙅    |       int        |    0    |                  |
|           context           |    🙅    |      string      |   ""    |                  |
|         description         |    🙅    |      string      |   ""    |                  |
|  pending_release_strategy   |    🙅    |      string      |   ""    |                  |
|        allow_failure        |    🙅    |       bool       |  false  |                  |
|           atomic            |    🙅    |       bool       |  false  |                  |
|       cleanup_on_fail       |    🙅    |       bool       |  false  |                  |
|      create_namespace       |    🙅    |       bool       |  false  |                  |
|            devel            |    🙅    |       bool       |  false  |                  |
|        disable_hooks        |    🙅    |       bool       |  false  |                  |
| disable_open_api_validation |    🙅    |       bool       |  false  |                  |
|            force            |    🙅    |       bool       |  false  |                  |
|         enable_dns          |    🙅    |       bool       |  false  |                  |
|          recreate           |    🙅    |       bool       |  false  |                  |
|        reset_values         |    🙅    |       bool       |  false  |                  |
|        reuse_values         |    🙅    |       bool       |  false  |                  |
|          skip_crds          |    🙅    |       bool       |  false  |                  |
|          sub_notes          |    🙅    |       bool       |  false  |                  |
|            wait             |    🙅    |       bool       |  false  |                  |
|        wait_for_jobs        |    🙅    |       bool       |  false  |                  |

### name

Release name. I hope you know what it is.

### namespace

:simple-kubernetes: kubernetes namespace.

### create_namespace

If set to `true` Helmwave will create the release namespace if not present.

### timeout

Time to wait for release to install.

!!! danger "if you enable `kubedog` this option will be required."

### max_history

Limit the maximum number of revisions saved per release. Use 0 for no limit (default 0)

???+ tip "Recommendation is using `3` for this option."

    `previous release` + `current release` + `next release` = **`3`**


### store

It allows passing your custom fields from `helmwave.yml` to values.

[example](../examples/store-greeting-hello/)

### tags[]

It allows you to choose releases for build.

It works with next options when you call `helmwave build` (or `helmwave up --build`):

```shell
--tags value, -t value  It allows you choose releases for build. Example: -t tag1 -t tag3,tag4 [$HELMWAVE_TAGS]
--match-all-tags        Match all provided tags (default: false) [$HELMWAVE_MATCH_ALL_TAGS]
```
 
**Matching with tags**

!!! example inline "Suppose we have next `helmwave.yml` with 4 releases"

    1. redis-a
    2. redis-b
    3. memcached-a
    4. memcached-b

<img width="200" src="https://habrastorage.org/webt/45/f7/o_/45f7o_wad_mokyvpy-rtmqs7rno.png" />


```yaml
repositories:
- name: bitnami
  url: https://charts.bitnami.com/bitnami

releases:
- name: redis-a
  namespace: test
  chart:
    name: bitnami/redis
  tags:
  - a
  - redis

- name: redis-b
  namespace: test
  chart:
    name: bitnami/redis
  tags:
  - b
  - redis

- name: memcached-a
  namespace: test
  chart:
    name: bitnami/redis
  tags:
  - a
  - memcached

- name: memcached-b
  namespace: test
  chart:
    name: bitnami/memcached
  tags:
  - b
  - memcached
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

### depends_on[]

It allows setting explicit dependencies between releases. Dependant release will start upgrading only after all its dependencies finished upgrading

!!! example "Example for [3-tier](https://searchsoftwarequality.techtarget.com/definition/3-tier-application) application"

    ```mermaid
    graph LR
        frontend --> backend --> db;
    ```
    *If you don't see a graph, please reload the page.*

Your `helmwave.yml` should look like this:

```yaml
releases:
  - name: frontend
    depends_on:
      - backend
    namespace: test

  - name: backend
    depends_on:
      - db
    namespace: test

  - name: db
    allow_failure: false
    namespace: test
```

### allow_failure

Allows all dependant releases to proceed even if release failed.

### pending_release_strategy

Strategy to handle releases in pending statuses (`pending-install`, `pending-upgrade`, `pending-rollback`)

If helmwave tries to upgrade release that is currently in one of the pending statuses,
it will follow specified strategy:

- `""` (or not specified) - do nothing. Helm will fail in this case;
- `rollback` - rollback release to a previous version. Upgrade will happen after `rollback` is complete;
- `uninstall` - uninstall release. Upgrade will happen after `uninstall` is complete.

### context

Allows using custom kubecontext for release.

!!! danger "Kubedog can't be enabled when there are releases in multiple contexts."

### post_renderer

You can use custom commands to change rendered manifests.

### offline_kube_version

If `offline_kube_version` set helmwave will use this version to build plan.
Without this option, helmwave will ask :simple-kubernetes: kubernetes for a version.

!!! tip "`offline_kube_version` also can help you if you want to use different environments for `helmwave build` and `helmwave up`."

### chart

> `chart` can be an object or a string. If it's a string, it will be treated as a `name`.

|         field         | required |  type  | default |
|:---------------------:|:--------:|:------:|:-------:|
|       **name**        |    ✅     | string |   ""    |
|      **version**      |    🙅    | string |   ""    |
|       username        |    🙅    | string |   ""    |
|       password        |    🙅    | string |   ""    |
|        cafile         |    🙅    | string |   ""    |
|       certfile        |    🙅    | string |   ""    |
|        keyfile        |    🙅    | string |   ""    |
| insecureskiptlsverify |    🙅    |  bool  |  false  |
|        keyring        |    🙅    | string |   ""    |
|  passcredentialsall   |    🙅    |  bool  |  false  |
|        verify         |    🙅    |  bool  |  false  |

!!! tip "If chart is remote it will be downloaded into `.helmwave/charts` and downloaded archive will be used during deploy."

### values[]

> `values` can be an object or a string. If it's a string, it will be treated as a `src` field.

|      field      | required |  type  | default |
|:---------------:|:--------:|:------:|:-------:|
|     **src**     |    ✅     | string |   ""    |
| delimiter_left  |    🙅    | string |  "{{"   |
| delimiter_right |    🙅    | string |  "}}"   |
|     strict      |    🙅    |  bool  |  false  |
|     render      |    🙅    |  bool  |  true   |


#### **src**

Path to values file. It can be local or remote.

#### delimiter_left, delimiter_right

You can change the delimiter that helmwave uses to render values.

[example](../examples/values-delimiter-flags/)

#### render

Allows disabling templating values at all.

[example](../examples/values-render-flag)

#### strict

Allows to fail if values file doesn't exist.

[example](../examples/values-strict-flag)

### depends_on[]

> `depends_on` can be an object or a string. If it's a string, it will be treated as a `name`.

|  field   | required |  type  | default |
|:--------:|:--------:|:------:|:-------:|
| **name** |    🙅    | string |   ""    |
|   tag    |    🙅    | string |   ""    |
| optional |    🙅    |  bool  |  false  |


#### **name**

Name of release (dependency) that has to be installed/upgraded before this release (dependant). If dependency is not in a plan, it will be added to a plan.

Name support 2 kind of definitions: uniq name `<release-name>@<namespace>` or just `<release-name>`.
If namespace is not specified, it will be taken from namespace filed of release.


The same configuration can be written in 2 ways:

=== "`<release-name>`"

    ```yaml
    releases:
      - name: backend
        namespace: test
        depends_on:
          - name: redis

    - name: redis
      namespace: test
    ```

=== "`<release-name>@<namespace>`"

    ```yaml
    releases:
      - name: backend
        namespace: test
        depends_on:
          - name: redis@test

    - name: redis
      namespace: test
    ```


Both of them will be normalized to `redis@test` in a planfile.


    

#### tag

You can include all releases that match this tag to be added as dependencies.
If a tag is not in a plan, it will be added to a plan.

The planfile (`.helmwave/planfile` by default) will have a normalized list of releases instead of tags.

#### optional

If dependency is not found in all available releases, helmwave will not fail due to missing dependency.
