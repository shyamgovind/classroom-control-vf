class nginx (
  $root = "${::nginx::params::root}",
) inherits nginx::params {

#  $sourcedir = 'puppet:///modules/nginx'
  File {
    owner => 'root',
    group => 'root',
    mode => '0664',
  }

  package { 'nginx':
    ensure => present,
  }
  
  file { $root:
    ensure => directory,
    mode => '0775',
  }

  file { "${root}/index.html":
    ensure => file,
    source => 'puppet:///modules/nginx/index.html',
  }

  file { '/etc/nginx':
    ensure => directory,
    mode => '0775',
  }
  
  file { '/etc/nginx/nginx.conf':
    ensure => file,
    source => 'puppet:///modules/nginx/nginx.conf',
    require => Package['nginx'],
    notify => Service['nginx'],
  }

  file { '/etc/nginx/conf.d':
    ensure => directory,
    mode => '0775',
  }

  file { '/etc/nginx/conf.d/default.conf':
    ensure => file,
    source => 'puppet:///modules/nginx/default.conf',
    require => Package['nginx'],
    notify => Service['nginx'],
  }
  
  service { 'nginx':
    ensure => running,
    enable => true,
    subscribe => [ File['/etc/nginx/nginx.conf'], File['/etc/nginx/conf.d/default.conf']],
  }
}
