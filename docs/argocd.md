# ArgoCD Plugin

ArgoCD can use helmwave for rendering kubernetes manifests.
In this case, helmwave will be a template engine, not a deployment tool. 
So features like [kubedog](examples/kubedog) and [monitors](examples/monitors) will not work.

You can find more information [:simple-github: here](https://github.com/helmwave/argocd-plugin)


We will modify original argocd helm values


## Enable Config Management Plugins (CMP)


```yaml
configs:
  cmp:
    create: true
```

## Define plugins

```yaml
repoServer:
  extraContainers:
    - name: helmwave-plugin
      command: [ /var/run/argocd/argocd-cmp-server ]
      args: [ --loglevel, debug ]
      image: ghcr.io/helmwave/helmwave:⟨⟨ ver ⟩⟩
```

Since [:material-tag: v0.40.0](https://github.com/helmwave/helmwave/releases/tag/v0.40.0) you can use special [ :octicons-container-24: gitops image](https://github.com/helmwave/helmwave/pkgs/container/gitops)

## Command for generation manifests

```yaml
configs:
  cmp:
    plugins:
      helmwave-plugin:
        generate:
          command: [ "/bin/ash", "-c" ]
          args:
            - |
              helmwave build &> /tmp/log.txt && find .helmwave/manifest -type f | xargs cat
```

[:simple-github: full example](https://github.com/helmwave/argocd-plugin)
