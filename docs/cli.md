# 🛠 CLI Reference

```shell
⟨⟨ run_script("helmwave -h") ⟩⟩
```

!!! note "workflow"

    ```mermaid
    flowchart TD
        step0[step 0: helmwave.yml.tpl] -- yml --> step1[step 1: helmwave.yml] -- build --> step2[step 2: .helmwave/planfile]
        step2 --> up(up)
        step2 --> down(down)
        step2 --> ls(ls)
        step2 --> s(status)
        step2 --> r(rollback)
        step2 --> g(graph)
        step2 --> v(validate)
        step2 --> diff(diff)
    ```
    *If you don't see a graph, please reload the page.*


## `yml`

This command renders `helmwave.yml.tpl` to `helmwave.yml`.

??? success "Flags"

    ```shell
    ⟨⟨ run_script("helmwave yml -h | grep HELMWAVE_ | cut -c 4-") | indent(4) ⟩⟩
    ```

{% include "./flags/tpl.md" %}
{% include "./flags/file.md" %}
{% include "./flags/templater.md" %}


## `build`

Helmwave builds plan in complete plan directory (`.helmwave` by default) that other commands use.

Build process by default includes check against manifests of specific :simple-kubernetes: Kubernetes version (taken online), as well as diff. To build plan offline, combine `--diff-mode=local` or `--diff-mode=none` with [`offline_kube_version`](yaml/#offline_kube_version).

A plan includes:

- Downloaded remote charts
- Downloaded and templated all used values files
- Rendered manifests for each release
- Markdown file with dependency graph as mermaid diagram
- Rendered `helmwave.yml` that uses plan files (e.g., downloaded chart and values)

??? success "Flags"

    As you can see, [`build`](#build) command includes [`yml`](#yml) command flags. 
    You can pass `--yml` flag into [`build`](#build) command for launching [`yml`](#yml) command before building a plan.


    ```shell
    ⟨⟨ run_script("helmwave build -h | grep HELMWAVE_ | cut -c 4-") | indent(4) ⟩⟩
    ```

<!-- build -->
{% include "./flags/yml.md" %}
{% include "./flags/tags.md" %}
{% include "./flags/match-all-tags.md" %}
{% include "./flags/skip-unchanged.md" %}
{% include "./flags/graph-width.md" %}
{% include "./flags/remote-source.md" %}
---
{% include "./flags/diff-mode.md" %}
{% include "./flags/wide.md" %}
{% include "./flags/show-secret.md" %}
{% include "./flags/3-way-merge.md" %}
{% include "./flags/suppress.md" %}
{% include "./flags/strip-trailing-cr.md" %}
{% include "./flags/find-renames.md" %}


## `up`

Helmwave will install repositories and :simple-helm: helm releases from a plan.

??? success "Flags"

    ```shell
    ⟨⟨ run_script("helmwave up -h | grep HELMWAVE_ | cut -c 4-") | indent(4) ⟩⟩
    ```

<!-- up -->
{% include "./flags/build.md" %}
{% include "./flags/progress.md" %}
{% include "./flags/parallel-limit.md" %}
---
> Introduced in [:material-tag: v0.8.0](https://github.com/helmwave/helmwave/releases/tag/v0.8.0)

{% include "./flags/kubedog.md" %}
{% include "./flags/kubedog-status-interval.md" %}
{% include "./flags/kubedog-start-delay.md" %}
{% include "./flags/kubedog-timeout.md" %}
{% include "./flags/kubedog-log-width.md" %}
{% include "./flags/kubedog-track-all.md" %}

## `down`

> Introduced in [:material-tag: v0.12.2](https://github.com/helmwave/helmwave/releases/tag/v0.12.2)

Helmwave will uninstall :simple-helm: helm releases from plan.

??? success "Flags"

    ```shell
    ⟨⟨ run_script("helmwave down -h | grep HELMWAVE_ | cut -c 4-") | indent(4) ⟩⟩
    ```

```bash
$ helmwave down      
[🙃 aka INFO]: ✅ frontend@test uninstalled!
[🙃 aka INFO]: ✅ database@test uninstalled!
[🙃 aka INFO]: ✅ backend@test uninstalled!
```

## `ls`

> Introduced in [:material-tag: v0.11.0](https://github.com/helmwave/helmwave/releases/tag/v0.11.0)


Helmwave will get a list of :simple-helm: helm releases from a plan.

??? success "Flags"

    ```shell
    ⟨⟨ run_script("helmwave ls -h | grep HELMWAVE_ | cut -c 4-") | indent(4) ⟩⟩
    ```

```bash
$ helmwave ls      
[🙃 aka INFO]: Should be 3 releases
   NAME    | NAMESPACE | REVISION |            UPDATED             |  STATUS  | CHART | VERSION  
-----------+-----------+----------+--------------------------------+----------+-------+----------
  frontend | test      |        1 | 2021-11-10 04:41:23.330989     | deployed | this  | 0.1.0    
           |           |          | +0300 MSK                      |          |       |          
  database | test      |        1 | 2021-11-10 04:41:23.353473     | deployed | this  | 0.1.0    
           |           |          | +0300 MSK                      |          |       |          
  backend  | test      |        1 | 2021-11-10 04:41:23.270076     | deployed | this  | 0.1.0    
           |           |          | +0300 MSK                      |          |       |
```


## `status`

> Introduced in [:material-tag: v0.11.0](https://github.com/helmwave/helmwave/releases/tag/v0.11.0)

Helmwave try getting status of :simple-helm: helm releases from a plan.

??? success "Flags"

    ```shell
    ⟨⟨ run_script("helmwave status -h | grep HELMWAVE_ | cut -c 4-") | indent(4) ⟩⟩
    ```

```bash
$ helmwave status      
[🙃 aka INFO]: Status of frontend@test
        status: deployed
        revision: 1
        name: frontend
        namespace: test
        chart: frontend-0.1.0
        last deployed: 2021-11-10 04:41:23.330989 +0300 MSK
[🙃 aka INFO]: Status of database@test
        status: deployed
        revision: 1
        name: database
        namespace: test
        chart: database-0.1.0
        last deployed: 2021-11-10 04:41:23.353473 +0300 MSK
[🙃 aka INFO]: Status of backend@test
        name: backend
        namespace: test
        chart: backend-0.1.0
        last deployed: 2021-11-10 04:41:23.270076 +0300 MSK
        status: deployed
        revision: 1
```

## `rollback`

> Introduced in [:material-tag: v0.12.0](https://github.com/helmwave/helmwave/releases/tag/v0.12.0)

Rollback :simple-helm: helm releases from a plan.

??? success "Flags"

    ```shell
    --revision value                                   rollback all releases to this revision (default: -1)
    ⟨⟨ run_script("helmwave rollback -h | grep HELMWAVE_ | cut -c 4-") | indent(4) ⟩⟩
    ```

{% include "./flags/revision.md" %}
---
> Introduced in [:material-tag: v0.30.0](https://github.com/helmwave/helmwave/releases/tag/v0.30.0)

{% include "./flags/kubedog.md" %}
{% include "./flags/kubedog-status-interval.md" %}
{% include "./flags/kubedog-start-delay.md" %}
{% include "./flags/kubedog-timeout.md" %}
{% include "./flags/kubedog-log-width.md" %}
{% include "./flags/kubedog-track-all.md" %}


```bash
$ helmwave rollback      
[🙃 aka INFO]: ✅ frontend@test rollback!
[🙃 aka INFO]: ✅ database@test rollback!
[🙃 aka INFO]: ✅ backend@test rollback!
```

## `graph`

> Introduced in [:material-tag: v0.27.2](https://github.com/helmwave/helmwave/releases/tag/v0.27.2)

Show only :material-graph: graph of :simple-helm: helm releases from plan.
Graph draws with [:simple-github: helmwave/asciigraph](https://github.com/helmwave/asciigraph)

??? success "Flags"

    ```shell
    ⟨⟨ run_script("helmwave graph -h | grep HELMWAVE_ | cut -c 4-") | indent(4) ⟩⟩
    ```

{% include "./flags/graph-width.md" %}

## `validate`

> Introduced in [:material-tag: v0.12.0](https://github.com/helmwave/helmwave/releases/tag/v0.12.0)


Helmwave will validate a plan. Helmwave always validates plan before any command.

??? success "Flags"

    ```shell
    ⟨⟨ run_script("helmwave validate -h | grep HELMWAVE_ | cut -c 4-")  | indent(4) ⟩⟩
    ```

```shell
$ helmwave validate                                                          
$ echo $?                   
0
```


## `diff`

> Introduced in [:material-tag: v0.18.0](https://github.com/helmwave/helmwave/releases/tag/v0.18.0)

??? success "Flags"

    ```shell
    ⟨⟨ run_script("helmwave diff -h | grep HELMWAVE_ | cut -c 4-") | indent(4) ⟩⟩
    ```

{% include "./flags/wide.md" %}
{% include "./flags/show-secret.md" %}
{% include "./flags/3-way-merge.md" %}
{% include "./flags/suppress.md" %}
{% include "./flags/strip-trailing-cr.md" %}
{% include "./flags/find-renames.md" %}


Diff has 2 subcommands `plan` and `live`.

=== "`live`"

    This command will diff with manifests in the :simple-kubernetes: kubernetes cluster 

    ```shell title="options"
    ⟨⟨ run_script("helmwave diff live -h | grep HELMWAVE_ | cut -c 4-") | indent(4) ⟩⟩
    ```
    
    ```shell
    helmwave diff live
    ```

=== "`plan`"

    This command will diff with local plan

    ```shell title="options"
    ⟨⟨ run_script("helmwave diff plan -h | grep HELMWAVE_ | cut -c 4-") | indent(4) ⟩⟩
    ```
    
    ```shell
    helmwave diff plan
    ```

## `version`

Get version of current helmwave.

=== "Long version"

    ```bash
    $ helmwave --version  
    helmwave version ⟨⟨ ver ⟩⟩
    
    $ helmwave -v
    helmwave version ⟨⟨ ver ⟩⟩
    ```

=== "Short version"

    ```bash
    $ helmwave version
    ⟨⟨ ver ⟩⟩
    
    $ helmwave ver
    ⟨⟨ ver ⟩⟩
    ```

## `completion`

Generates scripts for shell completion.

=== ":material-bash: bash"

    Add this code to your ~/.bashrc
    
    ```bash
    source <(helmwave completion bash)
    ```

    ```bash
    echo "source <(helmwave completion bash)" >> ~/.bashrc
    ```

    ![bash completion example](assets/completion-bash.png)

=== ":material-bash: zsh"

    Add this code to your ~/.zshrc
    
    ```bash
    source <(helmwave completion zsh)
    ```
    
    ```bash
    echo "source <(helmwave completion zsh)" >> ~/.zshrc
    ```
    
    ![zsh completion example](assets/completion-zsh.png)

## `schema`

You can generate json schema for autocomplete and validate `helmwave.yml` in your [IDE](../ide).

```shell
helmwave schema > helmwave.schema.json
```

## 🏳️ Global flags

Global flags available in any command.

???+ success "Flags"

    ```shell
    ⟨⟨ run_script("helmwave -h | grep HELMWAVE_LOG | cut -c 4-") | indent(4) ⟩⟩
    ```

> Helmwave uses [:simple-github: sirupsen/logrus](https://github.com/sirupsen/logrus) as internal logger.

{% include "./flags/cache-dir.md" %}
{% include "./flags/log-format.md" %}
{% include "./flags/log-level.md" %}
{% include "./flags/log-color.md" %}
{% include "./flags/log-timestamps.md" %}
