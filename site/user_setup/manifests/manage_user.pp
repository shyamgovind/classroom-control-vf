

define user_setup::manage_user 
(
$title = "bob",  # bob is the default if no parameter value is passed.
){

user { $title :
ensure => present,
}

file { "/home/${title}" :
  ensure => directory,
  }
  
}
