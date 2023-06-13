# 📄 Templating

Helmwave uses [Go templates](https://godoc.org/text/template) for templating.

Helmwave supports all built-in functions / `sprig` / `gomplate` / custom.

` --templater value                Select template engine: sprig or gomplate (default: "sprig") [$HELMWAVE_TEMPLATER, $HELMWAVE_TEMPLATE_ENGINE]`

!!!+ danger "Explain context helm vs helmwave"

    There is a different context between `helm` and `helmwave`.
    You can't pass variables from helmwawve to your helm chart templates.
    You should use helmwave to render values of your chart.


!!! success "We recommend using `gomplate`"


## [Sprig](https://godoc.org/github.com/Masterminds/sprig)

If you've ever written helm charts, then you're already familiar with it.

http://masterminds.github.io/sprig/

## [Gomplate](https://docs.gomplate.ca/)

> gomplate is a template renderer which supports a growing list of datasources, such as: JSON (including EJSON - encrypted JSON), YAML, AWS EC2 metadata, BoltDB, Hashicorp Consul and Hashicorp Vault secrets.

## [Custom](https://github.com/helmwave/helmwave/blob/release-0.27.3/pkg/template/func.go)

#### `env`
The `env` function allows you to declare a particular environment variable as an optional for template rendering.
If the environment variable is unset or empty, the template rendering will continue with an empty string as a value.

```yaml
{{ $envValue := env "envName" }}
```

#### `requiredEnv`
The `requiredEnv` function allows you to declare a particular environment variable as required for template rendering.
If the environment variable is unset or empty, the template rendering will fail with an error message.

```yaml
{{ $envValue := requiredEnv "envName" }}
```

> If the environment variable value starts with '/' (forward slash) and [Git for Windows](https://git-scm.com/download/win) is used, you must set `MSYS_NO_PATHCONV=1` to preserve values as-is, or the environment variable value will be prefixed with the `C:\Program Files\Git`. [reference](https://github.com/git-for-windows/build-extra/blob/main/ReleaseNotes.md#known-issues)

#### `exec`
The `exec` function allows you to run a command, returning the stdout of the command. When the command fails, the template rendering will fail with an error message.

```yaml
{{ $cmdOutpot := exec "./mycmd" (list "arg1" "arg2" "--flag1") }}
```


#### `readFile`
The `readFile` function allows you to read a file and return its content as the function output. On failure, the template rendering will fail with an error message.

```yaml
{{ $fileContent := readFile "./myfile" }}
```


#### `toYaml`
The `toYaml` function allows you to convert a value to YAML string. When has failed, the template rendering will fail with an error message.

```yaml
{{ $yaml :=  $value | toYaml }}
```

#### `fromYaml`
The `fromYaml` function allows you to convert a YAML string to a value. When has failed, the template rendering will fail with an error message.

```yaml
{{ $value :=  $yamlString | fromYaml }}
```

#### `setValueAtPath`
The `setValueAtPath` function allows you to set a value at a path. When has failed, the template rendering will fail with an error message.

```yaml
{{ $value | setValueAtPath "path.key" $newValue }}
```

#### `get`
The `get` function allows you to get a value at a path. when defaultValue not set. It will return nil. When has failed, the template rendering will fail with an error message.

```yaml
{{ $Getvalue :=  $value | get "path.key" "defaultValue" }}
```


#### `required`
The `required` function returns the second argument as-is only if it is not empty. If empty, the template rendering will fail with an error message containing the first argument.

```yaml
{{ $requiredValue :=  $value | required "value not set" }}
```

