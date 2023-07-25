### `--kubedog-track-all`

> Introduced in [:material-tag: v0.30.0](https://github.com/helmwave/helmwave/releases/tag/v0.30.0)


Track all resources, not only `Deployment`, `DaemonSet`, `StatefulSet`, `Job`.
Annotations are also respected for these resources but it wasn't tested.

!!! danger "It will probably fail for some non-namespaced custom resources because kubedog can track only namespaced resources. In this case kubedog will fail with a warning"
