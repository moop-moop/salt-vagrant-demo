# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"
WIN_SALT_VERSION = "2015.8.0-3"
SALT_VERSION = "2015.8.0"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.define :master do |master_config|
    master_config.vm.box = "ubuntu/trusty64"
    master_config.vm.hostname = 'saltmaster.local'
    master_config.vm.network "private_network", ip: "192.168.50.10"
    master_config.vm.synced_folder "saltstack/salt/", "/srv/salt"
    master_config.vm.synced_folder "saltstack/formulas/", "/srv/formulas"
    master_config.vm.synced_folder "saltstack/pillar/", "/srv/pillar"
    master_config.vm.provision :salt do |salt|
      salt.master_config = "saltstack/etc/master"
      salt.master_key = "saltstack/keys/master_minion.pem"
      salt.master_pub = "saltstack/keys/master_minion.pub"
      salt.minion_key = "saltstack/keys/master_minion.pem"
      salt.minion_pub = "saltstack/keys/master_minion.pub"
      salt.seed_master = {
                          "minion1" => "saltstack/keys/minion1.pub",
                          "minion2" => "saltstack/keys/minion2.pub",
                          "winion1" => "saltstack/keys/winion1.pub",
                          "winion2" => "saltstack/keys/winion2.pub"
                         }
      salt.install_type = "git"
      salt.install_args = "v" + SALT_VERSION
      salt.install_master = true
      salt.no_minion = true
      salt.verbose = true
      salt.colorize = true
      salt.bootstrap_options = "-P -c /tmp"
    end
  end

  config.vm.define :minion1 do |minion_config|
    minion_config.vm.box = "ubuntu/trusty64"
    minion_config.vm.hostname = 'saltminion1.local'
    minion_config.vm.network "private_network", ip: "192.168.50.11"
    minion_config.vbguest.auto_update = false

    minion_config.vm.provision :salt do |salt|
      salt.minion_config = "saltstack/etc/minion1"
      salt.minion_key = "saltstack/keys/minion1.pem"
      salt.minion_pub = "saltstack/keys/minion1.pub"
      salt.install_type = "git"
      salt.install_args = "v" + SALT_VERSION
      salt.verbose = true
      salt.colorize = true
      salt.bootstrap_options = "-P -c /tmp"
    end
  end

  config.vm.define :minion2 do |minion_config|
    minion_config.vm.box = "ubuntu/trusty64"
    # The following line can be uncommented to use Centos
    # instead of Ubuntu.
    # Comment out the above line as well
    #minion_config.vm.box = "chef/centos-6.5"
    minion_config.vm.hostname = 'saltminion2.local'
    minion_config.vm.network "private_network", ip: "192.168.50.12"
    minion_config.vbguest.auto_update = false

    minion_config.vm.provision :salt do |salt|
      salt.minion_config = "saltstack/etc/minion2"
      salt.minion_key = "saltstack/keys/minion2.pem"
      salt.minion_pub = "saltstack/keys/minion2.pub"
      salt.install_type = "git"
      salt.install_args = "v" + SALT_VERSION
      salt.verbose = true
      salt.colorize = true
      salt.bootstrap_options = "-P -c /tmp"
    end
  end

  config.vm.define :winion1 do |winion_config|
    winion_config.vm.box = "msabramo/HyperVServer2012"
    winion_config.vm.network "private_network", ip: "192.168.50.13"
    winion_config.vm.network "forwarded_port", guest: 3389, host: 3389, id: "rdp", auto_correct: true
    winion_config.vbguest.auto_update = false

    winion_config.vm.provision :salt do |salt|
      salt.version = WIN_SALT_VERSION
      salt.minion_config = "saltstack/etc/winion1"
      salt.minion_key = "saltstack/keys/winion1.pem"
      salt.minion_pub = "saltstack/keys/winion1.pub"
      salt.minion_id = "winion1"
      salt.verbose = true
      salt.colorize = true
    end

    winion_config.vm.provider "virtualbox" do |v|
      v.gui = false
    end
  end

  config.vm.define :winion2 do |winion_config|
    winion_config.vm.box = "msabramo/HyperVServer2012"
    winion_config.vm.network "private_network", ip: "192.168.50.14"
    winion_config.vm.network "forwarded_port", guest: 3389, host: 3389, id: "rdp", auto_correct: true
    winion_config.vbguest.auto_update = false

    winion_config.vm.provision :salt do |salt|
      salt.version = WIN_SALT_VERSION
      salt.minion_config = "saltstack/etc/winion2"
      salt.minion_key = "saltstack/keys/winion2.pem"
      salt.minion_pub = "saltstack/keys/winion2.pub"
      salt.minion_id = "winion2"
      salt.verbose = true
      salt.colorize = true
    end

    winion_config.vm.provider "virtualbox" do |v|
      v.gui = false
    end
  end

end
