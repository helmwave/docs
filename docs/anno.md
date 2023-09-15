# 📔 Annotations

## How to use?

You should add an annotation to your `Deployment` / `StatefulSet` / `Jobs` / `DaemonSet` / etc

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: api
  annotations:
    helmwave.app/show-service-messages: "true"
```

## Helmwave's annotations

!!! danger "Initially annotations used `helmwave.dev/` namespace"

    In [:material-tag: v0.31.1](https://github.com/helmwave/helmwave/releases/tag/v0.31.1) it was switched to `helmwave.app/` with backward compatibility.
    In [:material-tag: v0.32.0](https://github.com/helmwave/helmwave/releases/tag/v0.32.0) support for old annotations was dropped.


### `helmwave.app/skip-diff`

> Introduced in [:material-tag: v0.18.0](https://github.com/helmwave/helmwave/releases/tag/v0.18.0)


Skip resource for `helm diff` function.

This is very useful for hiding Secret or sensitive data.

Useful with `--show-secret` flag.

```yaml
apiVersion: v1
kind: Secret
metadata:
  name: my-secret
  annotations:
    helmwave.app/skip-diff: "true"
```

## [kubedog's annotations](https://github.com/werf/kubedog) 🐶

> Inspired by [werf annotations](https://werf.io/documentation/reference/deploy_annotations.html).
Introduced in [:material-tag: v0.8.0](https://github.com/helmwave/helmwave/releases/tag/v0.8.0)

!!! danger "Kubedog can't be enabled when there are releases in multiple contexts."


[:material-duck: example](examples/kubedog/README.md)

---

### `helmwave.app/track-termination-mode`

Defines a condition when helmwave should stop tracking of the resource:

- `WaitUntilResourceReady` (default) — the entire deployment process would monitor and wait for the readiness of the
  resource having this annotation. Since this mode is enabled by default, the deployment process would wait for all
  resources to be ready.
- `NonBlocking` — the resource is tracked only if there are other resources that are not yet ready.

---

### `helmwave.app/fail-mode`

Defines how helmwave will handle a resource failure condition which occured after failures threshold has been reached
for the resource during deploy process:

- `FailWholeDeployProcessImmediately` (default) — the entire deploy process will fail with an error if an error occurs
  for some resource.
- `HopeUntilEndOfDeployProcess` — when an error occurred for the resource, set this resource into the “hope” mode, and
  continue tracking other resources. If all remained resources are ready or in the “hope” mode, transit the resource
  back to “normal” and fail the whole deploy process if an error for this resource occurs once again.
- `IgnoreAndContinueDeployProcess` — resource errors do not affect the deployment process.

---

### `helmwave.app/failures-allowed-per-replica`

By default, one error per replica is allowed before considering the whole deployment process unsuccessful. This setting
defines a threshold of failures after which resource will be considered as failed and helmwave will handle this
situation using fail mode.

- NUMBER

---

### `helmwave.app/log-regex`

Define a Re2 regex template that applies to all logs of all containers of all Pods owned by a resource with this
annotation. helmwave would show only those log lines that fit the specified regex template. By default, helmwave shows
all log lines.

- RE2_REGEX

---

### `helmwave.app/log-regex-for-{container}`

Defines a Re2 regex template that applies to all logs of specified container of all Pods owned by a resource with this
annotation. helmwave would show only those log lines that fit the specified regex template. By default, helmwave shows
all log lines.

- RE2_REGEX

---

### `helmwave.app/skip-logs`

Set to "true" to turn off printing logs of all containers of all Pods owned by a resource with this annotation. This
annotation is disabled by default.

- "true"|"false"

---

### `helmwave.app/skip-logs-for-containers`

Turn off printing logs of specified containers of all Pods owned by a resource with this annotation. This annotation is
disabled by default.

- string with `,` as a separator

---

### `helmwave.app/show-logs-only-for-containers`

Turn off printing logs of all containers except specified of all Pods owned by a resource with this annotation. This
annotation is disabled by default.

- string with `,` as a separator

---

### `helmwave.app/show-service-messages`

Set to "true" to enable additional real-time debugging info (including Kubernetes events) for a resource during
tracking. By default, helmwave would show these service messages only if the resource has failed the entire deploy
process.

- "true"|"false"
