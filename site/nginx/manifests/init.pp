class nginx {

# Package installation
package { "nginx" :
  ensure => installed,
  }

# Creating a web page and copying to right location.
file { "/var/www/" :
  ensure => directory,
  }
  
 file { "/var/www/index.html" :
  ensure => file,
  source => "puppet:///modules/nginx/index.html",
}

# Configure nginx





}
