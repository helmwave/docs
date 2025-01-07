# Remote Source

!!! danger "Experimental feature"

    This feature can change in future

`Remote source` allows you use [go-getter](https://github.com/hashicorp/go-getter) syntax to fetch helmwave.yml form Git Mercurial, HTTP ,Amazon S3, Google GCP 



```shell
helmwave build --remote-source github.com/helmwave/unit-test-go-getter
```

**Logs**

```
[🙃 aka INFO]: using cache for remote source
	remote source: github.com/helmwave/unit-test-go-getter
	cache path: /Users/zhilyaev/Library/Caches/helmwave/remote-source/2d4e600d4fa708cb8642b0fcd7ff4597a7b435e5552adedb4bd61a75888f61b4
[🙃 aka INFO]: 🔨 Building releases...
[🙃 aka INFO]: 🔨 Building values...
[🙃 aka INFO]: 🔨 no values provided
	release: nginx@test
[🙃 aka INFO]: 🔨 Building repositories...
[🙃 aka INFO]: 🗄 repo has been added to the plan
	repository: bitnami
[🙃 aka INFO]: ❎ repository already exists with the same configuration, skipping
	repository: bitnami
[🙃 aka INFO]: 🔨 Building registries...
[🙃 aka INFO]: 🔨 Building charts...
[🙃 aka INFO]: 🔨 Building manifests...
[🙃 aka INFO]: ❎ skipping updating dependencies for remote chart
	release: nginx@test
[🙃 aka INFO]: ❎ found chart in helm cache, using it
	release: nginx@test
	path: /Users/zhilyaev/Library/Caches/helm/repository/nginx-13.1.7.tgz
[🙃 aka INFO]: ✅  manifest done
	release: nginx@test
[🙃 aka INFO]: 🔨 Building graphs...
[🙃 aka INFO]: show graph:
┌─────────────┐
│ nginx@test  │
└─────────────┘

[🙃 aka INFO]: 🏗 Plan
	releases:
	  - nginx@test
	repositories:
	  - bitnami
	registries:
	  -
[🙃 aka INFO]: 🆚 Diff manifests in the kubernetes cluster
[🙈 aka WARNING]: I can't get release from k8s: failed to get release nginx@test: release: not found
[🙃 aka INFO]: 🏗 Planfile is ready!

```
