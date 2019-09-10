export LJC_TMP="${BATS_TEST_DIRNAME}/tmp"
export LJC_BIN="${BATS_TEST_DIRNAME}/../bin"

export PATH="${LJC_BIN}:${PATH}"

setup_dir() {
  mkdir -p "$LJC_TMP"
  cd "$LJC_TMP"
}

bundle() { echo called bundle "$@"; }
curl()   { echo called curl   "$@"; }
gem()    { echo called gem    "$@"; }
rbenv()  { echo called rbenv  "$@"; }

export -f bundle
export -f curl
export -f gem
export -f rbenv
