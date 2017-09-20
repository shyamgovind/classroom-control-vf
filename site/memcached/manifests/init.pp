class memcached {

  package { 'memcached' :
    ensure => present,
  }

  file { '/etc/sysconfig/memcached': 
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => 'puppet:///modules/memcached/memcached',
    require => Package['memcached'],
  }

  service { 'memcached':
    ensure  => running,
    enable  => true,
    subscribe => File['/etc/sysconfig/memcached'],
  }
  
  include users
  notify { " Variable from users classs is ${::users::my_name}" :}
  notify { " The OS family for this node is ${facts['os']['family']}" :}



}
