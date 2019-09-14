#!/usr/bin/env bats

load test_helper

setup() {
  setup_dir
}

@test 'curl-resolve without arguments prints usage and fails' {
  run curl-resolve
  [ "$status" -eq 1 ]
  [ "${lines[0]}" = "Usage: curl-resolve [OPTIONS...] IP_ADDRESS DOMAIN [URL]" ]
}

@test 'curl-resolve with incomplete arguments prints usage and fails' {
  run curl-resolve 1.2.3.4
  [ "$status" -eq 1 ]
  [ "${lines[0]}" = "Usage: curl-resolve [OPTIONS...] IP_ADDRESS DOMAIN [URL]" ]
}

@test 'curl-resolve with -h prints usage' {
  run curl-resolve -h
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "Usage: curl-resolve [OPTIONS...] IP_ADDRESS DOMAIN [URL]" ]
}

@test 'curl-resolve with a URL argument calls curl' {
  r80='--resolve example.com:80:1.2.3.4'
  r443='--resolve example.com:443:1.2.3.4'
  url='http://example.org'

  run curl-resolve 1.2.3.4 example.com http://example.org
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "called curl $r80 $r443 --verbose $url" ]
}

@test 'curl-resolve without a URL argument builds a URL from the domain' {
  r80='--resolve example.com:80:1.2.3.4'
  r443='--resolve example.com:443:1.2.3.4'
  url='http://example.com'

  run curl-resolve 1.2.3.4 example.com
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "called curl $r80 $r443 --verbose $url" ]
}
