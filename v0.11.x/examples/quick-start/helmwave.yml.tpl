project: my-project
version: 0.9.1


repositories:
  - name: bitnami
    url: https://charts.bitnami.com/bitnami


.options: &options
  install: true
  namespace: my-namespace


releases:
  - name: redis-a
    chart: bitnami/redis
    options:
      <<: *options

  - name: redis-b
    chart: bitnami/redis
    options:
      <<: *options
