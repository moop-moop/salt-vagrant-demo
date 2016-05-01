install some common linux packages:
  pkg.installed:
    - refresh: True
    - pkgs:
      - htop
      - strace
      - vim
      - curl
