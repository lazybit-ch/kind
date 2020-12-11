FROM docker:20.10.0-dind

ARG KIND_VERSION
ENV KIND_VERSION=${KIND_VERSION:-0.8.1}

ARG KUBECTL_VERSION
ENV KUBECTL_VERSION=${KUBECTL_VERSION:-1.17.0}

ARG HELM_VERSION
ENV HELM_VERSION=${HELM_VERSION:-3.1.2}

RUN apk add --no-cache \
        curl=7.67.0-r0 \
        git=2.24.3-r0

RUN curl -Lo /usr/local/bin/kind https://github.com/kubernetes-sigs/kind/releases/download/v${KIND_VERSION}/kind-$(uname)-amd64 && \
    chmod 755 /usr/local/bin/kind

RUN curl -Lo /usr/local/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl && \
    chmod 755 /usr/local/bin/kubectl

RUN curl https://get.helm.sh/helm-v${HELM_VERSION}-linux-386.tar.gz | tar xvz --strip-components 1 -C /usr/local/bin && \
    chmod 755 /usr/local/bin/helm
