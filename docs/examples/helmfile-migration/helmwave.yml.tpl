{{- $env := getenv "ENV" -}}

{{- defineDatasource "envs" "envs.yml" -}}
{{- $envs := (ds "envs").envs -}}

{{ $e := index $envs $env}}
{{- $kubecontext := $e.kubecontext -}}
{{ $r := $e.releases }}

repositories:
  - name: gitlab  
    url: https://charts.gitlab.io/  

.options: &options
  context: {{ $kubecontext }}
  atomic: true
  timeout: 1200
  max_history: 3



releases:
  {{- if (index $r "gitlab") }}
  - name: gitlab
    <<: *options
    chart: gitlab/gitlab  
    version: 7.2.2  
    namespace: gitlab
    tags: ["gitlab"]
    values:  
    - ./values/{{ $env }}/gitlab.yaml
  {{- end }}


  {{- if (index $r "minio") }}
  - name: minio  
    chart: ./charts/minio  
    namespace: minio  
    values:  
    - ./values/{{ $env }}/minio.yaml  
    secrets:  
    - src: ./values/{{ $env }}/minio-secret.yaml
      renderer: sops
  {{- end }}


  {{- if (index $r "grafana") }}
  - name: grafana  
    chart: ./charts/grafana  
    namespace: grafana  
    values:  
    - src: ./values/{{ $env }}/grafana.yaml  
      renderer: copy
    secrets:  
    - src: ./values/{{ $env }}/grafana-secret.yaml
      renderer: sops
  {{- end }}


  {{- if (index $r "filebeat") }}
  - name: filebeat  
    chart: ./charts/filebeat  
    namespace: filebeat  
    values:  
    - ./values/{{ $env }}/filebeat.yaml  
    secrets:  
    - src: ./values/{{ $env }}/filebeat-secret.yaml
      renderer: sops
  {{- end }}
