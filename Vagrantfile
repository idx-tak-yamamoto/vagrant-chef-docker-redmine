VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "opscode-centos-6.5"
  config.vm.hostname = "centos"
  config.vm.box_url = "http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_centos-6.5_chef-provisionerless.box"

  config.vm.provider "virtualbox" do |vb|
   vb.customize ["modifyvm", :id, "--memory", "2048"]
  end
  # chef�̐ݒ�
  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ["./site-cookbooks"]
    chef.add_recipe     "dockersetup"
  end

  # ���z���ɃC���X�g�[������chef�̃o�[�W����
  config.omnibus.chef_version = :latest

  config.vm.network :forwarded_port, guest: 80, host: 3000
end