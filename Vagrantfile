# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.omnibus.chef_version = :latest
  config.vm.hostname = "kafka1"
  config.vm.box = "opscode_ubuntu-12.04"
  config.vm.box_url = "http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_ubuntu-12.04_chef-provisionerless.box"
  config.vm.network :private_network, ip: "33.33.33.10"

  config.vm.provision :chef_solo do |chef|
    chef.run_list = [
        "recipe[zoo-kafka::vagrant]"
    ]
  end
end
