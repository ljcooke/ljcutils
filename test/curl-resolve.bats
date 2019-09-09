#!/usr/bin/env bats

@test 'invoking curl-resolve without arguments prints usage' {
  run bin/curl-resolve
  [ "$status" -eq 1 ]
  [ "${lines[0]}" = "Usage: curl-resolve IP_ADDRESS DOMAIN [URL]" ]
}
