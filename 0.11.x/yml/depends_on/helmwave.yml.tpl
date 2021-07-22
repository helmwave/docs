project: my-project
version: 0.9.6

.options: &options
  install: true
  namespace: my-namespace


releases:
  - name: queue
    chart: some/queue
    options:
      <<: *options

  - name: db
    chart: some/db
    options:
      <<: *options

  - name: backend
    chart: some/backend
    options:
      <<: *options
    depends_on:
      - db@my-namespace
      - queue@my-namespace

  - name: frontend
    chart: some/frontend
    options:
      <<: *options
    depends_on:
      - backend@my-namespace