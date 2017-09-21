class user_setup::admins {
  user_setup::managed_user { 'joe': }
  user_setup::managed_user { 'alice':
    group => 'staff',
  }
  user_setup::managed_user { 'aaron':
    group => 'staff',
  }
  group { 'staff':
    ensure => present,
  }
}
