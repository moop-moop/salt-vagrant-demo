install apachelounge from zip:
  file.managed:
    - name: C:\httpd.zip
    - source: http://www.apachelounge.com/download/VC14/binaries/httpd-2.4.16-win64-VC14.zip
    - source_hash: http://www.apachelounge.com/download/VC14/binaries/httpd-2.4.16-win64-VC14.zip.txt
    #- source_hash: sha256=467BF6136D1D8CF1F6CA2D61BD6C64C115CF9EB133A50835B6E8CDFDDA1D1D04