

# 📄 Templating

> Helmwave using [go templates](https://godoc.org/text/template) for templating.

Helmwave supports all built-in functions / [`sprig`](#sprig) / [`gomplate`](#gomplate) and several custom functions.
We recommend using [`gomplate`](#gomplate).


```shell title="flag"
--templater value   Select template engine: sprig or gomplate (default: "sprig") [$HELMWAVE_TEMPLATER, $HELMWAVE_TEMPLATE_ENGINE]`
```

!!! danger "Explain context :simple-helm: helm vs helmwave"

    There is a different context between `helm` and `helmwave`.
    You can't pass variables from helmwave to your :simple-helm: helm chart templates.
    You should use helmwave to render values of your chart.



## [Sprig](http://masterminds.github.io/sprig/)

- [:simple-github:  masterminds/sprig](https://github.com/Masterminds/sprig)
- [:simple-readthedocs: documentations](http://masterminds.github.io/sprig/)

If you've ever written :simple-helm: helm charts, then you're already familiar with it.

## [Gomplate](https://docs.gomplate.ca/)

- [:simple-github:  hairyhenderson/gomplate](https://github.com/hairyhenderson/gomplate)
- [:simple-readthedocs: documentations](https://gomplate.ca/)


`Gomplate` is a template renderer which supports a growing list of datasources,
such as JSON (including EJSON - encrypted JSON), YAML, :simple-amazonaws: AWS EC2 metadata, BoltDB, :simple-consul: Hashicorp Consul and :simple-vault: Hashicorp Vault secrets.

## [Custom](https://github.com/helmwave/helmwave/blob/release-⟨⟨ ver ⟩⟩/pkg/template/func.go)

Custom functions will work with any template engine.

### `env`

The `env` function allows you to declare a particular environment variable as an optional for template rendering.
If the environment variable is unset or empty, the template rendering will continue with an empty string as a value.

```shell
{{ $envValue := env "envName" }}
```

### `requiredEnv`

The `requiredEnv` function allows you to declare a particular environment variable as required for template rendering.
If the environment variable is unset or empty, the template rendering will fail with an error message.

```shell
{{ $envValue := requiredEnv "envName" }}
```

> If the environment variable value starts with '/' (forward slash) and [Git for Windows](https://git-scm.com/download/win) is used, you must set `MSYS_NO_PATHCONV=1` to preserve values as-is, or the environment variable value will be prefixed with the `C:\Program Files\Git`. [Reference](https://github.com/git-for-windows/build-extra/blob/main/ReleaseNotes.md#known-issues)

### `exec`

The `exec` function allows you to run a command, returning the stdout of the command. When the command fails, the template rendering will fail with an error message.

```shell
{{ $cmdOutpot := exec "./mycmd" (list "arg1" "arg2" "--flag1") }}
```


### `readFile`

The `readFile` function allows you to read a file and return its content as the function output. On failure, the template rendering will fail with an error message.

```shell
{{ $fileContent := readFile "./myfile" }}
```


### `toYaml`

The :simple-yaml: `toYaml` function allows you to convert a value to YAML string. When has failed, the template rendering will fail with an error message.

```shell
{{ $yaml :=  $value | toYaml }}
```

### `fromYaml`

The `fromYaml` function allows you to convert a YAML string to a value. When has failed, the template rendering will fail with an error message.

```shell
{{ $value :=  $yamlString | fromYaml }}
```

### `setValueAtPath`

The `setValueAtPath` function allows you to set a value at a path. When has failed, the template rendering will fail with an error message.

```shell
{{ $value | setValueAtPath "path.key" $newValue }}
```

### `get`

The `get` function allows you to get a value at a path. when defaultValue not set. It will return nil. When has failed, the template rendering will fail with an error message.

```shell
{{ $Getvalue :=  $value | get "path.key" "defaultValue" }}
```


### `required`

The `required` function returns the second argument as-is only if it is not empty. If empty, the template rendering will fail with an error message containing the first argument.

```shell
{{ $requiredValue :=  $value | required "value not set" }}
```

