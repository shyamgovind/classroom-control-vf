class skeleton {
  
  file { '/etc/skel':
    ensure => directory,
    ownser => 'root',
    group  => 'root',
    mode   => '0755',
  }

  file { '/etc/skel/.bashrc':
    ensure => file,
    ownser => 'root',
    group  => 'root',
    source => 'puppet:///modules/skeleton/bashrc',
  }
  
}
