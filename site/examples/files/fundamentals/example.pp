file { '/etc/motd':
  ensure  => file,
  owner   => 'root',
  group   => 'root',
  mode    => '0644',
  content => "Hey, Puppet is fun!\n",
}


file { '/etc/poo':
  ensure  => file,
  owner   => 'root',
  group   => 'root',
  mode    => '0644',
  content => "Puppet go poo!\n",
}

package { 'cowsay':
  ensure   => present,
  provider => gem,
}
