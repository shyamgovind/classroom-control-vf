class nginx (
$doc_root = ${::nginx::params::doc_root},
) inherits nginx::params 
{

# Package installation
package { "nginx" :
  ensure => installed,
  }

# Creating a web page and copying to right location.
file { $doc_root :
  ensure => directory,
  }
  
 file { "${doc_root}/index.html" :
  ensure => file,
  source => "puppet:///modules/nginx/index.html",
}

# Configure nginx

file { "/etc/nginx/nginx.conf" :
  ensure => file,
  source => "puppet:///modules/nginx/nginx.conf",
  require => Package['nginx'],
  }

file { "/etc/nginx/conf.d/default.conf" :
  ensure => file,
  source => "puppet:///modules/nginx/default.conf",
  require => Package['nginx'],
  }
  
# Manage the service 
service { "nginx" :
  ensure => running,
  enable => true,
  subscribe => [ File['/etc/nginx/nginx.conf'],File['/etc/nginx/conf.d/default.conf']],
  }


}
