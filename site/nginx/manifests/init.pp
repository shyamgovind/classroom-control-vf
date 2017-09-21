class nginx (
  $doc_root = '/var/www/'
)
{
  package { 'nginx':
    ensure => installed,
  }
  file  {$doc_root:
   ensure => directory,
   }
  
  file { ${doc_root}/index.html':
    ensure => file,
    source => 'puppet:///modules/nginx/index.html',
    }

#Configure NGINX

  file { '/etc/nginx/nginx.conf':
    ensure => file,  
    source => 'puppet:///modules/nginx/nginx.conf',
    require => Package['nginx'],
   }
   
  file { '/etc/nginx/conf.d/default.conf':
    ensure => file,
    source => 'puppet:///modules/nginx/default.conf',
    require => Package['nginx'],
    }

#Manage the service
service { 'nginx':
  ensure => running,
  enable => true,
  subscribe => [ File['/etc/nginx/nginx.conf'],File['/etc/nginx/conf.d/default.conf']],
  }

}
