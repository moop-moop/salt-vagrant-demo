get service1 list:
  cmd.run:
    - name: net start
    - require:
      - cmd: get serviceB list

get service2 list:
  cmd.run:
    - name: net start    