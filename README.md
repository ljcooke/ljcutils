# ljcutils

Miscellaneous command-line tools.

| Script | Description | Dependencies |
|--------|-------------|--------------|
| [`curl-resolve`][curl-resolve] | Test a website before setting up DNS. | [curl][] |
| [`ruby-init`][ruby-init] | Create a new Ruby project with rbenv and Bundler. | [rbenv][] |

[curl-resolve]: bin/curl-resolve
[ruby-init]: bin/ruby-init

[curl]: https://curl.haxx.se/
[rbenv]: https://github.com/rbenv/rbenv

## Install

Clone this repo, and add the `bin` directory to your path. For example:

```sh
# Clone the repo
cd $HOME/src
git clone https://github.com/ljcooke/ljcutils.git

# Add the following line to your .bash_profile or similar
export PATH="$PATH:$HOME/src/ljcutils/bin"
```

The scripts are self-contained, so you may also copy individual scripts from
the `bin` directory. Make sure to set the executable bit, e.g.:

```sh
chmod +x bin/curl-resolve
```

## Development

This project uses [ShellCheck](https://www.shellcheck.net/) for static analysis
and [Bats](https://github.com/sstephenson/bats) for testing.

- On macOS, you can install these using [Homebrew](https://brew.sh/):

  ```sh
  brew install bats shellcheck
  ```

Once these are installed, run `make` to analyse and test the code.
