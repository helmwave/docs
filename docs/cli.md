# 🛠 CLI Reference

```
NAME:
   helmwave - is like docker-compose for helm

USAGE:
   helmwave [global options] command [command options] [arguments...]

VERSION:
   0.12.1

DESCRIPTION:
   This tool helps you compose your helm releases!
   0. $ helmwave yml
   1. $ helmwave build
   2. $ helmwave up

COMMANDS:
   build, plan                                        🏗 Build a plan
   diff, vs                                           🆚 Differences between plan1 and plan2
   up, install, apply, sync, deploy                   🚢 Apply your plan
   list, ls                                           👀 List of deployed releases
   rollback                                           ⏮  Rollback your plan
   status                                             👁️ Status of deployed releases
   down, uninstall, destroy, delete, del, rm, remove  🔪 Delete all
   validate, check, lint                              🛂 Validate your plan
   yml                                                📄 Render helmwave.yml.tpl -> helmwave.yml
   version, ver                                       Show shorts version
   completion                                         Generate completion script
   help, h                                            Shows a list of commands or help for one command

GLOBAL OPTIONS:
   --log-format value         You can set: [ text | json | pad | emoji ] (default: "emoji") [$HELMWAVE_LOG_FORMAT]
   --log-level value          You can set: [ debug | info | warn  | fatal | panic | trace ] (default: "info") [$HELMWAVE_LOG_LEVEL, $HELMWAVE_LOG_LVL]
   --log-color                Force color (default: true) [$HELMWAVE_LOG_COLOR]
   --kubedog-log-width value  Set kubedog max log line width (default: 140) [$HELMWAVE_KUBEDOG_LOG_WIDTH]
   --help, -h                 show help (default: false)
   --version, -v              print the version (default: false)

```

---

## step #0: yml

It allows render `helmwave.yml.tpl` to `helmwave.yml`

## step #1: build

This command generates `.helmwave/` 


## step #2: Working with plan


### up

Helmwave will install repositories and helm-releases from plan.

### down

Helmwave will uninstall helm-releases from plan.

### ls

Helmwave try getting list of helm-releases from plan.

### status

Helmwave try getting status of helm-releases from plan.

### rollback

Helmwave will rollback helm-releases from plan.

### validate

Helmwave will validate plan.


---

## Logs

> Logs options. Helmwave use [logrus](https://github.com/sirupsen/logrus) as internal logger.

### Log Format

Helmwave supports several log-format

features | `text` | `json` | `pad` | `emoji` (default)
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
helm manifests, bug report       | ❌   | ❌  | ❌  | ❌   | ❌  | ✅

`info` or `debug` is preferred.



### How to use?

```bash
helmwave <cmd> --log-color=true --log-level=debug --log-format=pad
```

or

```bash
export HELMWAVE_LOG_FORMAT=pad
export HELMWAVE_LOG_LEVEL=debug
export HELMWAVE_LOG_COLOR=true
helmwave <cmd>
```


---


## Get Version

### Long version


```bash
$ helmwave --version  
helmwave version 0.12.1

$ helmwave -v
helmwave version 0.12.1
```


### Short version

```bash
$ helmwave version
0.12.1

$ helmwave ver
0.12.1
```

## Completion

### Bash

Add this code to your ~/.bashrc

```bash
source <(helmwave completion bash)
```

```bash
echo "source <(helmwave completion bash)" >> ~/.bashrc
```


![completion-bash](assets/completion-bash.png)

### ZSH

Add this code to your ~/.zshrc

```bash
source <(helmwave completion zsh)
```

```bash
echo "source <(helmwave completion zsh)" >> ~/.zshrc
```

![completion-zsh](assets/completion-zsh.png)

