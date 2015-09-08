# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"
SALT_VERSION = "2015.8.0rc3"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.define :master do |master_config|
    master_config.vm.box = "ubuntu/trusty64"
    master_config.vm.hostname = 'saltmaster.local'
    master_config.vm.network "private_network", ip: "192.168.50.10"
    master_config.vm.synced_folder "saltstack/salt/", "/srv/salt"

    master_config.vm.provision :salt do |salt|
      salt.master_config = "saltstack/etc/master"
      salt.master_key = "saltstack/keys/master_minion.pem"
      salt.master_pub = "saltstack/keys/master_minion.pub"
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
      salt.bootstrap_options = "-P"
    end
  end

  config.vm.define :minion1 do |minion_config|
    minion_config.vm.box = "ubuntu/trusty64"
    minion_config.vm.hostname = 'saltminion1.local'
    minion_config.vm.network "private_network", ip: "192.168.50.11"
    minion_config.vm.provision :salt do |salt|
      salt.minion_config = "saltstack/etc/minion1"
      salt.minion_key = "saltstack/keys/minion1.pem"
      salt.minion_pub = "saltstack/keys/minion1.pub"
      salt.install_type = "git"
      salt.install_args = "v" + SALT_VERSION
      #salt.install_type = "stable"
      salt.verbose = true
      salt.colorize = true
      #salt.bootstrap_options = "-P"
      salt.bootstrap_options = "-F -c /tmp/ -P"
    end
  end

  # config.vm.define :minion2 do |minion_config|
  #   minion_config.vm.box = "ubuntu/trusty64"
  #   # The following line can be uncommented to use Centos
  #   # instead of Ubuntu.
  #   # Comment out the above line as well
  #   #minion_config.vm.box = "chef/centos-6.5"
  #   minion_config.vm.hostname = 'saltminion2.local'
  #   minion_config.vm.network "private_network", ip: "192.168.50.12"

  #   minion_config.vm.provision :salt do |salt|
  #     salt.minion_config = "saltstack/etc/minion2"
  #     salt.minion_key = "saltstack/keys/minion2.pem"
  #     salt.minion_pub = "saltstack/keys/minion2.pub"
  #     salt.install_type = "stable"
  #     salt.verbose = true
  #     salt.colorize = true
  #     salt.bootstrap_options = "-P"
  #   end
  # end

  config.vm.define :winion1 do |minion_config|
    minion_config.vm.box = "msabramo/HyperVServer2012"
    #minion_config.vm.host_name = 'saltwinion1'
    # Disable automatic box update checking. If you disable this, then
    # boxes will only be checked for updates when the user runs
    # `vagrant box outdated`. This is not recommended.
    # config.vm.box_check_update = false
    #minion_config.vm.box_check_update = false
    minion_config.vm.network "private_network", ip: "192.168.50.13"
    minion_config.vm.network "forwarded_port", guest: 3389, host: 3389, id: "rdp", auto_correct: true
    minion_config.vm.provision :salt do |salt|
      salt.version = SALT_VERSION
      salt.minion_config = "saltstack/etc/winion1"
      salt.minion_key = "saltstack/keys/winion1.pem"
      salt.minion_pub = "saltstack/keys/winion1.pub"
      salt.minion_id = "winion1"
      salt.run_highstate = true
    end
  end

  config.vm.define :winion2 do |minion_config|
    minion_config.vm.box = "msabramo/HyperVServer2012"
    minion_config.vm.network "private_network", ip: "192.168.50.14"
    minion_config.vm.network "forwarded_port", guest: 3389, host: 3389, id: "rdp", auto_correct: true
    minion_config.vm.provision :salt do |salt|
      salt.version = SALT_VERSION
      salt.minion_config = "saltstack/etc/winion2"
      salt.minion_key = "saltstack/keys/winion2.pem"
      salt.minion_pub = "saltstack/keys/winion2.pub"
      salt.minion_id = "winion2"
      salt.run_highstate = true
    end
  end

end
