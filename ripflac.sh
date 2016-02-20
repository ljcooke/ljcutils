#!/bin/bash
set -o errexit
set -o nounset
set -o xtrace

# Rip the CD to .wav
cdparanoia -B

# Eject the CD (OS X)
if which -s drutil ; then
    drutil tray eject &
fi

# Encode the files to flac and mp3, and delete the wavs
mkdir -p flac mp3
for wav in *.wav ; do
    basename=${wav%.wav}
    flac --verify "$wav" -o "flac/${basename}.flac"
    lame -V0 "$wav" "mp3/${basename}.mp3"
    rm "$wav"
done

# Save a checksum file (check with "shasum -c check.sha256")
shasum -a 256 flac/*.flac mp3/*.mp3 | tee check.sha256
