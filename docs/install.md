# 📥 Installation

You can install the pre-compiled binary from 
[releases](https://github.com/helmwave/helmwave/releases), 
[packages](https://github.com/helmwave/helmwave/packages/),
use Docker or compile from the source.

Here are the steps for each of them:

--- 

## 🍏 Mac OS

Download one of [releases](https://github.com/helmwave/helmwave/releases)

Install with :beer: brew

```sh
brew install helmwave/tap/helmwave
```

or use wget
```sh
export VERSION=0.23.1
wget -c https://github.com/helmwave/helmwave/releases/download/v$VERSION/helmwave_${VERSION}_darwin_amd64.tar.gz -O - | tar -xz
mv helmwave /usr/local/bin/
```

---

## 🐧 Linux

Download one of [releases](https://github.com/helmwave/helmwave/releases)

```sh
export VERSION=0.23.1
wget -c https://github.com/helmwave/helmwave/releases/download/v$VERSION/helmwave_${VERSION}_linux_amd64.tar.gz -O - | tar -xz
mv helmwave /usr/local/bin/
```


---

## 🪟 Windows

!!! attention "We haven't tried running this on Windows."


Download one of [releases](https://github.com/helmwave/helmwave/releases)

---

## :material-docker: Run as a container ![Docker Pulls](https://img.shields.io/docker/pulls/diamon/helmwave)

> We use 2 docker registries. 

|         Registry          |          URL           |                                 project page                                  |
| :-----------------------: | :--------------------: | :---------------------------------------------------------------------------: |
|        Docker hub         | https://hub.docker.com |       [view](https://hub.docker.com/repository/docker/diamon/helmwave)        |
| Github Container registry |    https://ghcr.io     | [view](https://github.com/orgs/helmwave/packages/container/helmwave/settings) |

```bash
docker pull diamon/helmwave
docker pull ghcr.io/helmwave/helmwave
```

**Use specific version**

```bash
docker pull diamon/helmwave:0.23.1
docker pull ghcr.io/helmwave/helmwave:0.23.1

docker run --entrypoint=ash -it --rm --name helmwave ghcr.io/helmwave/helmwave:0.23.1
# helmwave version
0.23.1
#
```


**Use [scratch image](https://hub.docker.com/_/scratch)**

scratch image run with [nobody user](https://unix.stackexchange.com/questions/186568/what-is-nobody-user-and-group).

```bash
docker pull diamon/helmwave:scratch
docker pull ghcr.io/helmwave/helmwave:scratch

docker run ghcr.io/helmwave/helmwave:0.16.2-scratch version
0.16.2
```

**Use [scratch image](https://hub.docker.com/_/scratch) with specific helmwave version**

```bash
docker pull diamon/helmwave:0.23.1-scratch
docker pull ghcr.io/helmwave/helmwave:0.23.1-scratch
```

---

## Install with go get ![GitHub go.mod Go version](https://img.shields.io/github/go-mod/go-version/zhilyaev/helmwave)

```sh
export VERSION=0.23.1
GO111MODULE=on go get github.com/helmwave/helmwave/cmd/helmwave@$VERSION
```

---

## :material-git: Compile from source

```bash
git clone git@github.com:helmwave/helmwave.git
cd helmwave
go build ./cmd/helmwave
mv -f helmwave /usr/local/bin/
```

---

## Install with [marcosnils/bin](https://github.com/marcosnils/bin)

```bash
bin install github.com/helmwave/helmwave
```
