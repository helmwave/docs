version: 0.19.0


repositories:
  - name: bitnami
    url: https://charts.bitnami.com/bitnami
  - name: renovate
    url: https://docs.renovatebot.com/helm-charts
  - name: stevehipwell
    url: https://stevehipwell.github.io/helm-charts



# General options
.options: &options
  wait: true
  wait_for_jobs: true
  force: false
  timeout: 10m
  atomic: false
  max_history: 3
  create_namespace: true


releases:
{{- with readFile "vars.yaml" | fromYaml | get "releases" }}
{{ range $v := . }}

#################################
#                               #
#      {{ $v | get "name" }}
#                               #
#################################
- name: {{ $v | get "name" }}
  chart:
    name: {{ $v | get "repo" }}/{{ $v | get "name" }}
    version: {{ $v | get "version" }}
  namespace: {{ $v | get "name" }}
  tags: [{{ $v | get "name" }}]
  values:
    - values/{{ $v | get "name" }}.yml
  <<: *options

{{ end }}
{{- end }}

