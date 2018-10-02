FROM alpine:3.8

LABEL maintainer="sven <sven@so36.net>"

ENV KUBE_LATEST_VERSION="v1.12.0"

ARG BUILD_DATE

# Metadata
LABEL org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/svx/kubectl" \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.docker.dockerfile="/Dockerfile"

RUN builddeps=' \
    curl \
    ' \
    && adduser -s /bin/false -D -H kubeuser \
    && apk --no-cache add \
    $builddeps \
    tini \
    ca-certificates \
    && curl -L https://storage.googleapis.com/kubernetes-release/release/${KUBE_LATEST_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
    && chmod +x /usr/local/bin/kubectl \
    && apk del --purge $builddeps

WORKDIR /root
ENTRYPOINT ["/sbin/tini", "--", "kubectl"]
CMD ["help"]
