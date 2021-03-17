# 🛠 CLI Reference

```console                                                                                                                                     (k8s-sbs/stage)
NAME:
   helmwave - composer for helm

USAGE:
   helmwave [global options] command [command options] [arguments...]

VERSION:
   0.9.2

DESCRIPTION:
   🏖 This tool helps you compose your helm releases!

COMMANDS:
   yml                           📄 Render helmwave.yml.tpl -> helmwave.yml
   planfile, plan                📜 Generate planfile to plandir
   deploy, apply, sync, release  🛥 Deploy your helmwave!
   manifest, manifest            🛥 Fake Deploy
   version                       Print helmwave version
   help, h                       Shows a list of commands or help for one command

GLOBAL OPTIONS:
   --tpl value                      Main tpl file (default: "helmwave.yml.tpl") [$HELMWAVE_TPL_FILE]
   --file value, -f value           Main yml file (default: "helmwave.yml") [$HELMWAVE_FILE, $HELMWAVE_YAML_FILE, $HELMWAVE_YML_FILE]
   --plan-dir value                 It keeps your state via planfile (default: ".helmwave/") [$HELMWAVE_PLAN_DIR]
   --tags value, -t value           It allows you choose releases for sync. Example: -t tag1 -t tag3,tag4 [$HELMWAVE_TAGS]
   --parallel helm install          It allows you call helm install in parallel mode  (default: true) [$HELMWAVE_PARALLEL]
   --log-format value               You can set: [ text | json | pad | emoji ] (default: "emoji") [$HELMWAVE_LOG_FORMAT]
   --log-level value                You can set: [ debug | info | warn  | fatal | panic | trace ] (default: "info") [$HELMWAVE_LOG_LEVEL, $HELMWAVE_LOG_LVL]
   --log-color                      Force color (default: true) [$HELMWAVE_LOG_COLOR]
   --kubedog                        Enable/Disable kubedog (default: false) [$HELMWAVE_KUBEDOG, $HELMWAVE_KUBEDOG_ENABLED]
   --kubedog-status-interval value  Interval of kubedog status messages (default: 5s) [$HELMWAVE_KUBEDOG_STATUS_INTERVAL]
   --kubedog-start-delay value      Delay kubedog start, don't make it too late (default: 1s) [$HELMWAVE_KUBEDOG_START_DELAY]
   --kubedog-timeout value          Timout of kubedog multitrackers (default: 5m0s) [$HELMWAVE_KUBEDOG_TIMEOUT]
   --enable-dependencies            Enable dependencies (default: false) [$HELMWAVE_ENABLE_DEPENDENCIES]
   --help, -h                       show help (default: false)
   --version, -v                    print the version (default: false)
```

## yml

[Templating](/tpl) helmwave.yml.tpl to helmwave.yml



Suppose the `helmwave.yml.tpl` looks like:

```yaml
project: {{ env "CI_PROJECT_NAME" }}
version: 0.9.1


repositories:
- name: your-private-git-repo-hosted-charts
  url: https://{{ env "GITHUB_TOKEN"}}@raw.githubusercontent.com/foo/bar/master/


.options: &options
  install: true
  namespace: {{ env "NS" }}


releases:
  - name: redis-a
    chart: bitnami/redis
    options:
      <<: *options
```

This command will render `helmwave.yml.tpl` to `helmwave.yml`

```shell script
$ export NS=stage
$ export CI_PROJECT_NAME=my-project
$ export GITHUB_TOKEN=my-secret-token
$ helmwave yml
```

Once applied, your `helmwave.yml` will look like:

```yaml
project: my-project
version: 0.9.1


repositories:
- name: your-private-git-repo-hosted-charts
  url: https://my-secret-token@raw.githubusercontent.com/foo/bar/master/


.options: &options
  install: true
  namespace: stage


releases:
  - name: redis-a
    chart: bitnami/redis
    options:
      <<: *options
```

## planfile, plan

This command will generate `planfile`


## deploy

This command will deploy your `planfile`

## manifest

This command generate helm manifests of your `planfile`.

This is accomplished  with `--dry-run` option for `deploy` command.

