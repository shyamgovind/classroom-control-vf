class motd {

  $content = "This machine is called ${::fqdn} and is managed by Puppet"

  file { '/etc/motd':
    ensure => file,
    content => epp('puppet:///modules/motd/motd/warning.epp', { message => $content })
  }
}
