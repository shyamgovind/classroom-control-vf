class nginx 

# Package Installation
package { 'nginx':
 ensure => installed,
 }
 
 # Creating a WebPage and copying it to right location
 file{ '/var/www/' :
 ensure => directory,
 }
 
 
 file { '/var/www/index.html' :
 ensure => file,
 source => 'puppet:///modules/nginx/index.html',
 }
 
 # Configure nginx
 file { '/etc/nginx/nginx.conf' :
 ensure => file,
 source => 'puppet:///modules/nginx/nginx.conf',
 require => Package['nginx'],
 }
 
 file {'/etc/nginx/conf.d/default.conf' :
 ensure => file,
 source => 'puppet:///modules/nginx/default.conf',
 require => Package['nginx'],
 }
 
 
 
 # Manage the service
 service { 'nginx' :
 ensure => running,
 enable => true,
 require => [File['/etc/nginx/conf.d/default.conf'], File['/etc/nginx/nginx.conf']],
 }
 
 }
 
