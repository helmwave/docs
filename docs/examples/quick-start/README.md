# 🔰 Quick Start

1) **[install helmwave](https://helmwave.github.io/docs/0.20.x/install/)**
   
2) **create helmwave.yml**

Suppose the `helmwave.yml` representing the desired state of your helm releases looks like:

```yaml
{% include "helmwave.yml" %}
```

3) **build plan**

```shell
helmwave build
```

this steps generate [plan](https://helmwave.github.io/docs/0.20.x/cli/#step-2-working-with-plan)

4) if everything is ok , deploy plan 


```shell
helmwave up 
```

Output will be like that:

```shell
[🙃 aka INFO]: ✅ redis-a@my-namespace
[🙃 aka INFO]: ✅ redis-b@my-namespace
[🙃 aka INFO]: Success 2 / 2
```

6) **check**

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

**Congratulations!**


## Live mode

> !!! Ascinema cast is too old.

<script id="asciicast-399676" src="https://asciinema.org/a/399676.js" async></script>