project: my-project
version: 0.9.3


repositories:
  - name: bitnami
    url: https://charts.bitnami.com/bitnami


.options: &options
  install: true
  namespace: my-namespace


releases:
  - name: redis-a
    chart: bitnami/redis
    tags:
      - a
      - redis
    options:
      <<: *options

  - name: redis-b
    chart: bitnami/redis
    tags:
      - b
      - redis
    options:
      <<: *options

  - name: memcached-a
    chart: bitnami/memcached
    tags:
      - a
      - memcached
    options:
      <<: *options

  - name: memcached-b
    chart: bitnami/memcached
    tags:
      - b
      - memcached
    options:
      <<: *options