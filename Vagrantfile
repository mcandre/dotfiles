VAGRANTFILE_API_VERSION = '2'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = 'precise64'
  config.vm.box_url = 'http://files.vagrantup.com/precise64.box'

  #
  # Use host authenticaton for git and maven.
  #
  # Ensure host private key is registered with host SSH agent:
  #
  # ssh-add -L
  # ssh-add ~/.ssh/id_rsa
  # ssh-add -L
  #

  config.ssh.private_key_path = ['~/.vagrant.d/insecure_private_key', '~/.ssh/id_rsa']
  config.ssh.forward_agent = true

  config.vm.synced_folder "~/.m2", "/home/vagrant/.m2"

  config.vm.provision :shell, path: 'upgrade-puppet.sh'

  # Install puppet modules
  config.vm.provision :shell, path: 'bootstrap.rb', args: %w(
    puppetlabs-stdlib
    puppetlabs/apt
    puppetlabs/vcsrepo
    maestrodev/rvm
    deric/zookeeper
  )

  config.vm.provision :puppet do |puppet|
    puppet.options = ENV['PUPPET_OPTIONS']
  end
end
