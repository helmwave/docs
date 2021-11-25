version: 0.16.2

repositories:
  - name: your-private-git-repo-hosted-charts
    url: https://{{ env "GITHUB_TOKEN"}}@raw.githubusercontent.com/foo/bar/master/


.options: &options
  namespace: {{ env "NS" }}
  createnamespace: true


releases:
  - name: hello
    chart:
      name: foo/bar
    <<: *options