

define user_setup::manage_user 
{

user { $title :
ensure => present,
}

file { "/home/${title}" :
  ensure => directory,
  }
  
}
