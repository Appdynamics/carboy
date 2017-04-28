# apt-cacher-ng

* SCM repo: https://alioth.debian.org/scm/?group_id=100566
  * Browse...
    * "tags"
      * click "commit" for a release tag
        * Copy link "snapshot" for the commits tree, (gets a .tar.gz archive)
* `brew create 'https://alioth.debian.org/plugins/scmgit/cgi-bin/gitweb.cgi?p=apt-cacher-ng/apt-cacher-ng.git;a=snapshot;h=a59728c2239758a7d7986e8eadf2f65fea2bf029;sf=tgz' --cmake --tap mprzybylski/carboy`

## Current hangup:

## TODO: 
* Make data directory locations in config file configurable with CMake
  * X add HOMEBREW_PREFIX to cmake_std_args
    * This is damn handy... http://www.rubydoc.info/github/Homebrew/brew/Formula%3Astd_cmake_args
  * X Patch CMakeLists.txt to populate DATA_PREFIX variable with HOMEBREW_PREFIX or CMAKE_INSTALL_PREFIX
  * X Make sure VARDIR is also used for installing data directories
  * X Add expansion for VARDIR in the config file
* logrotate dependency, config with cmake, and correct installation directory
  * on Linux logrotate runs from cron as root
  * In OS X, it runs from `launchctl` in a cron-like way
  * `brew service` wraps `launchctl`
    * ~~prefix with `sudo` to stick services in /Library/LaunchDaemons~~ (not the brew way)
* ~~Pre or post-install script for creating unprivileged `_acng` user, setting permissions?~~
  (no. Brew packages try not to require sudo.)
* Create Mac OS `.plist` files for automatic start/stop
  * Do it in the brew formula: http://www.rubydoc.info/github/Homebrew/brew/Formula#plist-instance_method
  * `launchd` doesn't do service dependency ordering.  Implement dependency ordering in shell script instead, and call
    that from launchd
* ~~Exclude linux-specific artifacts like systemd files from OS X installs~~ (already handled with `if(SDINSTALL)`)
* ~~Default config listening on localhost only~~ (doesn't help VMs and containers)
* Add some MacOS-specific documentation
* Submit patches upstream

# fmemopen

## TODO:
* Update README.md with CMake recipe
