project: {{ env "CI_PROJECT_NAME" }}
version: 0.9.1


repositories:
  - name: your-private-git-repo-hosted-charts
    url: https://{{ env "GITHUB_TOKEN"}}@raw.githubusercontent.com/foo/bar/master/


.options: &options
  install: true
  namespace: {{ env "NS" }}


releases:
  - name: hello
    chart: foo/bar
    options:
      <<: *options