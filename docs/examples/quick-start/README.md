# 🔰 Quick Start

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

    This steps generates [plan](../../cli/#step-2-working-with-plan)

4. If everything is ok , deploy plan

    ```shell
    helmwave up 
    ```

    Output will be like that:

    ```shell
    [🙃 aka INFO]: ✅ redis-a@my-namespace
    [🙃 aka INFO]: ✅ redis-b@my-namespace
    [🙃 aka INFO]: Success 2 / 2
    ```

5. **Check**

    ```shell
    $ helm list -n my-namespace
    NAME                    NAMESPACE       REVISION        UPDATED                                 STATUS          CHART                   APP VERSION
    redis-a                 my-namespace    1               2020-10-31 17:05:35.829766 +0300 MSK    deployed        redis-11.2.3            6.0.9      
    redis-b                 my-namespace    1               2020-10-31 17:05:39.437556 +0300 MSK    deployed        redis-11.2.3            6.0.9  

    $ k get po -n my-namespace                                                                                                                         
    NAME               READY   STATUS    RESTARTS   AGE
    redis-a-master-0   1/1     Running   0          64s
    redis-a-slave-0    1/1     Running   0          31s
    redis-a-slave-1    1/1     Running   0          62s
    redis-b-master-0   1/1     Running   0          59s
    redis-b-slave-0    1/1     Running   0          32s
    redis-b-slave-1    1/1     Running   0          51s
    ```

6. **Congratulations!**

## Live mode

<script id="asciicast-399676" src="https://asciinema.org/a/399676.js" async></script>