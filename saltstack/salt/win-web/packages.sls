update_win_repo:
  module.run:
    - name: pkg.refresh_db
win-web_packages:
  pkg.installed:
    - pkgs:
      - ms-vc10-redistributable-2010
      - ms-vc11-redistributable-2012
      - ms-vc14-redistributable-2015