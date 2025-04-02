# 🤿 Deep dive to plan


## Definitions

By default, plan is stored in `.helmwave` directory. This directory name is `plandir`.

`Uniqname` is the unique release name, which is used to identify the release. Uniqname is `release-name@namespace@kube-context`.


## Structure

Explanation of what a plan is.

- planfile
- graph.md
- manifest/
- values/
- charts/


```
tree .helmwave
.helmwave
|____charts/
|____manifest
| |____api@ns@context.yml
| |____web@ns@context.yml
|____values
| |____api@ns@context
| | |____cb18185ed7a1e8d2f06fc029708867eb.yml
| |____web@ns@context
| | |____63610d2dfb7f7427e17b6f3f58937161.yml
|____charts
| |____api@ns@context
| | |____api-1.0.0.tgz
| |____web@ns@context
| | |____web-1.0.0.tgz
|____planfile
|____graph.md
```

### planfile

Planfile is a main yaml document. It contains information about all your planned resources.
Planfile is a computed `helmwave.yml` file.

by default, planfile is stored in `.helmwave/planfile`


### graph.md

graph.md is a markdown file. It contains visualisation for graph dependencies.

You can open this file with your favorite IDE and render image with [mermaid](https://github.com/mermaid-js/mermaid). 

### manifest

Manifest is a directory where you can find all templated kubernetes resources.

by default is stored in `.helmwave/manifest/<uniqname>.yml`

You can do whatever you want with the manifests in this directory.

**For example,**

- You can apply that manifests directly like that: `kubectl apply -f .helmwave/manifest`
- You can lint manifests [:material-duck: example](../ci/?h=ci#kube-linter-and-helmwave)

### values

Values is a directory where you can find rendered values files of your releases.
To find the values for your releases you can use next pattern: `.helmwave/values/<uniqname>/<hash>.yml`


### charts

Charts is a directory where helmwave can store downloaded charts for all your releases. 
It's not required but very useful when you want to use helmwave with DMZ cases.

