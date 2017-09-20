class nginx {
  package { "nginx" }
    ensure => installed
  }
  file  {"/var/www/" :
   ensure => directory,
   }
  
  file { "/var/www/index.html" "
    ensure => file,
    source => "puppet:///modules/nginx/index.html"
    }

}
