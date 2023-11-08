project: &project my-project
version: "⟨⟨ ver ⟩⟩"

.options: &options
  wait: true
  wait_for_jobs: true
  force: false
  timeout: 10m
  chart: some-chart
  atomic: false
  max_history: 3
  create_namespace: true
  offline_kube_version: 1.25.2
  pending_release_strategy: rollback

releases:
  {{- range (file.ReadDir "./releases") }}
  - name: {{.}}
    tags: [{{.}}]
    namespace: *project # `namespace: {{.}}` if you want a release in own namespace
    <<: *options
    values:
      - {{.}}/values.yml
  {{ end }}
