version: 0.21.0

repositories:
  # Docs: https://docs.gitlab.com/ee/user/packages/helm_repository/
  - url: {{ env "CI_API_V4" }}/projects/{{env "CI_PROJECT_ID" }}/packages/helm/stable`
    username: gitlab-ci-token
    password: {{ env "CI_JOB_TOKEN" }}


.options: &options
  namespace: test
  create_namespace: true


releases:
  - name: hello
    chart: foo/bar
    <<: *options
