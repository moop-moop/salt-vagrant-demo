{%- from 'win_tomcat7/map.jinja' import t7 with context %}
{%- set current_version =  salt['grains.get']('tomcat7:version',None) %}
{%- set current_path = salt['grains.get']('tomcat7:install_path',None) %}

include:
  - win_unzip

install tomcat7 from download:
  archive.extracted:
    - name: {{t7.install_path}}
    # API key already included in the agent file downloaded from a valid New Relic account
    - source: http://apache.claz.org/tomcat/tomcat-7/v{{t7.version}}/bin/apache-tomcat-{{t7.version}}-windows-x64.zip
    - source_hash: https://www.apache.org/dist/tomcat/tomcat-7/v{{t7.version}}/bin/apache-tomcat-{{t7.version}}-windows-x64.zip.sha1
    - archive_format: zip
    - if_missing: {{t7.install_path}}apache-tomcat-{{t7.version}}\
    - require:
      - file: install unzip from download

{%- if t7.version != None and t7.install_path != None and t7.version > current_version %}
set tomcat7 grains:
  grains.present:
    - name: tomcat7
    - force: True
    - value:
      - version: {{t7.version}}
      - install_path: {{t7.install_path}}
{%- endif %}