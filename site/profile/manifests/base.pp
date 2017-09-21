class profile::base {
  $msg = hiera('message')
  notify {$message: }
}
