### `--diff-mode`

> Introduced in [:material-tag: v0.12.0](https://github.com/helmwave/helmwave/releases/tag/v0.12.0)
 

- `live` - diff with live :simple-kubernetes: cluster
- `local` - diff with local plan
- `none` - disable diff

Combine `--diff-mode=local` or `--diff-mode=none` with [`offline_kube_version`](yaml/#offline_kube_version) to build a plan without kubernetes.

![diff example](assets/diff.png)
