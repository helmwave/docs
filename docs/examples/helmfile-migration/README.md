# Helmfile migration

Suppose we have next `helmfile.yaml`


```yaml title="helmfile.yaml"
{% include "./helmfile.yaml" %}
```

How is it transofrm into `helmwave.yml.tpl`?


## Repistory

Trasform as is.

=== "helmfile"

    ```yaml
    repositories:
    - name: gitlab  
      url: https://charts.gitlab.io/  
    ```

=== "helmwave"

    ```yaml
    repositories:
    - name: gitlab  
      url: https://charts.gitlab.io/  
    ```

## Environments

Helmwave will use gomplate templater for resolve this problem.

```shell
export HELMWAVE_TEMPLATER=gomplate
```

    
=== "helmfile"

    ```yaml
    environments:  
    dev:  
        kubeContext: dev
        values:  
        - filebeat:  
            enabled: true  
        - minio:  
            enabled: true  
        - gitlab:  
            enabled: false  
        - grafana:  
            enabled: true
    prod:  
        kubeContext: prod
        values:  
        - filebeat:  
            enabled: true  
        - minio:  
            enabled: false  
        - gitlab:  
            enabled: true  
        - grafana:  
            enabled: false
    ```

=== "helmwave"

    1. Create `envs.yml` for storing environment settings.

    ```yaml title="envs.yml"
    {% include "./envs.yml" %}
    ```

    2. Add next code to helwmave.yml.tpl

    ```yaml title="helwmave.yml.tpl"
    {{- $env := getenv "ENV" -}}

    {{- defineDatasource "envs" "envs.yml" -}}
    {{- $envs := (ds "envs").envs -}}

    # It'll chose env setting by $ENV
    {{ $e := index $envs $env}}
    ...
    ```


## Matching release with environment

=== "helmfile"

    ```yaml
    environments:  
        dev:  
            kubeContext: dev
            values:  
            - gitlab:  
                enabled: false
    ...
    releases:
    - name: gitlab  
      condition: gitlab.enabled  
    ...
    ```

=== "helmwave"

    ```yaml 
    ...
    {{ $r := $e.releases }}
    releases:
    {{- if (index $r "gitlab") }}
      - name: gitlab  
        chart: gitlab/gitlab  
        version: 7.2.2  
        namespace: gitlab
        tags: ["gitlab"]
        values:  
        - ./values/{{ $env }}/gitlab.yaml
    {{- end }}
    ...
    ```


## Helm Defaults

Just use yaml anchors.

=== "helmfile"

    ```yaml
    helmDefaults:  
      atomic: true  
      historyMax: 3
      timeout: 1200
    ```

=== "helmwave"

    ```yaml
    .options: &options
        atomic: true
        timeout: 1200
        max_history: 3

    releases:
      - name: gitlab
        <<: *options
    ```

### Matching kubecontext with environment

=== "helmfile"

    ```yaml
    environments:  
      dev:  
        kubeContext: dev
    ```

=== "helmwave"

    ```yaml
    {{- $kubecontext := $e.kubecontext -}}
    .options: &options
        atomic: true
        timeout: 1200
        max_history: 3
        context: {{ $kubecontext }}

    releases:
      - name: gitlab
        <<: *options
    ```


## Results

=== "helmfile"

    ```yaml
    {% include "./helmfile.yaml" %}
    ```

=== "helmwave"

    ```yaml title="helmwave.yml.tpl"
    {% include "./helmwave.yml.tpl" %}
    ```

    ```yaml title="envs.yml"
    {% include "./envs.yml" %}
    ```
