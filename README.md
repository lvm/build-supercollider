# Install supercollider and sc3-plugins

A _dead simple_ script that installs (build) dependencies, clones [Supercollider](https://github.com/supercollider/supercollider/) and [sc3-plugins](https://github.com/supercollider/sc3-plugins), builds it, and finally will install it.

## Current version:

Supercollider
> 3.10.3

sc3-plugins
> 3.10


## How to?

```bash
$ git clone https://github.com/willbasky/build-supercollider/
$ cd build-supercollider
$ /bin/bash deploy_sc.sh
```

That's all.
Keep in mind this script works on Debian-derivates distributions (such as Ubuntu, Mint, etc). Sorry Windows, OS X, and other GNU/linux distros.

See [README-deb.md](README-deb.md) for thoughts on making .deb packages.
