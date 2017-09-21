class nginx::params {

if $facts['os']['family'] == 'RedHat'
{
  $doc_root = "/var/www_redhat"
}
else 
{
  $doc_root = "/var/www_others"
}

}
