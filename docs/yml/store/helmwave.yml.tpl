project: my-project
version: 0.9.5

releases:
  - name: backend
    chart: my/backend
    options:
      install: true
      namespace: my-ns
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
      namespace: my-ns
    store:
      secret:
        type: vault
        path: secret/my/frontend
    values:
      - my-custom-values.yml
