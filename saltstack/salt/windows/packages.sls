install some common windows packages:
  pkg.installed:
    - refresh: True
    - pkgs:
      - gvim
      - clink
      - curl