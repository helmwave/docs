project: "Example: private github repo"
version: "⟨⟨ ver ⟩⟩"

repositories:
  - name: your-private-git-repo-hosted-charts
    url: https://{{ requiredEnv "GITHUB_TOKEN"}}@raw.githubusercontent.com/foo/bar/main/


.options: &options
  namespace: {{ requiredEnv "NS" }}
  create_namespace: true
  wait: true


releases:
  - name: hello
    chart:
      name: foo/bar
    <<: *options