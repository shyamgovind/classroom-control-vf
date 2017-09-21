class web::web_nginx($source = 'puppet:///modules/web/index.html',
)
{

package { 'nginx' :
  ensure => present,
  
}

file { '/var/www' :
  ensure => directory,
  owner => 'root',
  group => 'root',
  mode  => '0775',
}

file { '/var/www/index.html':
  ensure => file,
  owner => 'root',
  group => 'root',
  mode  => '0664',
  source => $source,
}

file { '/etc/nginx/nginx.conf':
  ensure => file,
  owner => 'root',
  group => 'root',
  mode  => '0664',
  source => 'puppet:///modules/web/nginx.conf',
  require => Package['nginx'],
  notify   => Service['nginx'],
}

file { '/etc/nginx/conf.d':
  ensure => directory,
  owner => 'root',
  group => 'root',
  mode  => '0775',
}

file { '/etc/nginx/conf.d/default.conf':
  ensure => file,
  owner => 'root',
  group => 'root',
  mode  => '0664',
  source => 'puppet:///modules/web/default.conf',
  require => Package['nginx'],
  notify   => Service['nginx'],
}

service {'nginx':
  ensure => running,
  enable => true,
}

}
