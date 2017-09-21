class nginx::params {
  if $facts['os']['family'] == 'RedHat' {
    $root = "/var/www_redhat"
  } else {
    $root = "/var/www_others"
  }
}
