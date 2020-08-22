# ljcutils

A collection of small command-line tools.

## Tools

### <code>$ <a href="bin/curl-resolve">curl-resolve</a></code>

Make a HTTP request to your web server before setting up DNS.
Requires [curl][].

```sh
# Scenario: A web server is running at the address 12.34.56.78, and has been
# configured to serve the example.com domain. However, the DNS settings for
# this domain have not yet propagated.
#
# Make a request to this domain using the server's IP address:
curl-resolve 12.34.56.78 example.com http://example.com/test.html
```

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
chmod +x /path/to/curl-resolve
```

## Development

This project uses [ShellCheck][shellcheck] for static analysis
and [Bats][bats] for testing.

- On macOS, you can install these using [Homebrew][brew]:

  ```sh
  brew install bats shellcheck
  ```

Once these are installed, run `make` to analyse and test the code.

[bats]: https://github.com/sstephenson/bats
[brew]: https://brew.sh/
[curl]: https://curl.haxx.se/
[shellcheck]: https://www.shellcheck.net/
