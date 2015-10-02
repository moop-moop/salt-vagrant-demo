include:
  - unzip
  - win-web.packages

install apachelounge from zip:
  archive.extracted:
    - name: C:\apache-httpd
    - source: http://www.apachelounge.com/download/VC14/binaries/httpd-2.4.16-win64-VC14.zip
    - source_hash: sha256=467bf6136d1d8cf1f6ca2d61bd6c64c115cf9eb133a50835b6e8cdfdda1d1d04
    - archive_format: zip
    - require:
      - file: install unzip from download
      - pkg: install ms vc redistributables