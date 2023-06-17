# 🧬 helmwave.yml

This documentation describes all entities inside a `helmwave.yml`

|    field     | required |  type  | default |
|:------------:|:--------:|:------:|:-------:|
|   project    |    🙅    | string |   ""    |
|   version    |    🙅    | string |   ""    |
| repositories |    🙅    | array  |   []    |
|  registries  |    🙅    | array  |   []    |
|  lifecycle   |    🙅    | object |   {}    |
|   releases   |    🙅    | array  |   []    |

=== "Short `helmwave.yml`"

    ```yaml
    project: "HelloWorld"
    version: "⟨⟨ ver ⟩⟩"
    repositories: []
    registries: []
    releases: []
    lifecycle:
      pre_up: []
      post_up: []
      pre_down: []
      post_down: []
      pre_build: []
      post_build: []
      pre_rollback: []
      post_rollback: []
    ```
=== "Full `helmwave.yml`"

    ```yaml
    project: "HelloWorld"
    version: "⟨⟨ ver ⟩⟩"

    repositories:
      - name: stable
        url: https://localhost:8080
        # private repositories
        username: user
        password: 12345679

        # cert
        certFile: ./cert.pem
        keyFile: ./key.pem
        caFile: ./ca.pem

    lifecycle:
      pre_build:
        - cmd: "ls"
          args: ["-l", "-a"]
          show: false
        - echo "run global pre_build script"
      post_build:
        - echo "run global post_build script"

    registries:
        - host: https://localhost:5000
          # private registries
          username: oci_user
          password: 98765431
          insecure: false


    releases:
      - name: my
        namespace: prod
        chart:
            name: stable/my-chart
            version: "0.2.0"
            cafile: ""
            certfile: ""
            keyfile: ""
            insecureskiptlsverify: false
            keyring: ""
            password: ""
            passcredentialsall: false
            repourl: ""
            username: ""
            verify: false

        store:
          greeting: "HelloWorld"

        lifecycle:
          pre_up:
            - echo "running pre_up script for my"
          post_up:
            - echo "running post_up script for my"
          pre_build:
            - echo "running pre_build script for my"
          post_build:
            - echo "running post_build script for my"

        depends_on:
          - name: db@prod
            tag: prod
            optional: false

        values:
          - src: values.yml
            delimiter_left: "[["
            delimiter_right: "]]"
            render: false
            strict: true

        tags:
          - my
          - product

        post_renderer: "./gomplate"
        offline_kube_version: "1.22.0"
        timeout: "5m"
        max_history: 3
        context: prod
        description: "my chart"
        pending_release_strategy: rollback
        allow_failure: false
        atomic: true
        cleanup_on_fail: false
        create_namespace: false
        devel: false
        disable_hooks: false
        disable_openapi_validation: false
        force: false
        enable_dns: false
        recreate: false
        reset_values: false
        reuse_values: false
        skip_crds: false
        sub_notes: false
        wait: true
        wait_for_jobs: true
    ```

## project

Reserved for the future.

## version

Helmwave will check the current version and project version.

In the future, it is planned to check major compatibility. 

## registries[]

