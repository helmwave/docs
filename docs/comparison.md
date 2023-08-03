# Comparison to alternatives

> Some comparisons may be outdated as we don't check every release. If any of the tools have improved, please open a [PR](https://github.com/helmwave/docs/issues/new).

## As table

|                                                     |                                          🌊 Helmwave                                           |                                       Helmfile                                        |                           Helmsman                            |
|:---------------------------------------------------:|:----------------------------------------------------------------------------------------------:|:-------------------------------------------------------------------------------------:|:-------------------------------------------------------------:|
|                     **Syntax**                      |   YAML + [sprig](http://masterminds.github.io/sprig/)/[gomplate](https://docs.gomplate.ca/)    |                  YAML + [sprig](http://masterminds.github.io/sprig/)                  |                           TOML/YAML                           |
|                     Code style                      |                                           snake_case                                           |                                       camelCase                                       |                           camelCase                           |
|                    Requirements                     |                                               No                                               | `kubectl`, `helm`<br> *`helm-diff` (optional: `helm-secrets`, `helm-s3`, `helm-git`*) |              `kubectl`, `helm`<br> *`helm-diff`*              |
|                 **Helm execution**                  |                          function call of bundled :simple-helm: helm                           |                                       `os.Exec`                                       |                           `os.Exec`                           |
|               :simple-helm: helm diff               |                               function call of bundled helm-diff                               |                                       `os.Exec`                                       |                           `os.Exec`                           |
| **Live-tracking :simple-kubernetes: k8s resources** |                           [Kubedog](https://github.com/werf/kubedog)                           |                                          No                                           |                              No                               |
|                Get application logs                 |                           [Kubedog](https://github.com/werf/kubedog)                           |                                          No                                           |                              No                               |
|         Get :simple-kubernetes: k8s events          |           [Kubedog](https://github.com/werf/kubedog) and :simple-helm: helm progress           |                                          No                                           |                              No                               |
|                       Labels                        |                                             `tags`                                             |                                       `labels`                                        |                               ?                               |
|             Manage kube-context via iac             |                                              Yes                                               |                                          Yes                                          |                              Yes                              |
|                  Parallel releases                  |                                              Yes                                               |                                          Yes                                          | Releases with the same priority can be executed in parallel.  |
|                Parallel limitations                 |                     Smart DAG goroutine count with concurrency limitation                      |                        concurrent :simple-helm: helm processes                        |  max number of concurrent :simple-helm: helm releases to run  |
|                Releases dependencies                |                                          `depends_on`                                          |                                        `needs`                                        |                     Kind of (`priority`)                      |
|            Dependencies cross namespaces            |                                            via `@`                                             |                                        via `/`                                        |                              No                               |
|               Manage pending strategy               |                                              Yes                                               |                                          No                                           |                              No                               |
|             Explain graph dependencies              |                                              Yes                                               |                                          No                                           |                              No                               |
|                  Latest image size                  |                 ![](https://img.shields.io/docker/image-size/diamon/helmwave)                  |            ![](https://img.shields.io/docker/image-size/chatwork/helmfile)            | ![](https://img.shields.io/docker/image-size/praqma/helmsman) |
|        Compatible with :simple-helm: helm v2        |                                               No                                               |                                          Yes                                          |                              Yes                              |
|                         OCI                         |                                          `registries`                                          |                               option in `repositories`                                |                   only `pull`, not `login`                    |
|                   Lifecycle Hooks                   | Yes (pre_up, post_up, pre_down, post_down, pre_rollback, post_rollback, pre_build, post_build) |   Yes (prepare, preapply, presync, preuninstall, postuninstall, postsync, cleanup)    |                              No                               |
|                   Sub-main config                   |                                               No                                               |                                          Yes                                          |                               ?                               |
|                manage render values                 |                       `render` option and options for setting delimiters                       |                                   by file extension                                   |                               ?                               |
|                    Remote values                    |                                        HTTP/HTTPS only                                         |                                      `go-getter`                                      |                               ?                               |
|                    **Planfile**                     |                                              Yes                                               |                                          No                                           |                              No                               |
|                   Vault / AWS SSM                   |                                   via `gomplate` datasources                                   |                                   custom functions                                    |                               ?                               |


## Why not bare Helm?

### Managing multiple environments

Imagine you have multiple environments for same release (e.g. dev, stage, production, etc.). You likely have different settings.

=== ":simple-helm: helm"
    You will likely have bunch of bash scripts that run helm with different values files. It is quite hard to support and improve.

=== "🌊 helmwave"
    Set up `helmwave.yml.tpl` to include different values for different environments.

Check out [:material-duck: the example](../examples/single-app-multi-envs)

### Passing generated values

For example, you need to pass docker image tag.

=== ":simple-helm: helm"
    Either you template values file (e.g. with ansible/jinja2 or any other templater) or you pass every individual value via `--set`.

=== "🌊 helmwave"
    Every values file are templated via `sprig` or `gomplate` which allows you to generate any values even with external commands.

Check out [:material-duck: the example](../examples/pass-git-tag)

### Install multiple releases

Imagine you need to deploy more than 1 release (e.g. deploy 10+ microservices to dynamic feature environment).

=== ":simple-helm: helm"
    Either deploy releases one-by-one or create an umbrella chart (we think it is bad pattern).

=== "🌊 helmwave"
    All releases are deployed in parallel with a dependency mechanism.

Check out [:material-duck: the example](../examples/umbrella-evil)

### Managing dependencies between releases

Imagine you need to deploy some DBMS and an app that uses it. While DBMS is provisioning (or scheduling) your app already starts failing probes. It may lead to failing app release.

=== ":simple-helm: helm"
    Manually deploy releases one-by-one.

=== "🌊 helmwave"
    Use `depends_on` to set up explicit dependencies between releases.

### Release stuck in pending state

If your CI for some reason killed helm process your next `helm upgrade` will fail because release is in `pending-upgrade` state.

=== ":simple-helm: helm"
    You need to either do `helm rollback` (doesn't work for `pending-install`) or `helm delete` (destructive in production) and try upgrade one more time.

=== "🌊 helmwave"
    Use `pending_release_strategy` to automatically do rollbacks or delete before upgrade if required.

### Live-tracking release

=== ":simple-helm: helm"
    You can enable debug logs which will provide you logs of what helm does.

=== "🌊 helmwave"
    Use [kubedog](https://github.com/werf/kubedog) to show status progress.

Check out [:material-duck: the example](../examples/kubedog)

## Why not [Helmfile](https://github.com/helmfile/helmfile) ![GitHub Repo stars](https://img.shields.io/github/stars/helmfile/helmfile)?

We don't consider helmwave as a helmfile killer. Helmfile is an awesome project that really inspired us to implement the same in a bit different way with some other features. Probably there would be no helmwave if there was no helmfile.

### Helm execution

=== "helmfile"
    Helmfile runs `helm` via `os.Exec`. It means that:

    - You need `helm` binary as well as a lot of other dependencies (e.g. libc). Helmfile's official docker image requires for around 300MB.
    - Helmfile collects, parses and outputs `helm` stdout/stderr. Any helm backward incompatibility (even occasional) may be a big pain in the ass.
    - `os.Exec` is not the fastest way to run helm. If 10ns of overhead does really matter to you.

=== "🌊 helmwave"
    Helmwave runs `helm` as an internal bundled library. It means that:

    - Helmwave already contains builtin specific (we try to keep it up to date) `helm` version.
    - There are no helmwave dependencies at all - it can be completely static binary. Official docker image requires for around 30MB. And it can run both in musl and glibc environments.
    - We constantly check out new `helm` features and try to enhance them in helmwave.


### Live-tracking release

=== "helmfile"
    Only helm progress is available although there is [a discussion about kubedog integration](https://github.com/helmfile/helmfile/discussions/660).

=== "🌊 helmwave"
    Use [kubedog](https://github.com/werf/kubedog) to show status progress.

Check out [:material-duck: the example](../examples/kubedog)

### Release stuck in pending state

If your CI for some reason killed helm process your next `helm upgrade` will fail because release is in `pending-upgrade` state.

=== "helmfile"
    The same as for helm

=== "🌊 helmwave"
    Use `pending_release_strategy` to automatically do rollbacks or delete before upgrade if required.

### Templating engine

By templating engine we understand collection of builtin functions for default golang templates.

=== "helmfile"
    Helmfile only supports `sprig` as a template engine.

=== "🌊 helmwave"
    Every values file can be templated via `sprig` or `gomplate` (or even non-templated at all). Gomplate is an awesome huge engine that has a lot of features.
