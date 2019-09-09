# ljcutils

Miscellaneous command-line tools.

| Script | Description |
|--------|-------------|
| [`curl-resolve`](bin/curl-resolve) | Test a website before setting up DNS. |
| [`ruby-init`](bin/ruby-init) | Create a new Ruby project with rbenv and Bundler. |

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
