version: 0.20.1

releases:
  - name: my-release
    chart: my-chart-repo/my-chart-app
    # yaml says "Who is the last one is right."
    values:
      # Default
      - values/_.yml
      # For specific ENVIRONMENT
      - values/{{ requiredEnv "CI_ENVIRONMENT_NAME" }}.yml
    create_namespace: true
