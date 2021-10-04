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
export VERSION=0.13.0
wget -c https://github.com/helmwave/helmwave/releases/download/v$VERSION/helmwave_$VERSION_darwin_amd64.tar.gz -O - | tar -xz
mv helmwave /usr/local/bin/
```

---

## 🐧 Linux

Download one of [releases](https://github.com/helmwave/helmwave/releases)

```sh
export VERSION=0.13.0
wget -c https://github.com/helmwave/helmwave/releases/download/v$VERSION/helmwave_$VERSION_linux_amd64.tar.gz -O - | tar -xz
mv helmwave /usr/local/bin/
```


---

## 🪟 Windows

!!! attention "We haven't tried running this on Windows."


Download one of [releases](https://github.com/helmwave/helmwave/releases)

---

## :material-docker: Run as a container ![Docker Pulls](https://img.shields.io/docker/pulls/diamon/helmwave)

```
docker run diamon/helmwave
docker run --entrypoint=ash -it --rm --name helmwave diamon/helmwave
```

---

## Install with go get ![GitHub go.mod Go version](https://img.shields.io/github/go-mod/go-version/zhilyaev/helmwave)

```sh
export VERSION=0.13.0
GO111MODULE=on go get github.com/helmwave/helmwave/cmd/helmwave@$VERSION
```

---

## :material-git: Compile from source

```bash
git clone git@github.com:helmwave/helmwave.git
cd helmwave
go build ./cmd/helmwave
mv helmwave /usr/local/bin/
```

---

## Install with [marcosnils/bin](https://github.com/marcosnils/bin)

```bash
bin install github.com/helmwave/helmwave
```