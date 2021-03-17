project: my-project
version: 0.5.0

releases:
  - name: backend
    chart: my/backend
    options:
      install: true
    store:
      secret:
        type: vault
        path: secret/my/backend
    values:
      - my-custom-values.yml

  - name: frontend
    chart: my/frontend
    options:
      install: true
    store:
      secret:
        type: vault
        path: secret/my/frontend
    values:
      - my-custom-values.yml
