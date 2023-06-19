# Vault

Example shows how to use :simple-vault: hashicorp vault as a data source.

**Project structure**

```
├── README.md
├── helmwave.yml
└── values-secret.yaml
```

**Step 1. Create next secret**

```bash
vault kv put secret/test hello=world 
```

**Step 2. Create `helmwave.yml`**

```yaml
{% include "helmwave.yml" %}
```

**Step 3. Create `values-secret.yaml`**

```yaml
{% include "values-secret.yaml" %}
```

**Step 4. Run `helmwave build --templater gomplate`**

You will get 

```yaml
secret: world
revision_of_secret: 2
```

## Debug with gomplate

1. install gomplate binary
2. run it in your console

```shell
gomplate -d "vault=vault+https:///secret/data/test" -i '{{(ds "vault").metadata.version}}'
gomplate -d "vault=vault+https:///secret/data/test" -i '{{(ds "vault").data.hello}}'
```

see gomplate docs [here](https://gomplate.ca/)
