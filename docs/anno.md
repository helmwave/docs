# 📔 Annotations


## How to use?

You should add an annotation to your Deployment / StatefulSet / Jobs / DaemonSet

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: api
spec:
  ...
  template:
    metadata:
      annotations:
        helmwave.dev/show-service-messages: "true"
```

## Annotations for the [kubedog](https://github.com/werf/kubedog) 🐶

???+ danger
    Kubedog currently in beta.

> inspired by [werf annotations](https://werf.io/documentation/reference/deploy_annotations.html)


First step you need enable kubedog for helmwave.

```shell
export HELMWAVE_KUBEDOG_ENABLED=true
```



### `helmwave.dev/track-termination-mode`

Defines a condition when helmwave should stop tracking of the resource:

- `WaitUntilResourceReady` (default) — the entire deployment process would monitor and wait for the readiness of the
  resource having this annotation. Since this mode is enabled by default, the deployment process would wait for all
  resources to be ready.
- `NonBlocking` — the resource is tracked only if there are other resources that are not yet ready.

### `helmwave.dev/fail-mode`

Defines how helmwave will handle a resource failure condition which occured after failures threshold has been reached
for the resource during deploy process:

- `FailWholeDeployProcessImmediately` (default) — the entire deploy process will fail with an error if an error occurs
  for some resource.
- `HopeUntilEndOfDeployProcess` — when an error occurred for the resource, set this resource into the “hope” mode, and
  continue tracking other resources. If all remained resources are ready or in the “hope” mode, transit the resource
  back to “normal” and fail the whole deploy process if an error for this resource occurs once again.
- `IgnoreAndContinueDeployProcess` — resource errors do not affect the deployment process.

### `helmwave.dev/failures-allowed-per-replica`

By default, one error per replica is allowed before considering the whole deployment process unsuccessful. This setting
defines a threshold of failures after which resource will be considered as failed and helmwave will handle this
situation using fail mode.

- NUMBER

### `helmwave.dev/log-regex`

Defines a Re2 regex template that applies to all logs of all containers of all Pods owned by a resource with this
annotation. helmwave would show only those log lines that fit the specified regex template. By default, helmwave shows
all log lines.

- RE2_REGEX

### `helmwave.dev/log-regex-for-{container}`

Defines a Re2 regex template that applies to all logs of specified container of all Pods owned by a resource with this
annotation. helmwave would show only those log lines that fit the specified regex template. By default, helmwave shows
all log lines.

- RE2_REGEX

### `helmwave.dev/skip-logs`

Set to "true" to turn off printing logs of all containers of all Pods owned by a resource with this annotation. This
annotation is disabled by default.

- "true"|"false"

### `helmwave.dev/skip-logs-for-containers`

Turn off printing logs of specified containers of all Pods owned by a resource with this annotation. This annotation is
disabled by default.

- string with `,` as a separator

### `helmwave.dev/show-logs-only-for-containers`

Turn off printing logs of all containers except specified of all Pods owned by a resource with this annotation. This
annotation is disabled by default.

- string with `,` as a separator

### `helmwave.dev/show-service-messages`

Set to "true" to enable additional real-time debugging info (including Kubernetes events) for a resource during
tracking. By default, helmwave would show these service messages only if the resource has failed the entire deploy
process.

- "true"|"false"
