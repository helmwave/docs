# 📄 Templating

Helmwave uses [Go templates](https://godoc.org/text/template) for templating.

Helmwave supports all built-in functions / sprig / gomplate / custom.


## [Sprig](https://godoc.org/github.com/Masterminds/sprig)

If you've ever written helm charts, then you're already familiar with it.

http://masterminds.github.io/sprig/

## [Gomplate](https://docs.gomplate.ca/)

Since v0.14.0. Helmwave works with Gomplate.

### How to enable gomplate for v0.14.0 helmwave

**helmwave.yml**

```yaml
template:
  gomplate:
    enabled: true
```

#### Usage

```yaml
repositories:
  - name: bitnami
    url: https://charts.bitnami.com/bitnami

template:
  gomplate:
    enabled: true
    data:
      sources:
        secret:
          url:
            scheme: aws+sm
            path: 'hello/foobar'

releases:
  - name: app
    chart:
      name: bitnami/nginx
    namespace: test
    values:
      - vaules-secret.yaml
```


### Issues

- https://github.com/helmwave/helmwave/issues/159
- https://github.com/helmwave/helmwave/issues/103




## [Custom](https://github.com/helmwave/helmwave/blob/release-0.15.1/pkg/template/func.go)

- `toYaml` marshals a map into a string
- `fromYaml` reads a golang string and generates a map
- `readFile` get file as string
- `hasKey` get true if field is exists
- `get` (Sprig's original `get` is available as `sprigGet`)
- `setValueAtPath` PATH NEW_VALUE traverses a golang map, replaces the value at the PATH with NEW_VALUE
- `requiredEnv` The requiredEnv function allows you to declare a particular environment variable as required for
  template rendering. If the environment variable is unset or empty, the template rendering will fail with an error
  message.