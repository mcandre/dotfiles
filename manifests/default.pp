#
# Keep apt db uncorrupt: No timeout.
#

class { 'apt': update_timeout => 60 }

exec { 'apt-update':
  command => 'apt-get update',
  path    => '/bin:/usr/bin',
  timeout => 0
}

#
# Developer tools
#

apt::ppa { 'ppa:wnoronha/thrift':
  before => Exec['apt-update']
}

package { [
  'build-essential',
  'curl',
  'git-core',
  'maven',
  'openjdk-6-jdk',
  'thrift-compiler',
  'tree'
  ]:
  ensure  => present,
  require => Exec['apt-update']
}

class { 'rvm':
  version => '1.25.17',
  require => Package['curl']
}

rvm::system_user { 'vagrant': ; }

rvm_system_ruby {
  'ruby-2.1.0':
    ensure      => present,
    default_use => false;
}

rvm_gem { [
  'bundler',
  'cucumber',
  'rspec',
   ]:
    ensure       => present,
    ruby_version => 'ruby-2.1.0',
    require      => Rvm_system_ruby['ruby-2.1.0'];
}

#
# Install and start Zookeeper server with init.d
#
# Confirm with sudo /usr/share/zookeeper/bin/zkCli.sh
#

class { 'zookeeper': }

#
# User settings
#

file { '/home/vagrant/Desktop':
  ensure => directory,
  owner  => 'vagrant',
  group  => 'vagrant'
}

file { '/home/vagrant/Desktop/src':
  ensure  => directory,
  owner   => 'vagrant',
  group   => 'vagrant',
  require => File['/home/vagrant/Desktop']
}

exec { 'ssh know gitlab':
  command => 'ssh -Tv git@git.lab76.org -o StrictHostKeyChecking=no; echo Success',
  path    => '/bin:/usr/bin',
  user    => 'vagrant'
}

exec { 'ssh know github':
  command => 'ssh -Tv git@github.com -o StrictHostKeyChecking=no; echo Success',
  path    => '/bin:/usr/bin',
  user    => 'vagrant'
}

vcsrepo { '/home/vagrant/Desktop/src/datasets-parent':
  ensure   => latest,
  provider => git,
  source   => 'git@git.lab76.org:ezbake/datasets-parent.git',
  revision => 'datasets-parent-1.3',
  user     => 'vagrant',
  owner    => 'vagrant',
  group    => 'vagrant',
  require  => [
    Exec['ssh know gitlab'],
    Exec['ssh know github']
  ]
}

vcsrepo { '/home/vagrant/Desktop/src/ezbake-common-services-parent':
  ensure   => latest,
  provider => git,
  source   => 'git@git.lab76.org:apennebaker/ezbake-common-services-parent.git',
  revision => '1.3-fixes',
  user     => 'vagrant',
  owner    => 'vagrant',
  group    => 'vagrant',
  require  => [
    Exec['ssh know gitlab'],
    Exec['ssh know github']
  ]
}

file { '/ezbake-common-services-parent':
  ensure  => link,
  target  => '/home/vagrant/Desktop/src/ezbake-common-services-parent',
  owner   => 'vagrant',
  group   => 'vagrant',
  require => Vcsrepo['/home/vagrant/Desktop/src/ezbake-common-services-parent']
}

exec { 'mvn install geosvc':
  command => 'mvn install',
  path    => '/bin:/usr/bin',
  cwd     => '/ezbake-common-services-parent/geospatial-extraction-service',
  user    => 'vagrant',
  refreshonly => true,
  subscribe   => [
    Vcsrepo['/home/vagrant/Desktop/src/ezbake-common-services-parent']
  ],
  require => [
    File['/ezbake-common-services-parent'],
    Vcsrepo['/home/vagrant/Desktop/src/datasets-parent'],
    Package['maven'],
    Package['openjdk-6-jdk'],
    Package['thrift-compiler']
  ]
}

exec { 'mvn package geospatial-cli':
  command => 'mvn package',
  path    => '/bin:/usr/bin',
  cwd     => '/vagrant',
  user    => 'vagrant',
  require => Exec['mvn install geosvc']
}

file { '/home/vagrant/.bash_profile':
  ensure => link,
  target => '/vagrant/.bash_profile',
  owner  => 'vagrant',
  group  => 'vagrant'
}
