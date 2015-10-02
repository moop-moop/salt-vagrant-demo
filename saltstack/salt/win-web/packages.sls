refresh winrepo:
  module.run:
    - name: pkg.refresh_db
install ms vc redistributables:
  pkg.installed:
    - pkgs:
      - ms-vc10-redistributable-2010
      - ms-vc11-redistributable-2012
      - ms-vc14-redistributable-2015
    - require:
      - module: refresh winrepo 