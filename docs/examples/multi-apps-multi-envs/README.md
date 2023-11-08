# Multi apps for multi envs

If you want to manage a group of releases for several environments.
This example will render all apps and all settings for all environments.

**We can use one of two name conventions**

- 🤔 `values/$app/$env.yml`
- 🤔 `values/$env/$app.yml`

**But if we add some regions we will have**

- ❌ `values/$app/$env/$region.yml`
- ❌ `values/$app/$region/$env.yml`
- ✅ `values/$region/$env/$app.yml`
- ❌ `values/$region/$app/$env.yml`
- ✅ `values/$env/$region/$app.yml`
- ❌ `values/$env/$app/$region.yml`

**We see that next name convention is more suitable than others**

- ✅ `values/$region/$env/$app.yml`
- ✅ `values/$env/$region/$app.yml`

**Now we are dropping `$region`**

- values/$env/ <s>$region</s> /$app.yml –>  `values/$env/$app.yml`
- values/ <strike>$region</strike> /$env/$app.yml –>  `values/$env/$app.yml`

**Then the best name convention is 👍`values/$env/$app.yml`**

This is also a good way when you will write your policy like:

```
prod/* @DevOps @SecOps
dev/* @Developers
```


## Create the project

**Project structure**

```shell
⟨⟨ run_script("tree docs/examples/multi-apps-multi-envs") ⟩⟩
```


```yaml title="helmwave.yml.tpl"
{% include "./helmwave.yml.tpl" %}
```

**Build**

```shell
helmwave yml --templater gomplate 
```

```yaml title="helmwave.yml"
{% include "./helmwave.yml" %}
```

