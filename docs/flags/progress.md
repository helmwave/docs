### `--progress`

> Introduced in [:material-tag: v0.17.0](https://github.com/helmwave/helmwave/releases/tag/v0.17.0)
 

Enable helm debug progress output.


=== "false"

    ```shell
    helmwave up --progress=false
    [🙃 aka INFO]: 🗄 sync repositories...
    [🙃 aka INFO]: 🗄 sync registries...
    [🙃 aka INFO]: 🛥 sync releases...
    [🙃 aka INFO]: 🛥 deploying... 
            release: a@my-namespace
    [🙃 aka INFO]: 🛥 deploying... 
            release: b@my-namespace
    [🙃 aka INFO]: ✅
        release: b@my-namespace
    [🙃 aka INFO]: ✅
            release: a@my-namespace
    [🙃 aka INFO]: Success 2 / 2
    ```


=== "true"

    ```shell
    helmwave up --progress
    [🙃 aka INFO]: 🗄 sync repositories...
    [🙃 aka INFO]: 🗄 sync registries...
    [🙃 aka INFO]: 🛥 sync releases...
    [🙃 aka INFO]: 🛥 deploying... 
            release: a@my-namespace
    [🙃 aka INFO]: 🛥 deploying... 
            release: b@my-namespace
    [🙃 aka INFO]: getting history for release b
    [🙃 aka INFO]: getting history for release a
    [🙃 aka INFO]: preparing upgrade for b
    [🙃 aka INFO]: preparing upgrade for a
    [🙃 aka INFO]: performing update for a
    [🙃 aka INFO]: performing update for b
    [🙃 aka INFO]: creating upgraded release for a
    [🙃 aka INFO]: creating upgraded release for b
    [🙃 aka INFO]: checking 4 resources for changes
    [🙃 aka INFO]: checking 4 resources for changes
    [🙃 aka INFO]: Patch Secret "a-nats" in namespace my-namespace
    [🙃 aka INFO]: Patch Secret "b-nats" in namespace my-namespace
    [🙃 aka INFO]: Looks like there are no changes for Service "a-nats-headless"
    [🙃 aka INFO]: Looks like there are no changes for Service "b-nats-headless"
    [🙃 aka INFO]: Patch Service "a-nats" in namespace my-namespace
    [🙃 aka INFO]: Patch Service "b-nats" in namespace my-namespace
    [🙃 aka INFO]: Patch StatefulSet "a-nats" in namespace my-namespace
    [🙃 aka INFO]: Patch StatefulSet "b-nats" in namespace my-namespace
    [🙃 aka INFO]: waiting for release a resources (created: 0 updated: 4  deleted: 0)
    [🙃 aka INFO]: beginning wait for 4 resources with timeout of 1m0s
    [🙃 aka INFO]: waiting for release b resources (created: 0 updated: 4  deleted: 0)
    [🙃 aka INFO]: beginning wait for 4 resources with timeout of 1m0s
    [🙃 aka INFO]: StatefulSet is not ready: my-namespace/a-nats. 0 out of 1 expected pods have been scheduled
    [🙃 aka INFO]: StatefulSet is not ready: my-namespace/b-nats. 0 out of 1 expected pods have been scheduled
    [🙃 aka INFO]: StatefulSet is not ready: my-namespace/a-nats. 0 out of 1 expected pods are ready
    [🙃 aka INFO]: StatefulSet is not ready: my-namespace/b-nats. 0 out of 1 expected pods have been scheduled
    [🙃 aka INFO]: StatefulSet is not ready: my-namespace/a-nats. 0 out of 1 expected pods are ready
    [🙃 aka INFO]: StatefulSet is not ready: my-namespace/b-nats. 0 out of 1 expected pods have been scheduled
    [🙃 aka INFO]: StatefulSet is not ready: my-namespace/a-nats. 0 out of 1 expected pods are ready
    [🙃 aka INFO]: StatefulSet is not ready: my-namespace/b-nats. 0 out of 1 expected pods have been scheduled
    [🙃 aka INFO]: StatefulSet is not ready: my-namespace/a-nats. 0 out of 1 expected pods are ready
    [🙃 aka INFO]: StatefulSet is not ready: my-namespace/b-nats. 0 out of 1 expected pods have been scheduled
    [🙃 aka INFO]: StatefulSet is not ready: my-namespace/a-nats. 0 out of 1 expected pods are ready
    [🙃 aka INFO]: StatefulSet is not ready: my-namespace/b-nats. 0 out of 1 expected pods are ready
    [🙃 aka INFO]: StatefulSet is ready: my-namespace/a-nats. 1 out of 1 expected pods are ready
    [🙃 aka INFO]: StatefulSet is not ready: my-namespace/b-nats. 0 out of 1 expected pods are ready
    [🙃 aka INFO]: updating status for upgraded release for a
    [🙃 aka INFO]: StatefulSet is not ready: my-namespace/b-nats. 0 out of 1 expected pods are ready
    [🙃 aka INFO]: ✅
            release: a@my-namespace
    [🙃 aka INFO]: StatefulSet is not ready: my-namespace/b-nats. 0 out of 1 expected pods are ready
    [🙃 aka INFO]: StatefulSet is not ready: my-namespace/b-nats. 0 out of 1 expected pods are ready
    [🙃 aka INFO]: StatefulSet is ready: my-namespace/b-nats. 1 out of 1 expected pods are ready
    [🙃 aka INFO]: updating status for upgraded release for b
    [🙃 aka INFO]: ✅
            release: b@my-namespace
    [🙃 aka INFO]: Success 2 / 2
    ```
