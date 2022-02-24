🌊 Helmwave is **[helm3](https://github.com/helm/helm/)-native** tool for deploy your Helm Charts via **GitOps**.
HelmWave is like docker-compose for helm.

## 🚀 Features

> We focus on speed execution, tiny size, pretty debugging.

With helmwave you will become a superhero:

- Deploy multiple environments by one step
- Separate values for environments
- Common values for apps
- Keep a directory of chart value files
- Maintain changes in version control
- Template values
- Step by Step deployment (depends_on, allow_failure)
- Live tracking kubernetes resources with kubedog
- Fetch data from external datasource like vault, aws ssm
- ... and much more!

## Comparison to alternatives

|                                    |                                        🌊 HelmWave                                        |                                       Helmfile                                        |                                Helmsman                                |
|:----------------------------------:|:-----------------------------------------------------------------------------------------:|:-------------------------------------------------------------------------------------:|:----------------------------------------------------------------------:|
|               Syntax               | YAML + [sprig](http://masterminds.github.io/sprig/)/[gomplate](https://docs.gomplate.ca/) |                  YAML + [sprig](http://masterminds.github.io/sprig/)                  |                               TOML/YAML                                |
|            Requirements            |                                            No                                             | `kubectl`, `helm`<br> *`helm-diff` (optional: `helm-secrets`, `helm-s3`, `helm-git`*) |                  `kubectl`, `helm`<br> *`helm-diff`*                   |
|           Helm execution           |                               function call of bundled helm                               |                                       `os.Exec`                                       |                               `os.Exec`                                |
|           Remote values            |                                         Partially                                         |                                          Yes                                          |                                   No                                   |
|         Parallel releases          |                                            Yes                                            |                                          Yes                                          |                                   No                                   |
|       Releases dependencies        |                                     Yes (depends_on)                                      |                                      Yes (needs)                                      |                           Kind of (priority)                           |
|      Latest docker image size      |               ![](https://img.shields.io/docker/image-size/diamon/helmwave)               |            ![](https://img.shields.io/docker/image-size/chatwork/helmfile)            |     ![](https://img.shields.io/docker/image-size/praqma/helmsman)      |
|      Linux amd64 binary size       |                 ![](https://img.shields.io/badge/v0.16.7-73.8%20MB-blue)                  |       ![](https://img.shields.io/badge/v0.143.0-43.9%20MB-blue) + requirements        | ![](https://img.shields.io/badge/v3.8.0-17.7%20MB-blue) + requirements |
| Live-tracking kubernetes resources |                        [Kubedog](https://github.com/werf/kubedog)                         |                                          No                                           |                                   No                                   |
|      Compatible with helm v2       |                                            no                                             |                                          Yes                                          |                                  Yes                                   |
|         Graph dependencies         |                                            yes                                            |                                          No                                           |                                   No                                   |


🌊 Helmwave is inspired by docker-compose, terraform and helmfile,


---

Here I would like to express our gratitude to all contributors for their commits, authors of third-party dependencies and all open source community ❤️
