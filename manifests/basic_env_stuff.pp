user { "audit_user" :
   ensure => present,
   }

$my_name = "Shyam from global scope"

#include nginx   # takes the default "/var/www" as the doc_root parameter.


class { "nginx" :
  doc_root => "/var/website/",
  }


