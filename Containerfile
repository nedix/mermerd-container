ARG ALPINE_VERSION=3.23
ARG GO_VERSION=1.25
ARG MERMERD_VERSION=v0.12.0

FROM golang:${GO_VERSION}-alpine${ALPINE_VERSION} AS build

ARG MERMERD_VERSION

RUN apk add --virtual .build-deps \
        git \
    && export CGO_ENABLED=0  \
    && go install github.com/KarnerTh/mermerd@${MERMERD_VERSION} \
    && apk del .build-deps

FROM gcr.io/distroless/static

COPY --link --from=build /go/bin/mermerd /usr/local/bin/mermerd

ENTRYPOINT ["/usr/local/bin/mermerd"]
