class profile::base {
  $message = hiera("message")
  notify { $message: }

#  notify { "Hello, my name is ${::hostname}": }
}
