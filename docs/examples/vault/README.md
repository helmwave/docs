# Vault

> [ [Source] ](https://github.com/helmwave/docs/tree/0.20.x/docs/examples/vault)


**Project structure**

```
├── README.md
├── helmwave.yml
└── vaules-secret.yaml
```

**Step 1. Create next secret**

```bash
vault kv put secret/test hello=world 
```


**Step 2. Create `helmwave.yml`**

```yaml
{% include "helmwave.yml" %}
```

**Step 3. Create `vaules-secret.yaml`**

```yaml
{% include "vaules-secret.yaml" %}
```


**Step 4. Run `helmwave build --templater gomplate`**

You will get 

```yaml
secret: world
revesion_of_secret: 2
```


## Debug with gomplate

1. install gomplate binary
2. run it in your console


```console
gomplate -d "vault=vault+https:///secret/data/test" -i '{{(ds "vault").metadata.version}}'
gomplate -d "vault=vault+https:///secret/data/test" -i '{{(ds "vault").data.hello}}'
```

