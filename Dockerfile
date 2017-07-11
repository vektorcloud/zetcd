FROM quay.io/vektorcloud/go:dep AS build

ENV VERSION v0.0.3

RUN go get github.com/coreos/zetcd/cmd/zetcd \
    && go get github.com/coreos/zetcd/cmd/zkctl \
    && cd "$GOPATH/src/github.com/coreos/zetcd" \
    && git checkout "$VERSION" \
    && cd cmd/zetcd \
    && go install \
    && cd ../zkctl \
    && go install 

FROM quay.io/vektorcloud/base:3.6

COPY --from=build /go/bin/zetcd /usr/bin/
COPY --from=build /go/bin/zkctl /usr/bin/

ENTRYPOINT ["/usr/bin/zetcd"]
