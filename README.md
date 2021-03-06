# Zetcd on Alpine

[![circleci][circleci]](https://circleci.com/gh/vektorcloud/zetcd)

Zetcd serves an [Apache Zookeeper](https://zookeeper.apache.org) API backed by [Etcd](https://coreos.com/etcd/docs/latest/).


## Usage

    # Start an etcd instance
    docker run --rm -ti --net host quay.io/vektorcloud/etcd -advertise-client-urls=http://127.0.0.1:2379
    # Launch zetcd
    docker run --rm -ti --net host quay.io/vektorcloud/zetcd --zddr 0.0.0.0:2181 --endpoints localhost:2379 -v 9 -logtostderr

[circleci]: https://img.shields.io/circleci/build/gh/vektorcloud/zetcd?color=1dd6c9&logo=CircleCI&logoColor=1dd6c9&style=for-the-badge "zetcd"
