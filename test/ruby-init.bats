#!/usr/bin/env bats

load test_helper

setup() {
  setup_dir
}

teardown() {
  rm -f Gemfile
}

@test 'ruby-init without arguments prints usage and fails' {
  run ruby-init
  [ "$status" -eq 1 ]
  [ "${lines[0]}" = "Usage: ruby-init [OPTIONS...] RUBY_VERSION" ]
}

@test 'ruby-init with -h prints usage' {
  run ruby-init -h
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "Usage: ruby-init [OPTIONS...] RUBY_VERSION" ]
}

@test 'ruby-init when a Gemfile exists prints an error and fails' {
  touch Gemfile
  run ruby-init 1.2.3
  [ "$status" -eq 1 ]
  [ "${lines[0]}" = "Error: File exists: Gemfile" ]
}

@test 'ruby-init installs Ruby using rbenv' {
  run ruby-init 1.2.3
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "called rbenv install --skip-existing 1.2.3" ]
}

@test 'ruby-init creates .ruby-version' {
  run ruby-init 1.2.3
  [ "$status" -eq 0 ]
  [ "${lines[1]}" = "called rbenv local 1.2.3" ]
}

@test 'ruby-init installs Bundler' {
  run ruby-init 1.2.3
  [ "$status" -eq 0 ]
  [ "${lines[2]}" = "called gem install bundler" ]
}

@test 'ruby-init creates Gemfile' {
  run ruby-init 1.2.3
  [ "$status" -eq 0 ]
  [ -e Gemfile ]
}

@test 'ruby-init creates Gemfile.lock' {
  run ruby-init 1.2.3
  [ "$status" -eq 0 ]
  [ "${lines[3]}" = "called bundle install" ]
}
