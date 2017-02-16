# -*- mode: ruby -*-
# vi: set ft=ruby :

required_plugins = %w( vagrant-cachier vagrant-cumulus vagrant-reload )
required_plugins.each do |plugin|
    exec "vagrant plugin install #{plugin};vagrant #{ARGV.join(" ")}" unless Vagrant.has_plugin? plugin || ARGV[0] == 'plugin'
end

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.require_version ">= 1.8.4"
Vagrant.configure(2) do |config|

  config.vm.box = "bento/ubuntu-16.04"
  config.vm.box_check_update = false
  config.ssh.insert_key = false

  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
    config.cache.auto_detect = true
    config.cache.synced_folder_opts =
      {
         owner: '_apt'
      }
  end

  config.vm.provider "virtualbox" do |v|
    v.linked_clone = true
  end

  config.vm.define "host-ap" do |node|
    #node.vm.network :private_network, ip: "10.100.100.1"
    node.vm.hostname = "host-ap"
    node.cache.synced_folder_opts = {
    owner: "root"
    }
    node.vm.synced_folder ".", "/home/vagrant/wasfac"
    node.vm.provision "shell", path: "provision_build_hwsim.sh"
    node.vm.provision :reload
    node.vm.provision "shell", path: "provision_hostap.sh"
    node.vm.provider :virtualbox do |vb|
      vb.memory = 4096
      vb.cpus = 1
    end
  end

  config.vm.define "sta" do |node|
    node.vm.hostname = "sta"
    node.cache.synced_folder_opts = {
    owner: "root"
    }
    #node.vm.network :private_network, ip: "10.100.100.2"
    node.vm.synced_folder ".", "/home/vagrant/wasfac"
    node.vm.provision "shell", path: "provision_build_hwsim.sh"
    node.vm.provision :reload
    # node.vm.provision "shell", path: "provision_hostap.sh"
    node.vm.provider :virtualbox do |vb|
      vb.memory = 4096
      vb.cpus = 1
    end
  end
end
