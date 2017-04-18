# apt-cacher-ng

* SCM repo: https://alioth.debian.org/scm/?group_id=100566
  * Browse...
    * "tags"
      * click "commit" for a release tag
        * Copy link "snapshot" for the commits tree, (gets a .tar.gz archive)
* `brew create 'https://alioth.debian.org/plugins/scmgit/cgi-bin/gitweb.cgi?p=apt-cacher-ng/apt-cacher-ng.git;a=snapshot;h=a59728c2239758a7d7986e8eadf2f65fea2bf029;sf=tgz' --cmake --tap mprzybylski/carboy`

Current hangup:
```
[ 28%] Building CXX object source/CMakeFiles/acngstuff.dir/dlcon.cc.o
cd /tmp/apt-cacher-ng-20170417-7675-6ib7yf/apt-cacher-ng-a59728c/source && /usr/local/Homebrew/Library/Homebrew/shims/super/clang++   -I/tmp/apt-cacher-ng-20170417-7675-6ib7yf/apt-cacher-ng-a59728c -I/tmp/apt-cacher-ng-20170417-7675-6ib7yf/apt-cacher-ng-a59728c/include  -DNDEBUG   -D_FILE_OFFSET_BITS=64 -Wall -Wextra -Wno-unused-parameter -fvisibility=hidden -D_DARWIN_C_SOURCE -fvisibility-inlines-hidden   -o CMakeFiles/acngstuff.dir/dlcon.cc.o -c /tmp/apt-cacher-ng-20170417-7675-6ib7yf/apt-cacher-ng-a59728c/source/dlcon.cc
In file included from /tmp/apt-cacher-ng-20170417-7675-6ib7yf/apt-cacher-ng-a59728c/source/dlcon.cc:4:
/Library/Developer/CommandLineTools/usr/bin/../include/c++/v1/atomic:543:2: error: <atomic> is not implemented
#error <atomic> is not implemented
```

In /Users/mikep/Library/Logs/Homebrew/apt-cacher-ng/01.cmake:
```
-- Generating done
CMake Warning:
  Manually-specified variables were not used by the project:

     CMAKE_CXX_FLAGS
```
Similar complaint when trying to specify ACNG_CXX_FLAGS

TODO: Patch CMakeLists.txt
* Poke necessary C++ compiler flags in below line 121

