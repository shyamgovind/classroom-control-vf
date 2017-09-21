






define managed_user {

user { $title: 
  ensure => present,
}

file { "/home/${title}":
  ensure => directory,
}




}









define users::managed_user (
  $group = $title,
  )
{ user { $title:
  ensure => present,
}
{ file { "/home/${title}":
  ensure => directory,
  owner => $title,
}
