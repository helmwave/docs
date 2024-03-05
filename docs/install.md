# 📥 Installation 

![GitHub all releases](https://img.shields.io/github/downloads/helmwave/helmwave/total)

You can install the pre-compiled binary from 
[releases](https://github.com/helmwave/helmwave/releases), 
[packages](https://github.com/helmwave/helmwave/packages/),
use Docker or compile from the source.

Here are the steps for each of them:

--- 

## :material-apple: Mac OS

Download one of [releases](https://github.com/helmwave/helmwave/releases)

=== ":beer: brew"

    ```shell
    brew install helmwave/tap/helmwave
    ```

=== "wget"

    ```shell
    export VERSION=⟨⟨ ver ⟩⟩
    export ARCH=$(uname -m) # amd64, arm64
    wget -c https://github.com/helmwave/helmwave/releases/download/v$VERSION/helmwave_${VERSION}_darwin_${ARCH}.tar.gz -O - | tar -xz
    mv helmwave /usr/local/bin/
    ```

---

## :material-linux: Linux

Download one of [releases](https://github.com/helmwave/helmwave/releases)


=== "wget"

    ```shell
    export VERSION=⟨⟨ ver ⟩⟩
    export ARCH=$(uname -m) # amd64, arm64
    wget -c https://github.com/helmwave/helmwave/releases/download/v$VERSION/helmwave_${VERSION}_linux_${ARCH}.tar.gz -O - | tar -xz
    mv helmwave /usr/local/bin/
    ```

=== ":material-debian: Debian"

    ```shell
    export VERSION=⟨⟨ ver ⟩⟩
    export ARCH=$(uname -m) # amd64, arm64
    wget -c https://github.com/helmwave/helmwave/releases/download/v$VERSION/helmwave_${VERSION}_linux_${ARCH}.deb -o helmwave.deb
    apt install ./helmwave.deb
    ```

=== ":material-redhat: RedHat"

    ```shell
    export VERSION=⟨⟨ ver ⟩⟩
    export ARCH=$(uname -m) # amd64, arm64
    wget -c https://github.com/helmwave/helmwave/releases/download/v$VERSION/helmwave_${VERSION}_linux_${ARCH}.rpm -o helmwave.rpm
    yum localinstall ./helmwave.rpm
    ```

=== ":simple-alpinelinux: Alpine"

    ```shell
    export VERSION=⟨⟨ ver ⟩⟩
    export ARCH=$(uname -m) # amd64, arm64
    wget -c https://github.com/helmwave/helmwave/releases/download/v$VERSION/helmwave_${VERSION}_linux_${ARCH}.apk -o helmwave.apk
    apk add --allow-untrusted ./helmwave.apk
    ```

---

## :material-microsoft: Windows

!!! danger "Don't use helmwave.exe"

    The [windows releases](https://github.com/helmwave/helmwave/releases) 
    have issues [#809](https://github.com/helmwave/helmwave/issues/809), [#805](https://github.com/helmwave/helmwave/issues/805)

**Recommended way is [WSL](https://learn.microsoft.com/en-us/windows/wsl/install).**

---

## :simple-linuxcontainers: Containers

![Docker Image Size (latest)](https://img.shields.io/docker/image-size/diamon/helmwave/latest)


We use 2 container registries. We recommend using the [:octicons-container-24: GitHub container registry](https://github.com/helmwave/helmwave/pkgs/container/helmwave)

|                                                     Registry                                                      |          URL           |                                 Pulls                                  |
|:-----------------------------------------------------------------------------------------------------------------:|:----------------------:|:----------------------------------------------------------------------:|
|              [:simple-docker: Docker hub](https://hub.docker.com/repository/docker/diamon/helmwave)               | https://hub.docker.com | ![DockerHub pull](https://img.shields.io/docker/pulls/diamon/helmwave) |
| [:octicons-container-24: GitHub container registry](https://github.com/helmwave/helmwave/pkgs/container/helmwave) |    https://ghcr.io     |                            *not available*                             |

=== ":simple-docker: docker with dockerhub"

    ```bash
    docker pull diamon/helmwave

    # with tag
    docker pull diamon/helmwave:⟨⟨ ver ⟩⟩
    
    docker run --entrypoint=ash -it --rm --name helmwave diamon/helmwave:⟨⟨ ver ⟩⟩
    # helmwave version
    ⟨⟨ ver ⟩⟩
    #
    ```

=== ":simple-podman: podman with ghcr.io"

    ```bash
    podman pull ghcr.io/helmwave/helmwave

    # with tag
    podman pull ghcr.io/helmwave/helmwave:⟨⟨ ver ⟩⟩
    
    podman run --entrypoint=ash -it --rm --name helmwave ghcr.io/helmwave/helmwave:⟨⟨ ver ⟩⟩
    # helmwave version
    ⟨⟨ ver ⟩⟩
    #
    ```

---

## :fontawesome-brands-golang:  `go get` 

> You must install [![GitHub go.mod Go version](https://img.shields.io/github/go-mod/go-version/zhilyaev/helmwave)
](https://golang.org/doc/install) first.

```sh
export VERSION=⟨⟨ ver ⟩⟩
GO111MODULE=on go get github.com/helmwave/helmwave/cmd/helmwave@$VERSION
```

---

## :material-git: Compile from source

> You must install [![GitHub go.mod Go version](https://img.shields.io/github/go-mod/go-version/zhilyaev/helmwave)
](https://golang.org/doc/install) first.


```bash
git clone git@github.com:helmwave/helmwave.git
cd helmwave
go build ./cmd/helmwave
mv -f helmwave /usr/local/bin/
```

---

## Install with [:material-github: marcosnils/bin](https://github.com/marcosnils/bin)

```bash
bin install github.com/helmwave/helmwave
```
