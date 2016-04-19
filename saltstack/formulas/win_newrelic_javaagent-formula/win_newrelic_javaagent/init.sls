{%- from 'win_newrelic_javaagent/map.jinja' import newrelic with context %}
{%- set current_version =  salt['grains.get']('newrelic-javaagent:version',None) %}
{%- set current_path = salt['grains.get']('newrelic-javaagent:install_path',None) %}

include:
  - win_unzip

{%- if current_version != None and current_path != None and newrelic.version > current_version %}
# #remove old folder making sure tomat services stopped, use newrelic tomact instance list grains to stop
show newrelic-javaagent upgrade:
  test.show_notification:
    - name: newrelic-javaagent upgrade
    - text: 'Upgrading version {{ current_version }} to version {{ newrelic.version }}'
remove old newrelic-javaagent location:
  file.absent:
    - name: {{ current_path }}
    - require_in:
      - archive: install newrelic-javaagent from download
{%- else %}
show no newrelic-javaagent upgrade:
  test.show_notification:
    - name: newrelic-javaagent no upgrade
    - text: 'Not changing version {{ current_version }} to version {{ newrelic.version }}'
{%- endif %}

install newrelic-javaagent from download:
  archive.extracted:
    #zip file contains newrelic directory
    - name: {{newrelic.install_path}}
    # API key already included in the agent file downloaded from a valid New Relic account
    - source: salt://newrelic-javaagent/files/newrelic-java-{{newrelic.version}}.zip
    - archive_format: zip
    - if_missing: {{newrelic.install_path}}newrelic\
    - require:
      - file: install unzip from download

newrelic-javaagent configure app_name:
  file.replace:
  - name: {{newrelic.install_path}}newrelic\newrelic.yml
  - flags:
    - IGNORECASE
    - MULTILINE
  - pattern: "^(?!  #).*app_name:.*$"
  - repl: "  app_name: {{newrelic.app_name}}"
  - show_changes: True
  - require:
      - archive: install newrelic-javaagent from download

{%- if newrelic.high_security is defined %}
newrelic-javaagent configure high_security:
  file.replace:
  - name: {{newrelic.install_path}}newrelic\newrelic.yml
  - flags:
    - IGNORECASE
    - MULTILINE
  - pattern: "^(?!  #).*high_security:.*$"
  - repl: "  high_security: {{newrelic.high_security}}"
  - show_changes: True
  - require:
      - archive: install newrelic-javaagent from download
{%- endif %}

{%- if newrelic.enable_auto_app_naming is defined %}
newrelic-javaagent configure enable_auto_app_naming:
  file.replace:
  - name: {{newrelic.install_path}}newrelic\newrelic.yml
  - flags:
    - IGNORECASE
    - MULTILINE
  - pattern: "^(?!  #).*enable_auto_app_naming:.*$"
  - repl: "  enable_auto_app_naming: {{newrelic.enable_auto_app_naming}}"
  - show_changes: True
  - require:
      - archive: install newrelic-javaagent from download
{%- endif %}

{%- if newrelic.version != None and newrelic.install_path != None and newrelic.version > current_version %}
set newrelic-javaagent grains:
  grains.present:
    - name: newrelic-javaagent
    - force: True
    - value:
      - version: {{newrelic.version}}
      - install_path: {{newrelic.install_path}}newrelic\
{%- endif %}