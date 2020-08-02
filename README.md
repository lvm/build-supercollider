# build-supercollider

A _dead simple_ script that installs (build) dependencies, clones [Supercollider](https://github.com/supercollider/supercollider/), builds it, and finally will install it.

## Current version:

> 3.11


## How to?

```bash
$ git clone https://github.com/lvm/build-supercollider
$ cd build-supercollider
$ sh build-supercollider.sh
$ sh build-sc3-plugins.sh
```

That's all.  
Keep in mind this script works on Debian-derivates distributions (such as Ubuntu, Mint, etc). Sorry Windows, OS X, and other GNU/linux distros.

See [README-deb.md](README-deb.md) for thoughts on making .deb packages.

### Known issues

#### QT5 Not found

[@pselle](https://github.com/pselle) kindly reported a solution

> Future reader, if you got to this because you figured out that you were unable to locate packages and the installing dependencies step failed, and you followed the SuperCollider instructions on getting Qt on your machine ... to use the handy script in this repo, update this line:
> 
> ` -DCMAKE_PREFIX_PATH= \`
> 
> to your Qt path (for example:)
> ` -DCMAKE_PREFIX_PATH=/opt/qt511 \`
> 
> This assumes you edited so that you installed all the other prereqs (deleting the qtwebengine5-dev bit from the install section)
