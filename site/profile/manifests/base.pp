class profile::base {
  $message = hiera('message')
  if $message == '' {
    $message = "Hello, my name is ${::hostname}"
  }

  notify { $message: }
}
