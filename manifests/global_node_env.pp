user { "audit_user" :
   ensure => present,
   }
   
include web::web_nginx("hello world")
