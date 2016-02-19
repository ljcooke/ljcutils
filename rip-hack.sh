#!/bin/bash
set -o errexit
set -o nounset
set -o xtrace

cdparanoia -B

drutil tray eject

mkdir -p flac mp3

for wav in *.wav ; do
    basename=${wav%.wav}
    flac --verify "$wav" -o "flac/${basename}.flac"
    lame -V0 "$wav" "mp3/${basename}.mp3"
    rm "$wav"
done

shasum -a 256 flac/*.flac mp3/*.mp3 | tee check.sha256
