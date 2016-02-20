etern
=====

Archive tools.

Requirements
------------

  * cdparanoia

Tools
-----

### etern-rip

Back up music CDs. This tool performs the following chores in sequence:

 1. Rip the CD using cdparanoia, which provides "extra-robust" data
    verification.

 1. Eject the CD (currently only on OS X).

 1. Encode each track in both FLAC and MP3 formats.

 1. Save a SHA-256 checksum file to verify the data in future.

Example usage:

    cd 'Rick Astley - Whenever You Need Somebody'
    ripflac.sh
    ls flac/ mp3/
    shasum -c check.sha256

Etymology
---------

_Etern_ is a root word in Esperanto meaning 'eternal'.
