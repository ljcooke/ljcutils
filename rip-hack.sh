#!/bin/bash
set -o errexit
set -o nounset
set -o xtrace

cdparanoia -B

mkdir -p flac mp3

for wav in *.wav ; do
    basename=${wav%.wav}
    flac --verify "$wav" -o "flac/${basename}.flac"
    lame -V0 "$wav" "mp3/${basename}.mp3"
    rm "$wav"
done