> Introduced in [:material-tag: v0.19.0](https://github.com/helmwave/helmwave/releases/tag/v0.19.0)

Describe which [OCI registries](https://helm.sh/docs/topics/registries/) need to be added.

|  field   | required |  type  | default |
|:--------:|:--------:|:------:|:-------:|
|   host   |    ✅     | string |   ""    |
| username |    🙅    | string |   ""    |
| password |    🙅    | string |   ""    |
| insecure |    🙅    |  bool  |  false  |


=== ":material-duck: private oci"

    ```yaml
    {% include "examples/oci-private/helmwave.yml" %}
    ```

=== ":material-duck: public oci"
    
    ```yaml
    {% include "examples/oci-public/helmwave.yml" %}
    ```

### host

Host of the registry.

### username

Username for the registry.

!!! note "only if registry is private"


### password

Password for the registry.

!!! note "only if registry is private"


## repositories[]

:simple-helm: helm [repositories](https://helm.sh/docs/helm/helm_repo) also know as `helm repo add`

|          field           | required |  type  | default |
|:------------------------:|:--------:|:------:|:-------:|
|           name           |    ✅     | string |   ""    |
|           url            |    ✅     |  url   |   ""    |
|         username         |    🙅    | string |   ""    |
|         password         |    🙅    | string |   ""    |
|          force           |    🙅    |  bool  |  false  |
|         certFile         |    🙅    | string |   ""    |
|         keyFile          |    🙅    | string |   ""    |
|          caFile          |    🙅    | string |   ""    |
| insecure_skip_tls_verify |    🙅    |  bool  |  false  |
|   pass_credentials_all   |    🙅    |  bool  |  false  |

This repository will be stored in a local :simple-helm: helm repositories database.

### name

Local name alias.

### url

URL of the repository.

### username

Username for the repository.

### password

Password for the repository.


### force

Update existing repository exists if settings differ.

## lifecycle

> Aka global hooks. Introduced in [:material-tag: v0.28.0](https://github.com/helmwave/helmwave/releases/tag/v0.28.0)

|     field     | required | type  | default |
|:-------------:|:--------:|:-----:|:-------:|
|    pre_up     |    🙅    | array |   []    |
|    post_up    |    🙅    | array |   []    |
|   pre_down    |    🙅    | array |   []    |
|   post_down   |    🙅    | array |   []    |
|   pre_build   |    🙅    | array |   []    |
|  post_build   |    🙅    | array |   []    |
| pre_rollback  |    🙅    | array |   []    |
| post_rollback |    🙅    | array |   []    |



We don't call lifecycle the hooks on purpose
so as not to confuse you with the original functionality of [:simple-helm: helm hooks](https://helm.sh/docs/topics/charts_hooks/).

=== "short syntax"

    ```yaml
    version: ⟨⟨ ver ⟩⟩
    lifecycle:
      pre_build:
        - echo "run global pre_build script"
    ```

=== "full syntax"

    ```yaml
    version: ⟨⟨ ver ⟩⟩
    lifecycle:
      pre_build:
        - cmd: echo 
          args: ['"run', 'global', 'pre_build', 'script"']
          show: true
    ```


## releases[]

Almost all options that are here are native :simple-helm: helm options.

|            field            | required |       type       | default | `helmwave build` |  helm option  |
|:---------------------------:|:--------:|:----------------:|:-------:|:----------------:|:-------------:|
|          **name**           |    ✅     |      string      |   ""    |        ✅         | :simple-helm: |
|        **namespace**        |    ✅     |      string      |   ""    |        ✅         | :simple-helm: |
|          **chart**          |    ✅     | string or object |   {}    |        ✅         | :simple-helm: |
|      create_namespace       |    🙅    |       bool       |  false  |                  | :simple-helm: |
|           values            |    🙅    |      array       |   []    |        ✅         | :simple-helm: |
|            tags             |    🙅    |      array       |   []    |        ✅         |               |
|    offline_kube_version     |    🙅    |      string      |   ""    |        ✅         |               |
|            store            |    🙅    |      object      |   {}    |        ✅         |               |
|          lifecycle          |    🙅    |      object      |   {}    |        ✅         |               |
|         depends_on          |    🙅    |      array       |   []    |        ✅         |               |
|        allow_failure        |    🙅    |       bool       |  false  |                  |               |
|  pending_release_strategy   |    🙅    |      string      |   ""    |                  |               |
|            wait             |    🙅    |       bool       |  false  |                  | :simple-helm: |
|        wait_for_jobs        |    🙅    |       bool       |  false  |                  | :simple-helm: |
|           timeout           |    🙅    |     interval     |   5m    |                  | :simple-helm: |
|         max_history         |    🙅    |       int        |    0    |                  | :simple-helm: |
|           context           |    🙅    |      string      |   ""    |                  |               |
|         description         |    🙅    |      string      |   ""    |                  | :simple-helm: |
|           atomic            |    🙅    |       bool       |  false  |                  | :simple-helm: |
|       cleanup_on_fail       |    🙅    |       bool       |  false  |                  | :simple-helm: |
|            devel            |    🙅    |       bool       |  false  |                  | :simple-helm: |
|        disable_hooks        |    🙅    |       bool       |  false  |                  | :simple-helm: |
| disable_open_api_validation |    🙅    |       bool       |  false  |                  | :simple-helm: |
|            force            |    🙅    |       bool       |  false  |                  | :simple-helm: |
|         enable_dns          |    🙅    |       bool       |  false  |                  | :simple-helm: |
|          recreate           |    🙅    |       bool       |  false  |                  | :simple-helm: |
|        reset_values         |    🙅    |       bool       |  false  |                  | :simple-helm: |
|        reuse_values         |    🙅    |       bool       |  false  |                  | :simple-helm: |
|          skip_crds          |    🙅    |       bool       |  false  |                  | :simple-helm: |
|          sub_notes          |    🙅    |       bool       |  false  |                  | :simple-helm: |
|        post_renderer        |    🙅    |      array       |   []    |        ✅         | :simple-helm: |

### name

Release name. I hope you know what it is.

### namespace

:simple-kubernetes: kubernetes namespace.

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

### create_namespace

If set to `true` Helmwave will create the release namespace if not present.

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

[:material-duck: example](../examples/values-delimiter-flags/)

#### render

Allows disabling templating values at all.

[:material-duck: example](../examples/values-render-flag)

#### strict

Allows to fail if values file doesn't exist.

[:material-duck: example](../examples/values-strict-flag)

### tags[]

It allows you to choose releases for build.

It works with next options for [`build` command](../cli/#step-1-building-a-plan)

!!! success "Flags"

    ```shell
    --tags value, -t value  It allows you choose releases for build. Example: -t tag1 -t tag3,tag4 [$HELMWAVE_TAGS]
    --match-all-tags        Match all provided tags (default: false) [$HELMWAVE_MATCH_ALL_TAGS]
    ```

#### How to work with `--tags` and `--match-all-tags`?

!!! example inline "Suppose we have next `helmwave.yml` with 4 releases"

    1. redis-a
    2. redis-b
    3. memcached-a
    4. memcached-b

<img width="200" src="https://habrastorage.org/webt/45/f7/o_/45f7o_wad_mokyvpy-rtmqs7rno.png" />

:material-duck: example of `helmwave.yml` for this case.

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

### offline_kube_version

> Introduced in [:material-tag: v0.27.3](https://github.com/helmwave/helmwave/releases/tag/v0.27.3)

If `offline_kube_version` set helmwave will use this version to build plan.
Without this option, helmwave will ask :simple-kubernetes: kubernetes for a version.

!!! tip "`offline_kube_version` also can help you if you want to use different environments for `helmwave build` and `helmwave up`."

[:material-duck: example](examples/private-env/README.md)

### store

It allows passing your custom fields from `helmwave.yml` to values.

[:material-duck: example](../examples/store-greeting-hello/)

### lifecycle

> aka hooks

We don't call lifecycle the hooks on purpose so as not to confuse you with the original functionality of
[:simple-helm: helm hooks](https://helm.sh/docs/topics/charts_hooks/).



### depends_on[]

`depends_on` can be an object or a string. If it's a string, it will be treated as a `name`.

|  field   | required |  type  | default |
|:--------:|:--------:|:------:|:-------:|
| **name** |    🙅    | string |   ""    |
|   tag    |    🙅    | string |   ""    |
| optional |    🙅    |  bool  |  false  |

`depends_on` is a list of releases that allow you to deploy a sequence.

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


It allows setting explicit dependencies between releases. Dependant release will start upgrading only after all its dependencies finished upgrading

### allow_failure

Allows all dependant releases to proceed even if release failed.

### pending_release_strategy

> Introduced in [:material-tag: v0.21.0](https://github.com/helmwave/helmwave/releases/tag/v0.21.0)

Strategy to handle releases in pending statuses (`pending-install`, `pending-upgrade`, `pending-rollback`)

If helmwave tries to upgrade release that is currently in one of the pending statuses,
it will follow specified strategy:

- `""` (or not specified) - do nothing. :simple-helm: helm will fail in this case;
- `rollback` - rollback release to a previous version. Upgrade will happen after `rollback` is complete;
- `uninstall` - uninstall release. Upgrade will happen after `uninstall` is complete.

### wait

We recommend using `wait` for all releases. It will wait for all resources to be ready.

### wait_for_jobs

We recommend using `wait_for_jobs` for all releases. It will wait for all jobs to be completed.

### timeout

Time to wait for release to install.

!!! danger "if you enable `kubedog` this option will be required."

### max_history

Limit the maximum number of revisions saved per release. Use 0 for no limit (default 0)

???+ tip "Recommendation is using `3` for this option."

    `previous release` + `current release` + `next release` = **`3`**

### context

Allows using custom :simple-kubernetes: kubecontext for release.

!!! danger "Kubedog can't be enabled when there are releases in multiple contexts."

### description

Additional information about release.

### atomic

if set, upgrade process rolls back changes made in case of failed upgrade.

### cleanup_on_fail

Allow deletion of new resources created in this upgrade when upgrade fails.

### devel

Use development versions, too. Equivalent to version '>0.0.0-0'.

### disable_hooks

Disable pre/post upgrade hooks

### disable_open_api_validation

If set, the upgrade process will not validate rendered templates against the Kubernetes OpenAPI Schema

### force

Force resource updates through a replacement strategy

!!! tip "We don't recommend using this option."

### enable_dns

Enable DNS resolution in templates.

### recreate

Allows deleting and then creating resources (pods) when needed instead of updating.

!!! tip "We don't recommend using this option."


### reset_values

When upgrading, reset the values to the ones built into the chart.

### reuse_values

When upgrading, reuse the last release's values and merge it into the new configuration.

!!! tip "We don't recommend using this option."

### skip_crds

If set, no CRDs will be installed. By default, CRDs are installed if not already present.

Be careful with this option.

- If you have a release that depends on CRDs, it will fail.
- Sometimes you should enable `installCRD: true` in your chart like cert-manager.

### sub_notes

If set, render sub chart notes along with the parent.
This option determines whether sub-notes are rendered in the chart.

### post_renderer

You can use custom commands to change rendered manifests.

