class user_setup {

user { "fundamentals" :
  ensure => present,
}

$my_name = "Shyam from local scope. i.e. class user_setup."

notify { " Printing value for my_name from global manifest - ${::my_name}" : }

notify { " Printing value for my_name from local class - ${::user_setup::my_name} " : }


}
