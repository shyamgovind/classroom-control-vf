user { "audit_user" :
   ensure => present,
   }
   

notify { " HIERA MESSAGE: ${hiera('message')}" :}
