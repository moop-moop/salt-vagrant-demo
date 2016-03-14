install unzip from download:
  file.managed:
    - name: C:\Windows\unzip.exe
    #- source: salt://unzip/files/unzip.exe
    - source: http://stahlworks.com/dev/unzip.exe
    - source_hash: sha256=8d9b5190aace52a1db1ac73a65ee9999c329157c8e88f61a772433323d6b7a4a
