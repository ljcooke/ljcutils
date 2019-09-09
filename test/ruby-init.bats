#!/usr/bin/env bats

@test 'invoking ruby-init without arguments prints usage' {
  run bin/ruby-init
  [ "$status" -eq 1 ]
  [ "${lines[0]}" = "Usage: ruby-init RUBY_VERSION" ]
}
