class skeleton::bashrc {
file { '/etc/skel' :
  ensure => directory,
  owner  => root,
  }
  
  file {'/etc/skel/.bashrc' :
   ensure => file,
   source => 'puppet:///site/skeleton/bashrc.sample',
   }
   }
