user { "audit_user" :
  ensure => present,
  }
include epel
include registry
include redis
