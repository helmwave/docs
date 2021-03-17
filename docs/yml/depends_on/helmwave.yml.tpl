project: my-project
version: 0.9.1

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
      - db
      - queue

  - name: frontend
    chart: some/frontend
    options:
      <<: *options
    depends_on:
      - backend