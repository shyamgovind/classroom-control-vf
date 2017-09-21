user { "audit_user" :
  ensure => present,
  }
include epel
include ::redis
