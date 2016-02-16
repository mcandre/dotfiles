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

apt::ppa { [
  'ppa:cassou/emacs',
  'ppa:hrzhu/smlnj-backport',
  'ppa:wnoronha/thrift',
  'ppa:bjourne/factor'
  ]:
  before => Exec['apt-update']
}

package { [
  'ack-grep',
  'ant',
  'apache2',
  'aspell',
  'build-essential',
  'checkstyle',
  'chicken-bin',
  'clang',
  'clisp',
  'cppcheck',
  'curl',
  'emacs24',
  'erlang',
  'factor',
  'gawk',
  'gdc',
  'gfortran',
  'ghostscript',
  'git-core',
  'gnu-smalltalk',
  'gnustep',
  'gnustep-make',
  'gnustep-devel',
  'golang',
  'graphviz',
  'haskell-platform',
  'hlint',
  'imagemagick',
  'leiningen',
  'libapache2-mod-php5',
  'libecpg-dev',
  'libgc-dev',
  'libperl-dev',
  'libsqlite3-dev',
  'libxml2-utils',
  'llvm',
  'lua5.1',
  'maven',
  'mysql-client',
  'mysql-server',
  'nasm',
  'ocaml',
  'octave3.2',
  'openjdk-7-jdk',
  'perl-doc',
  'php5',
  'r-base',
  'redis-server',
  'scala',
  'sed',
  'sloccount',
  'smlnj',
  'splint',
  'sqlite3',
  'strace',
  'tcl',
  'texlive',
  'thrift-compiler',
  'tidy',
  'tree',
  'vagrant',
  'valgrind',
  'vim',
  'virtualbox',
  'yasm',
  'zsh'
  ]:
  ensure  => present,
  require => Exec['apt-update']
}

class { 'mongodb': }

#
# Libraries
#

exec { 'chicken cluckcheck':
  command => 'chicken-install cluckcheck',
  path    => '/bin:/usr/bin',
  require => [
    Package['build-essential'],
    Package['chicken-bin']
  ],
  onlyif  => '/usr/bin/test ! -f /var/lib/chicken/6/cluckcheck.o'
}

exec { 'cabal update':
  command     => 'cabal update',
  environment => 'HOME=/root',
  path        => '/bin:/usr/bin',
  require     => [
    Package['build-essential'],
    Package['haskell-platform']
  ]
}

file { ['/root', '/root/.cabal']:
  ensure  => directory,
  mode    => '0644',
}

file { '/root/.cabal/bin':
  ensure  => directory,
  mode    => '0655',
  recurse => true
}

exec { 'cabal graphviz':
  command     => 'cabal install graphviz',
  path        => '/bin:/usr/bin',
  environment => 'HOME=/root',
  timeout     => 0,
  require     => Exec['cabal update'],
  onlyif      => '/usr/bin/test ! -d \
    /root/.cabal/packages/hackage.haskell.org/graphviz'
}

exec { 'cabal shellcheck':
  command     => 'cabal install shellcheck',
  path        => '/bin:/usr/bin',
  environment => 'HOME=/root',
  timeout     => 0,
  require     => Exec['cabal update'],
  onlyif      => '/usr/bin/test ! -d \
    /root/.cabal/packages/hackage.haskell.org/ShellCheck'
}

class { 'python':
  version    => 'system',
  virtualenv => true,
  pip        => true
}

python::pip { 'invoke':
  ensure  => present,
  pkgname => 'invoke',
  owner   => 'root'
}

python::pip { 'pep8':
  ensure  => present,
  pkgname => 'pep8',
  owner   => 'root'
}

python::pip { 'pyflakes':
  ensure  => present,
  pkgname => 'pyflakes',
  owner   => 'root'
}

python::pip { 'pylint':
  ensure  => present,
  pkgname => 'pylint',
  owner   => 'root'
}

python::pip { 'pgsanity':
  ensure  => present,
  pkgname => 'pgsanity',
  owner   => 'root',
  require => Package['libecpg-dev']
}

class { 'perl':
  require => [
    Package['build-essential'],
    Package['libperl-dev']
  ]
}

perl::module { [
  'App::pmuninstall',
  'Test::More',
  'PAR::Packer',
  'Perl::Critic',
  'WWW::Mechanize',
  'YAML'
  ]:
}

class { 'nodejs':
  version => 'stable'
}

package { [
  'bower',
  'coffee-script',
  'coffeelint',
  'csslint',
  'grunt-cli',
  'jshint',
  'less',
  'mocha',
  'sass',
  'stylus',
  ]:
  provider => 'npm',
  require  => Class['nodejs']
}

class { 'rvm':
  version => '1.25.17'
}

rvm::system_user { 'vagrant': ; }

rvm_system_ruby {
  'ruby-2.1.0':
    ensure      => present,
    default_use => false;
}

rvm_gem { [
  'aspelllint',
  'bundler',
  'cane',
  'churn',
  'cucumber',
  'excellent',
  'flay',
  'flog',
  'guard',
  'puppet-lint',
  'rake',
  'reek',
  'roodi',
  'rubocop',
  'rspec',
  'sasslint',
  'shlint',
  'specs',
  'tailor',
  ]:
    ensure       => present,
    ruby_version => 'ruby-2.1.0',
    require      => [
      Rvm_system_ruby['ruby-2.1.0'],
      Package['aspell'],
      Package['sed']
    ];
}

file { '/home/vagrant/.clisprc.lisp':
  ensure  => link,
  target  => '/home/vagrant/src/dotfiles/.clisprc.lisp',
  owner   => 'vagrant',
  group   => 'vagrant',
  require => Vcsrepo['/home/vagrant/src/dotfiles']
}

