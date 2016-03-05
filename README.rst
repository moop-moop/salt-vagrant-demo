=================
Salt Vagrant Demo
=================

A Salt Demo using Vagrant.


Instructions
============

Run the following commands in a terminal. Git, VirtualBox and Vagrant must
already be installed.

.. code-block:: bash

    git clone https://github.com/UtahDave/salt-vagrant-demo.git
    cd salt-vagrant-demo
    vagrant up


This will download Ubuntu and Windows Server 2012R2 Hyper-V VirtualBox images and create five virtual
machines for you. One will be a Salt Master named `master`, two will be Ubuntu Salt
Minions named 'minion1' and 'minion2' and two will be Windows Server minions named 'winion1' and 'winion2'.  The Salt Minions will point to the Salt Master and the Minion's keys will already be accepted. Because the keys are
pre-generated and reside in the repo, please be sure to regenerate new keys if
you use this for production purposes.

You can then run the following commands to log into the Salt Master and begin
using Salt.

.. code-block:: bash

    vagrant ssh master
    sudo salt \* test.ping
Notes
=====
The Windows minions (winions) are Windows Server 2012 R2 Hyper V Vagrant boxes from here:
https://github.com/msabramo/vagrant_hyperv_server_free
