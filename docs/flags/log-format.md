### `--log-format`

Helmwave supports different log formatters

|    features    |                   `text`                    |                   `json`                    |                    `pad`                    |                                         `emoji` (default)                                         |
|:--------------:|:-------------------------------------------:|:-------------------------------------------:|:-------------------------------------------:|:-------------------------------------------------------------------------------------------------:|
|     Color      |                      ✅                      |                      ❌                      |                      ✅                      |                                                🌈                                                 |
| Human readable |                     🧐                      |                     🤖                      |                    🧐🧐                     |                                                 ✅                                                 |
|  Performance   |                     🚀                      |                     🐢                      |                     ✈️                      |                                                🐢                                                 |
|     Module     | TextFormatter (in-built `logrus` formatter) | JSONFormatter (in-built `logrus` formatter) | TextFormatter (in-built `logrus` formatter) | [logrus-emoji-formatter](https://github.com/helmwave/logrus-emoji-formatter) special for helmwave |

=== "text"

    ```shell
    $ helmwave --log-format text build -f docs/examples/quick-start/helmwave.yml
    INFO 🔨 Building releases...                       
    INFO 🔨 Building graphs...                         
    INFO show graph:
    ┌─────────────────┐
    │ a@my-namespace  │
    └─────────────────┘
                       
                       
                       
    ┌─────────────────┐
    │ b@my-namespace  │
    └─────────────────┘ 
    INFO 🔨 Building values...                         
    INFO 🔨 no values provided                          release=a@my-namespace
    INFO 🔨 no values provided                          release=b@my-namespace
    INFO 🔨 Building repositories...                   
    INFO 🔨 Building registries...                     
    INFO 🗄 registry has been added to the plan         registry=registry-1.docker.io
    INFO 🔨 Building charts...                         
    INFO Pulled: registry-1.docker.io/bitnamicharts/nats:7.8.3 
    INFO Digest: sha256:5f80350b8a85177e4a9c7ed968f77c47bedcc461418172fb66594bc61fa1ffac 
    INFO Pulled: registry-1.docker.io/bitnamicharts/nats:7.8.3 
    INFO Digest: sha256:5f80350b8a85177e4a9c7ed968f77c47bedcc461418172fb66594bc61fa1ffac 
    INFO 🔨 Building manifests...                      
    INFO ❎ skipping updating dependencies for remote chart  release=b@my-namespace
    INFO ❎ skipping updating dependencies for remote chart  release=a@my-namespace
    INFO Pulled: registry-1.docker.io/bitnamicharts/nats:7.8.3 
    INFO Digest: sha256:5f80350b8a85177e4a9c7ed968f77c47bedcc461418172fb66594bc61fa1ffac 
    INFO Pulled: registry-1.docker.io/bitnamicharts/nats:7.8.3 
    INFO Digest: sha256:5f80350b8a85177e4a9c7ed968f77c47bedcc461418172fb66594bc61fa1ffac
    ...
    ```

=== "json"

    ```shell
    $ helmwave --log-format json build -f docs/examples/quick-start/helmwave.yml
    {
      "level": "info",
      "msg": "🔨 Building releases...",
    }
    {
      "level": "info",
      "msg": "🔨 Building graphs...",
    }
    {
      "level": "info",
      "msg": "show graph:\n┌─────────────────┐\n│ a@my-namespace  │\n└─────────────────┘\n                   \n                   \n                   \n┌─────────────────┐\n│ b@my-namespace  │\n└─────────────────┘\n",
    }
    {
      "level": "info",
      "msg": "🔨 Building values...",
    }
    ```

=== "pad"

    ```shell
    $ helmwave --log-format pad build -f docs/examples/quick-start/helmwave.yml
    INFO    🔨 Building releases...                       
    INFO    🔨 Building graphs...                         
    INFO    show graph:
    ┌─────────────────┐
    │ a@my-namespace  │
    └─────────────────┘
                       
                       
                       
    ┌─────────────────┐
    │ b@my-namespace  │
    └─────────────────┘ 
    INFO    🔨 Building values...                         
    INFO    🔨 no values provided                          release=b@my-namespace
    INFO    🔨 no values provided                          release=a@my-namespace
    INFO    🔨 Building repositories...                   
    INFO    🔨 Building registries...                     
    INFO    🗄 registry has been added to the plan         registry=registry-1.docker.io
    INFO    🔨 Building charts...                         
    ```

=== "emoji"

    ```shell
    $ helmwave --log-format emoji build -f docs/examples/quick-start/helmwave.yml
    [🙃 aka INFO]: 🔨 Building releases...
    [🙃 aka INFO]: 🔨 Building graphs...
    [🙃 aka INFO]: show graph:
    ┌─────────────────┐
    │ a@my-namespace  │
    └─────────────────┘
                       
                       
                       
    ┌─────────────────┐
    │ b@my-namespace  │
    └─────────────────┘
    
    [🙃 aka INFO]: 🔨 Building values...
    [🙃 aka INFO]: 🔨 no values provided
            release: b@my-namespace
    [🙃 aka INFO]: 🔨 no values provided
            release: a@my-namespace
    [🙃 aka INFO]: 🔨 Building repositories...
    [🙃 aka INFO]: 🔨 Building registries...
    [🙃 aka INFO]: 🗄 registry has been added to the plan
            registry: registry-1.docker.io
    [🙃 aka INFO]: 🔨 Building charts...
    [🙃 aka INFO]: Pulled: registry-1.docker.io/bitnamicharts/nats:7.8.3
    ```