exec { '/home/vagrant/quicklisp.lisp':
  command => 'wget http://beta.quicklisp.org/quicklisp.lisp',
  path    => '/usr/bin',
  user    => 'vagrant',
  cwd     => '/home/vagrant',
  onlyif  => '/usr/bin/test ! -f /home/vagrant/quicklisp.lisp'
}

file { '/home/vagrant/install-quicklisp.lisp':
  ensure => link,
  target => '/vagrant/install-quicklisp.lisp',
  owner  => 'vagrant',
  group  => 'vagrant'
}

exec { 'clisp quicklisp':
  command     => 'clisp install-quicklisp.lisp',
  path        => '/usr/bin',
  user        => 'vagrant',
  cwd         => '/home/vagrant',
  environment => 'HOME=/home/vagrant',
  require     => [
    Package['clisp'],
    File['/home/vagrant/.clisprc.lisp'],
    File['/home/vagrant/install-quicklisp.lisp'],
    Exec['/home/vagrant/quicklisp.lisp']
  ],
  onlyif      => '/usr/bin/test ! -d /home/vagrant/quicklisp'
}

exec { 'cl-quickcheck':
  command     => 'clisp -x "(ql:quickload \'cl-quickcheck)"',
  path        => '/usr/bin',
  user        => 'vagrant',
  environment => 'HOME=/home/vagrant',
  require     => Exec['clisp quicklisp'],
  onlyif      => '/usr/bin/test ! -d \
    /home/vagrant/quicklisp/dists/quicklisp/software/cl-quickcheck-*-git'
}

#
# User settings
#

file { '/home/vagrant/src':
  ensure => directory,
  owner  => 'vagrant',
  group  => 'vagrant'
}

vcsrepo { '/home/vagrant/src/dotfiles':
  ensure   => latest,
  provider => git,
  source   => 'https://github.com/mcandre/dotfiles',
  owner    => 'vagrant',
  group    => 'vagrant',
  require  => File['/home/vagrant/src']
}

file { '/home/vagrant/.vimrc':
  ensure  => link,
  target  => '/home/vagrant/src/dotfiles/.vimrc',
  owner   => 'vagrant',
  group   => 'vagrant',
  require => Vcsrepo['/home/vagrant/src/dotfiles']
}

file { '/home/vagrant/.vim/':
  ensure => directory,
  owner  => 'vagrant',
  group  => 'vagrant',
}

vcsrepo { '/home/vagrant/.vim/bundle/vundle':
  ensure   => present,
  provider => git,
  source   => 'https://github.com/gmarik/vundle',
  owner    => 'vagrant',
  group    => 'vagrant'
}

exec { 'vundle':
  command     => 'vim +BundleInstall +qall',
  path        => '/bin:/usr/bin',
  user        => 'vagrant',
  environment => 'HOME=/home/vagrant/',
  refreshonly => true,
  require     => [
    Package['vim'],
    Vcsrepo['/home/vagrant/.vim/bundle/vundle'],
    File['/home/vagrant/.vimrc']
  ],
  subscribe   => Vcsrepo['/home/vagrant/src/dotfiles']
}

file { '/home/vagrant/.emacs.d/':
  ensure => directory,
  owner  => 'vagrant',
  group  => 'vagrant'
}

vcsrepo { '/home/vagrant/.cask':
  ensure   => present,
  provider => git,
  source   => 'https://github.com/cask/cask',
  owner    => 'vagrant',
  group    => 'vagrant'
}

file { '/home/vagrant/.emacs.d/Cask':
  ensure  => link,
  target  => '/home/vagrant/src/dotfiles/Cask',
  owner   => 'vagrant',
  group   => 'vagrant',
  require => [
    File['/home/vagrant/.emacs.d/'],
    Vcsrepo['/home/vagrant/src/dotfiles']
  ]
}

file { '/home/vagrant/.emacs':
  ensure  => link,
  target  => '/home/vagrant/src/dotfiles/.emacs',
  owner   => 'vagrant',
  group   => 'vagrant',
  require => Vcsrepo['/home/vagrant/src/dotfiles']
}

exec { 'cask':
  command     => 'cask update && cask install',
  cwd         => '/home/vagrant/.emacs.d/',
  path        => '/bin:/usr/bin:/home/vagrant/.cask/bin',
  user        => 'vagrant',
  environment => 'HOME=/home/vagrant/',
  refreshonly => true,
  require     => [
    Package['emacs24'],
    Vcsrepo['/home/vagrant/.cask'],
    File['/home/vagrant/.emacs.d/Cask']
  ],
  subscribe   => Vcsrepo['/home/vagrant/src/dotfiles']
}

file { '/home/vagrant/.nanorc':
  ensure  => link,
  target  => '/home/vagrant/src/dotfiles/.nanorc',
  owner   => 'vagrant',
  group   => 'vagrant',
  require => Vcsrepo['/home/vagrant/src/dotfiles']
}

vcsrepo { '/home/vagrant/.nano':
  ensure   => present,
  provider => git,
  source   => 'https://github.com/serialhex/nano-highlight',
  owner    => 'vagrant',
  group    => 'vagrant'
}

file { '/home/vagrant/.ackrc':
  ensure  => link,
  target  => '/home/vagrant/dotfiles/.ackrc',
  owner   => 'vagrant',
  group   => 'vagrant',
  require => Vcsrepo['/home/vagrant/src/dotfiles']
}

file { '/home/vagrant/.bash_profile':
  ensure => link,
  target => '/vagrant/.bash_profile',
  owner  => 'vagrant',
  group  => 'vagrant'
}

file { '/home/vagrant/.zshrc':
  ensure => present,
  owner  => 'vagrant',
  group  => 'vagrant'
}
