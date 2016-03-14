# do I need to include the unzip formula directly or will require take care of it?
include:
  - unzip
install new relic java agent from download:
  archive.extracted:
    #zip file contains newrelic directory
    - name: C:\
    # API key already included in the agent file downloaded from a valid New Relic account
    - source: salt://newrelic-javaagent/files/newrelic-java-3.26.1.zip
    - archive_format: zip
    - if_missing: C:\newrelic\
    - require:
      - file: install unzip from download