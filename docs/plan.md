# Deep dive to plan

By default, plan is stored in `.helmwave` directory

Explanation of what a plan is.

- planfile
- graph.md
- manifest/
- values/
- charts/

# planfile

Planfile is a main yaml document. It contains information about all your planned resources.
Planfile is a computed `helmwave.yml` file.



# graph.md

graph.md is a markdown file. It contains visualisation for graph dependencies.

You can open this file with your favorite IDE and render image with [mermaid](https://github.com/mermaid-js/mermaid). 

# manifest

Manifest is a directory where you can find all templated kubernetes resources in next format `<release>@<namespace>.yml`

You can scan the manifests in this directory.

See the [:material-duck: example](../ci/?h=ci#kube-linter-and-helmwave)

Sure! You can apply that manifests directly like that: `kubectl apply -f .helmwave/manifest`

# values

Manifest is a directory where you can find rendered values files of your releases.
To find the values for your releases you can use next pattern : `./helmwave/values/<release>@<namespace>/<hash>.yml`

# charts

Charts is a directory where helmwave can store downloaded charts for all your releases. 
It's not required but very useful when you want to use helmwave with DMZ cases.

