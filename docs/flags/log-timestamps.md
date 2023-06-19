### `--log-timestamps`

Add additional block with timestamp information in logs.

=== "text"
    
    ```shell
    helmwave --log-timestamps --log-format text build -f docs/examples/quick-start/helmwave.yml 
    INFO[2023-06-19T05:51:32+04:00] 🔨 Building releases...                       
    INFO[2023-06-19T05:51:32+04:00] 🔨 Building graphs...                         
    INFO[2023-06-19T05:51:32+04:00] show graph:
    ┌─────────────────┐
    │ a@my-namespace  │
    └─────────────────┘
                       
                       
                       
    ┌─────────────────┐
    │ b@my-namespace  │
    └─────────────────┘ 
    INFO[2023-06-19T05:51:32+04:00] 🔨 Building values...                         
    INFO[2023-06-19T05:51:32+04:00] 🔨 no values provided                          release=b@my-namespace
    INFO[2023-06-19T05:51:32+04:00] 🔨 no values provided                          release=a@my-namespace
    INFO[2023-06-19T05:51:32+04:00] 🔨 Building repositories...                   
    INFO[2023-06-19T05:51:32+04:00] 🔨 Building registries...                     
    INFO[2023-06-19T05:51:32+04:00] 🗄 registry has been added to the plan         registry=registry-1.docker.io
    INFO[2023-06-19T05:51:32+04:00] 🔨 Building charts...                         
    INFO[2023-06-19T05:51:34+04:00] Pulled: registry-1.docker.io/bitnamicharts/nats:7.8.3 
    ```

=== "json"

    ```shell
    helmwave --log-timestamps --log-format json build -f docs/examples/quick-start/helmwave.yml 
    {
      "level": "info",
      "msg": "🔨 Building releases...",
      "time": "2023-06-19T05:52:24+04:00"
    }
    {
      "level": "info",
      "msg": "🔨 Building graphs...",
      "time": "2023-06-19T05:52:24+04:00"
    }
    {
      "level": "info",
      "msg": "show graph:\n┌─────────────────┐\n│ a@my-namespace  │\n└─────────────────┘\n                   \n                   \n                   \n┌─────────────────┐\n│ b@my-namespace  │\n└─────────────────┘\n",
      "time": "2023-06-19T05:52:24+04:00"
    }
    {
      "level": "info",
      "msg": "🔨 Building values...",
      "time": "2023-06-19T05:52:24+04:00"
    }
    {
      "level": "info",
      "msg": "🔨 no values provided",
      "release": "b@my-namespace",
      "time": "2023-06-19T05:52:24+04:00"
    }
    {
      "level": "info",
      "msg": "🔨 no values provided",
      "release": "a@my-namespace",
      "time": "2023-06-19T05:52:24+04:00"
    }
    {
      "level": "info",
      "msg": "🔨 Building repositories...",
      "time": "2023-06-19T05:52:24+04:00"
    }
    {
      "level": "info",
      "msg": "🔨 Building registries...",
      "time": "2023-06-19T05:52:24+04:00"
    }
    ```

=== "emoji"

    ```shell
    $ helmwave --log-timestamps build -f docs/examples/quick-start/helmwave.yml 
    [2023-06-19T03:31:18+04:00] [🙃 aka INFO]: 🔨 Building releases...
    [2023-06-19T03:31:18+04:00] [🙃 aka INFO]: 🔨 Building graphs...
    [2023-06-19T03:31:18+04:00] [🙃 aka INFO]: show graph:
    ┌─────────────────┐
    │ a@my-namespace  │
    └─────────────────┘
                       
                       
                       
    ┌─────────────────┐
    │ b@my-namespace  │
    └─────────────────┘
    
    [2023-06-19T03:31:18+04:00] [🙃 aka INFO]: 🔨 Building values...
    [2023-06-19T03:31:18+04:00] [🙃 aka INFO]: 🔨 no values provided
            release: b@my-namespace
    [2023-06-19T03:31:18+04:00] [🙃 aka INFO]: 🔨 no values provided
            release: a@my-namespace
    [2023-06-19T03:31:18+04:00] [🙃 aka INFO]: 🔨 Building repositories...
    ```
