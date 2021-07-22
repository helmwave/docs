site_name: Helmwave
site_description: 'The helmwave`s docs'
site_author: 'Dmitriy Zhilyaev'
docs_dir: docs/
repo_name: 'helmwave/helmwave'
repo_url: 'https://github.com/helmwave/helmwave'
edit_uri: 'https://github.com/helmwave/helmwave.github.io/edit/main/docs/'
site_url: 'https://helmwave.github.io'
copyright: Copyright © 2020 - 2021 Dmitriy Zhilyaev


nav:
  - Home: index.md
  - install.md
  - Templating: tpl.md

plugins:
  - search
  - mermaid2
  - include-markdown

theme:
  name: material
  logo: https://raw.githubusercontent.com/helmwave/logo/main/logo.ico
  favicon: https://raw.githubusercontent.com/helmwave/logo/main/logo.ico
  custom_dir: docs/overrides
  features:
  - navigation.top


extra:
  version:
    provider: mike
    default: latest
    analytics:
      provider: google
      property: ${GOOGLE_ANALYTICS_KEY}
      #  https://github.com/jimporter/mike/issues/64
      # property: !ENV GOOGLE_ANALYTICS_KEY
  social:
  - icon: fontawesome/brands/docker
    link: https://hub.docker.com/diamon/helmwave
  - icon: fontawesome/brands/github
    link: https://github.com/helmwave
  - icon: fontawesome/brands/telegram
    link: https://t.me/helmwave

markdown_extensions:
  - pymdownx.highlight
  - pymdownx.superfences:
      # make exceptions to highlighting of code:
      custom_fences:
        - name: mermaid
          class: mermaid
          format: !!python/name:mermaid2.fence_mermaid


