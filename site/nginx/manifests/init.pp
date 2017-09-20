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
 
 Confgiru
 service { 'nginx'
 
