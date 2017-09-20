
class users {
  user { 'fundamentals':
    ensure => present,
  }
  
  $my_name= "Kevin from local scope. i.e. clase users."
  
  notify { " Printing value from my_name from global manifest - ${::my_name}" :}
  notify { " Printing value from my_name from local class - ${user::my_name}" :}
}
