# 🛠 CLI Reference

```
NAME:
   helmwave - composer for helm

USAGE:
   helmwave [global options] command [command options] [arguments...]

VERSION:
   0.11.0

DESCRIPTION:
   🏖 This tool helps you compose your helm releases!

COMMANDS:
   yml                           📄 Render helmwave.yml.tpl -> helmwave.yml
   planfile, plan                📜 Generate planfile to plandir
   deploy, apply, sync, release  🛥 Deploy your helmwave!
   manifest, manifest            🛥 Fake Deploy
   version                       Print helmwave version
   status                        Show release status
   ls, list                      List deployed releases
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
   --kubedog-log-width value        Set kubedog max log line width (default: 140) [$HELMWAVE_KUBEDOG_LOG_WIDTH]
   --enable-dependencies            Enable dependencies (default: false) [$HELMWAVE_ENABLE_DEPENDENCIES]
   --plan-dependencies              Automatically add dependencies to plan (default: false) [$HELMWAVE_PLAN_DEPENDENCIES]
   --match-all-tags                 Match all provided tags (default: false) [$HELMWAVE_MATCH_ALL_TAGS]
   --help, -h                       show help (default: false)
   --version, -v                    print the version (default: false)

```

## yml

> [Templating](/tpl) `helmwave.yml.tpl` to `helmwave.yml`

We added the ability to template itself. To make the tool even more flexible.

- You can change path to `helmwave.yml.tpl` use `$HELMWAVE_TPL_FILE` or `--tpl`
- You can change path to `helmwave.yml` use `$HELMWAVE_YML_FILE` or `--file`


#### Best practice

- add `helmwave.yml` to your `.gitignore`


## planfile, plan

> This command will generate `planfile`

Default it will be `.helmwave/`. You can change it use `--plan-dir` option or `$HELMWAVE_PLAN_DIR`

Plan contents 2 part.

1. Rendered values. Save as `.helmwave/<path_to_file>.<release_name>@<namespace>.plan`. 
2. Rendered helm manifests. Save as `.helmwave/.manifest/<release_name>@<namespace>.yml`


**Plan use [tags](https://helmwave.github.io/yml/tags/) for choose releases**

## deploy

This command will deploy your `planfile`

1. Generate plan.
2. Deploy plan.

## manifest

This command generates helm manifests of your `planfile`.

This is accomplished with `--dry-run` option for `deploy` command.

## status

This command shows release status of your `helmwave.yml` similar to `helm status` command

## list, ls

This command shows list of deployed releases of your `helmwave.yml` similar to `helm list` command

## Logs

> Options for logs. Helmwave use logrus as internal logger.

### Log Format

Helmwave supports several log-format

features | `text` | `json` | `pad` | `emoji`
:---: |:---:|:---:|:---:|:---:
Color | ✅   | ❌  | ✅  | 🌈
Human readable | 🧐   | 🤖  | 🧐🧐  | ✅
Performance | 🚀   | 🐢  | ✈️  | 🐢
Module | TextFormatter (in-built logrus formatter)  | JSONFormatter (in-built logrus formatter)  | TextFormatter (in-built logrus formatter)  |  [logrus-emoji-formatter](https://github.com/helmwave/logrus-emoji-formatter) special for helmwave


### Log Level

_ | `info` (default) | `warn` | `debug` | `fatal` | `panic` | `trace`
:---:|:---:|:---:|:---:|:---:|:---:|:---:
general info         | ✅   | ✅  | ✅  | ✅   | ✅  | ✅
incompatible version | ❌   | ✅  | ✅  | ✅   | ✅  | ✅
helm-debug           | ❌   | ❌  | ✅  | ✅   | ✅  | ✅
file content         | ❌   | ❌  | ✅  | ✅   | ✅  | ✅
helm manifests       | ❌   | ❌  | ❌  | ❌   | ❌  | ✅

`info` or `debug` is prefer.



### How to use?

```bash
$ helmwave <cmd> --log-color=true --log-level=debug --log-format=pad
```

or

```bash
$ export HELMWAVE_LOG_FORMAT=pad
$ export HELMWAVE_LOG_LEVEL=debug
$ export HELMWAVE_LOG_COLOR=true
$ helmwave <cmd>
```
