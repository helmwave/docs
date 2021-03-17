# 📄 Templating

Helmwave uses [Go templates](https://godoc.org/text/template) for templating.

Helmwave supports all built-in functions, [Sprig library](https://godoc.org/github.com/Masterminds/sprig), and several
advanced functions:

- `toYaml` marshals a map into a string
- `fromYaml` reads a golang string and generates a map
- `readFile` get file as string
- `hasKey` get true if field is exists
- `get` (Sprig's original `get` is available as `sprigGet`)
- `setValueAtPath` PATH NEW_VALUE traverses a golang map, replaces the value at the PATH with NEW_VALUE
- `requiredEnv` The requiredEnv function allows you to declare a particular environment variable as required for
  template rendering. If the environment variable is unset or empty, the template rendering will fail with an error
  message.

#### readFile

<details>
  <summary>my-releases.yml</summary>

  ```yaml
  releases:
    - name: redis
      repo: bitnami
    - name: memcached
      repo: bitnami
  ```

</details>

<details>
  <summary>helmwave.yml.tpl</summary>

  ```yaml
  project: my
  version: 0.9.1
  
  
  repositories:
    - name: bitnami
      url: https://charts.bitnami.com/bitnami
  
  
  .global: &global
    install: true
  
  
  releases:
  {{- with readFile "my-releases.yml" | fromYaml | get "releases" }}
    {{- range $v := . }}
    - name: {{ $v | get "name" }}
      chart: {{ $v | get "repo" }}/{{ $v | get "name" }}
      options:
        <<: *global
    {{- end }}
  {{- end }}
  ``` 

</details>

```bash
$ helmwave yml
```

<details>
  <summary>helmwave.yml</summary>

  ```yaml
  project: my
  version: 0.9.1
  
  repositories:
    - name: bitnami
      url: https://charts.bitnami.com/bitnami
  
  .global: &global
    install: true
  
  releases:
    - name: redis
      chart: bitnami/redis
      options:
        <<: *global
    - name: memcached
      chart: bitnami/memcached
      options:
        <<: *global
  ``` 

</details>
