version: 0.27.3

repositories:
  # Docs: https://docs.gitlab.com/ee/user/packages/helm_repository/
  - url: {{ env "CI_API_V4_URL" }}/projects/{{env "CI_PROJECT_ID" }}/packages/helm/stable
    name: {{ env "CI_PROJECT_TITLE" }}
    username: gitlab-ci-token
    password: {{ env "CI_JOB_TOKEN" }}


releases:
  - name: hello
    chart: {{ env "CI_PROJECT_TITLE" }}/my-chart
    namespace: test
    create_namespace: true
