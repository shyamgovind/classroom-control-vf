class web::web_nginx {

package { 'nginx' :
  ensure => 'installed',
  
}

file { '/var/www' :
  ensure => 'directory',
}

file { '/etc/nginx/nginx.conf'
  ensure => present,
  source => 'puppet:///moudules/web/nginx.conf',

}
