class memcached {

  $file_path = '/etc/sysconfig/memcached'
  
  package { 'memcached': 
    ensure => present,
  }

  file { $file_path :
    ensure => file,
    owner => 'root',
    group => 'root',
    mode => '0644',
    source => 'puppet:///modules/memcached/memcached',
    require => Package['memcached'],
  }
  
  service { 'memcached':
    ensure => running,
    subscribe => File[$file_path],
  }
  
  notify { "os family is ${facts['os']['family']}": }
}
