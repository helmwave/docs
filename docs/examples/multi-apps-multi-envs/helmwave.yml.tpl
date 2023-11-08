project: &project my-project
version: "⟨⟨ ver ⟩⟩"

{{- defineDatasource "envs" "envs.yml" }}
{{- $envs := (ds "envs") }}

# general options for all releases
.options: &options
  wait: true
  wait_for_jobs: true
  force: false
  chart: some-chart
  atomic: false
  max_history: 3
  create_namespace: true
  offline_kube_version: 1.25
  pending_release_strategy: rollback
  

releases:
  {{- range $env, $settings := $envs}}
  ###############################
  #
  #       {{ $env }}
  #
  ##############################
  {{- range $app := (file.ReadDir "./values") }}
  {{- if ne $app "_" }}
  {{- if has $settings.releases $app}}
  # use next command to deploy: helmwave up --build -t {{ $app }} -t {{ $env }}
  - name: {{ $app }}
    namespace: {{ $env }}
    timeout: {{ $settings.timeout }}
    kubecontext: {{ $settings.kubecontext }}
    values:
      - _/_.yml # values for all envs & all apps
      - _/{{ $env }}.yml # default values for specific env
      - {{ $app }}/_.yml # default values for an application
      - {{ $app }}/{{ $env }}.yml # values for specific application and specific env
    tags: [{{ $app }}, {{ $env }}]
    <<: *options
  {{- end }}
  {{- end }}
  {{ end }}
  {{ end }}
  
