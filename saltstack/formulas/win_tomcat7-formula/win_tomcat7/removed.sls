{%- set current_version =  salt['grains.get']('tomcat7:version',None) %}
{%- set current_path = salt['grains.get']('tomcat7:install_path',None) %}

{%- if current_path != None and current_version != None %}
#stop service, delete service

remove tomcat7 folder:
  file.absent:
    - name: {{current_path}}apache-tomcat-{{current_version}}\
remove tomcat7 grains:
  grains.absent:
    - name: tomcat7
    - destructive: True
    - force: True
{%- else %}
show can't remove tomcat7:
  test.show_notification:
    - name: tomcat7 can't be removed
    - text: 'Grains not found. current_path:{{current_path}}, current_version:{{current_version}}'
{%- endif %}