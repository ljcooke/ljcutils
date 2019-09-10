[…]

### <code>$ <a href="bin/etern-cd">etern-cd</a></code>

Back up music CDs. Requires [cdparanoia][], [flac][], and [lame][].

This tool performs the following chores in sequence:

 1. Rip the CD using cdparanoia, which provides "extra-robust" data
    verification.

 1. Eject the CD (on macOS only).

 1. Encode each track in both FLAC and MP3 formats.

 1. Save a SHA-256 checksum file to verify the data in future.

Example usage:

```sh
cd 'Rick Astley - Whenever You Need Somebody'
etern-cd
ls flac/ mp3/
shasum -c check.sha256
```

Etymology: _etern_ is a root word in Esperanto meaning 'eternal'.

[cdparanoia]: https://www.xiph.org/paranoia/
[flac]: https://xiph.org/flac/
[lame]: https://lame.sourceforge.io/

[…]
