class nginx {
$doc_root = "/var/www"/

  package { "nginx":
    ensure => present,
  }
  
  file { "$doc_root":
    ensure => directory,
  }
  
  file { "${doc_root}/index.html":
    ensure => file,
    source => "puppet:///modules/nginx/index.html",
  }
  
  file { "/etc/nginx/nginx.conf":
    ensure => file,
    source => "puppet:///modules/nginx/nginx.conf",
    require => Package['nginx'],
  }

  file { "/etc/nginx/conf.d":
    ensure => directory,
  }

  file { "/etc/nginx/conf.d/default.conf":
    ensure => file,
    source => "puppet:///modules/nginx/default.conf",
    require => Package['nginx'],
  }
  
  service { "nginx":
    ensure => running,
    enable => true,
    subscribe => [File['/etc/nginx/nginx.conf'],File['/etc/nginx/conf.d/default.conf']],
  }
}
