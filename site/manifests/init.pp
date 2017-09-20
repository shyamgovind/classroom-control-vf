package { "memcached": 
  ensure => installed,
  before => File['/etc/sysconfig/memcached'],
}

file { "/etc/sysconfig/memcached": 
  ensure => file,
  notify => Service['memcached'],
}

service { "memcached": 
  ensure => running,
  require => Package['memcached'],
}
