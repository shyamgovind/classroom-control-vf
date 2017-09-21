class profile::base {
  notify { "Hello, my name is NOT ${::hostname}" or is it: }
  # $message = hiera('message')
  # notify { $message: }
}

#another line
