🌊 Helmwave is **[helm](https://github.com/helm/helm/)-native** tool for deploy your Helm Charts via **GitOps**.
HelmWave is like docker-compose for helm.

- Deploy multiple environments by one step
- Separate values for environments
- Common values for apps
- Keep a directory of chart value files
- Maintain changes in version control.
- Template values
- Step by Step deployment.

## Comparison to alternatives

|  | Helmfile | Helmsman | 🌊 HelmWave |
| --- | :-------------: | :------------: | :-----------: |
| Syntax | YAML + [sprig](http://masterminds.github.io/sprig/) | TOML | YAML + [sprig](http://masterminds.github.io/sprig/)/[gomplate](https://docs.gomplate.ca/) |
| Requirements | `kubectl`, `helm`<br> *`helm-diff`, `helm-secrets`, `helm-s3`, `helm-git`* | `kubectl`, `helm`<br> *`helm-diff`* | No |
| Helm execution | `os.Exec` | `os.Exec` | function call of bundled helm |
| Remote values | Yes | No | Partially |
| Parallel releases | No | No | Yes |
| Releases dependencies | Yes (needs) | Kind of (priority) | Yes (depends_on) |
| Latest docker image size | ![](https://img.shields.io/docker/image-size/chatwork/helmfile) | ![](https://img.shields.io/docker/image-size/praqma/helmsman) | ![](https://img.shields.io/docker/image-size/diamon/helmwave) |
| Linux amd64 binary size | ![](https://img.shields.io/badge/v0.143.0-43.9%20MB-blue) + requirements | ![](https://img.shields.io/badge/v3.8.0-17.7%20MB-blue) + requirements | ![](https://img.shields.io/badge/v0.16.7-73.8%20MB-blue)