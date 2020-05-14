# kind

[kind](https://github.com/kubernetes-sigs/kind) `docker:19.03.8-dind` image build.

## Build

Images are tagged using the version of the `kind` release packaged in the image. `kubectl` is also packaged in the image.

The `kind` version is also set in the containers `KIND_VERSION` environment variable.

## Usage

`kind` documentaion is available [online](https://kind.sigs.k8s.io/).

Example usage:
```
docker run --rm -d --privileged --name kind lazybit.ch/kind:v0.8.1
docker exec -it kind kind create cluster
docker exec -it kind kubectl cluster-info --context kind-kind
docker exec -it kind kubectl get pod --all-namespaces
```
