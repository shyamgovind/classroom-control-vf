class motd {

  $content = "This machine is called ${::fqdn} and is managed by Puppet"

  file { '/etc/motd':
    ensure => file,
    content => epp('motd/warning.epp', { message => $content })
  }
}
