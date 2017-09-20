class web::web_nginx {

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
  source => 'puppet:///moudules/web/index.html',
}

file { '/etc/nginx/nginx.conf'
  ensure => file,
  owner => 'root',
  group => 'root',
  mode  => '0664',
  source => 'puppet:///moudules/web/nginx.conf',
  reequire => Package['web_nginx'],
  notify   => Service['web_nginx'],
}

file { '/etc/nginx/conf.d':
  ensure => directory,
  owner => 'root',
  group => 'root',
  mode  => '0775',
}

file { '/etc/nginx/conf.d/default.conf'
  ensure => file,
  owner => 'root',
  group => 'root',
  mode  => '0664',
  source => 'puppet:///moudules/web/default.conf',
  reequire => Package['web_nginx'],
  notify   => Service['web_nginx'],
}

service {'nginx':
  ensure => running,
  enable => true,
}

