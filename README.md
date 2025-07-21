<h1 align="center"> 🛠️ docker-jsonrepair </h1>

<div align="center">
    <img src="https://img.shields.io/github/actions/workflow/status/toshy/docker-jsonrepair/security.yml?branch=main&label=Security%20check" alt="Security check" />
    <br /><br />
    <div>A <a href="https://ghcr.io/toshy/docker-jsonrepair">docker image</a> for <a href="https://github.com/josdejong/jsonrepair">jsonrepair</a></div>
</div>

## 📝 Quickstart

```shell
docker run -i --rm \
  ghcr.io/toshy/docker-jsonrepair:latest --help
```

## 📚 Examples

### Fix to output file

Fixing the `./broken.json` file:

```shell
docker run -i --rm \
  ghcr.io/toshy/docker-jsonrepair:latest < ./broken.json > ./repaired.json
```

The output is written to `./repaired.json`:

### Overwrite `broken.json` with repaired contents

Fixing the `./broken.json` file:

```shell
docker run -i --rm \
  -u $(id -u):$(id -g) \
  -v ${PWD}:/data \
  --workdir /data \
  ghcr.io/toshy/docker-jsonrepair:latest broken.json --overwrite
```

The input file `broken.json` is overwritten with the repaired contents.

## 🧰 Build

Build docker image from [`docker-bake.hcl`](./docker-bake.hcl) with the `APPLICATION_VERSION` argument for the desired `jsonrepair` version.

```shell
docker buildx bake --set *.args.APPLICATION_VERSION=3.13.0 --load
```

The built image will be available with the default tag `docker-jsonrepair:local`.

```shell
docker run -i --rm docker-jsonrepair:local --help
```

## ❕ License

This repository comes with a [MIT license](./LICENSE).
