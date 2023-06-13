# 🔰 Quick Start

<script async id="asciicast-591181" src="https://asciinema.org/a/591181.js"></script>

1. **[Install helmwave](../../install)** 
2. **Create `helmwave.yml`**

    Suppose the `helmwave.yml` representing the desired state of your helm releases looks like:

    ```yaml
    {% include "helmwave.yml" %}
    ```

3. **Build plan**

    ```shell
    helmwave build
    ```

    This step generates [plan](../../cli/#step-2-working-with-plan)

4. **Deploy plan**

    ```shell
    helmwave up
    ```

    Output will be like that:

    ```shell
    [🙃 aka INFO]: ✅
        release: a@my-namespace
    [🙃 aka INFO]: ✅
        release: b@my-namespace
    [🙃 aka INFO]: Success 2 / 2
    ```

5. **Check**

    ```shell
    $ helm list -n my-namespace
    NAME    NAMESPACE       REVISION        UPDATED                                 STATUS          CHART           APP VERSION
    a       my-namespace    1               2023-06-13 16:25:42.446056 +0400 +04    deployed        nats-7.8.3      2.9.17     
    b       my-namespace    1               2023-06-13 16:25:42.444662 +0400 +04    deployed        nats-7.8.3      2.9.17

    $ k get po -n my-namespace                                                                                                                         
    NAME       READY   STATUS    RESTARTS   AGE
    a-nats-0   1/1     Running   0          37s
    b-nats-0   1/1     Running   0          36s
    ```

6. **Congratulations!**
