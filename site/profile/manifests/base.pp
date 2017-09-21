class profile::base {
  notify { "Hello, my name is NOT ${::hostname}": }
}
