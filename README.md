# Usage
* Add this tap to your brew installation with `brew tap mprzybylski/carboy`
* `brew search` and `brew install` like you normally would.
* See the `brew(1)` man page for more details.

# Formulae

## apt-cacher-ng

* **Description:** A caching proxy. Specialized for package files from Linux distributors, primarily for Debian (and Debian based) distributions but not limited to those.
* **Project Page:** [https://www.unix-ag.uni-kl.de/~bloch/acng/](https://www.unix-ag.uni-kl.de/~bloch/acng/)

### Notes

* By default, `apt-cacher-ng` listens on every interface.  This is usually not the desired behavior.  Uncomment and edit the `BindAddress` property in `#{HOMEBREW_PREFIX}/etc/apt-cacher-ng/acng.conf` to limit `apt-cacher-ng` to specific interfaces, i.e.:

```
BindAddress: 192.168.56.1 localhost
```


## fmemopen
* **Description:** C wrapper around BSD funopen() to emulate Linux fmemopen()
* **Project Page:** https://github.com/mprzybylski/darwin-fmemopen