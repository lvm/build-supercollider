# build-supercollider

A _dead simple_ script that installs (build) dependencies, clones [Supercollider](https://github.com/supercollider/supercollider/), builds it, and finally will install it.

## Current version:

> 3.8.0


## How to?

```bash
$ git clone https://github.com/lvm/build-supercollider/
$ cd build-supercollider
$ sh build-supercollider.sh
$ sh build-sc3-plugins.sh
```

That's all.  
Keep in mind this script works on Debian-derivates distributions (such as Ubuntu, Mint, etc). Sorry Windows, OS X, and other GNU/linux distros.

## Known issues

If for some reason SC doesn't compile and throws an error about `libyaml.a`, check [this issue](https://github.com/supercollider/supercollider/issues/2825) and try again.
