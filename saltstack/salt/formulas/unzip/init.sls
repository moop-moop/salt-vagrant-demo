install unzip to windows:
  file.managed:
    - name: C:\Windows\unzip.exe
    #- source: salt://formulas/unzip/unzip.exe
    - source: http://stahlworks.com/dev/unzip.exe
    - source_hash: sah256=8d9b5190aace52a1db1ac73a65ee9999c329157c8e88f61a772433323d6b7a4a
