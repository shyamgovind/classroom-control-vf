class skeleton::bashrc {

file { "/etc/skel/" :
 ensure => directory,
 }
 
file { "/etc/skel/.bashrc" :
  ensure => file,
  source => "puppet:///site/skeleton/bashrc.sample",
}


}
