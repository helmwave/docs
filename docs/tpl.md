# 📄 Templating

Helmwave uses [Go templates](https://godoc.org/text/template) for templating.

Helmwave supports all built-in functions / sprig / gomplate / custom.

Since v0.17.0. You can chose template engine with next flag:

` --templater value                Select template engine: sprig or gomplate (default: "sprig") [$HELMWAVE_TEMPLATER, $HELMWAVE_TEMPLATE_ENGINE]`

## [Sprig](https://godoc.org/github.com/Masterminds/sprig)

If you've ever written helm charts, then you're already familiar with it.

http://masterminds.github.io/sprig/

## [Gomplate](https://docs.gomplate.ca/)

> gomplate is a template renderer which supports a growing list of datasources, such as: JSON (including EJSON - encrypted JSON), YAML, AWS EC2 metadata, BoltDB, Hashicorp Consul and Hashicorp Vault secrets.




## [Custom](https://github.com/helmwave/helmwave/blob/release-0.17.2/pkg/template/func.go)

- `toYaml` marshals a map into a string
- `fromYaml` reads a golang string and generates a map
- `readFile` get file as string
- `hasKey` get true if field is exists
- `get` (Sprig's original `get` is available as `sprigGet`)
- `setValueAtPath` PATH NEW_VALUE traverses a golang map, replaces the value at the PATH with NEW_VALUE
- `requiredEnv` The requiredEnv function allows you to declare a particular environment variable as required for
  template rendering. If the environment variable is unset or empty, the template rendering will fail with an error
  message.
