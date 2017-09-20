class poo {

  file { '/etc/popooo':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => "Puppet go poo poo!\n",
  }

}
