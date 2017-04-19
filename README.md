# apt-cacher-ng

* SCM repo: https://alioth.debian.org/scm/?group_id=100566
  * Browse...
    * "tags"
      * click "commit" for a release tag
        * Copy link "snapshot" for the commits tree, (gets a .tar.gz archive)
* `brew create 'https://alioth.debian.org/plugins/scmgit/cgi-bin/gitweb.cgi?p=apt-cacher-ng/apt-cacher-ng.git;a=snapshot;h=a59728c2239758a7d7986e8eadf2f65fea2bf029;sf=tgz' --cmake --tap mprzybylski/carboy`

# Current hangup:
```
[ 54%] Building CXX object source/CMakeFiles/acngstuff.dir/filereader.cc.o
cd /tmp/apt-cacher-ng-20170419-35804-1oxac2d/apt-cacher-ng-a59728c/source && /usr/local/Homebrew/Library/Homebrew/shims/super/clang++   -I/tmp/apt-cacher-ng-20170419-35804-1oxac2d/apt-cacher-ng-a59728c -I/tmp/apt-cacher-ng-20170419-35804-1oxac2d/apt-cacher-ng-a59728c/include  -DNDEBUG   -D_FILE_OFFSET_BITS=64 -Wall -Wextra -Wno-unused-parameter -fvisibility=hidden -D_DARWIN_C_SOURCE -I/usr/local/Cellar/openssl/1.0.2k/include -fvisibility-inlines-hidden -std=c++11 -stdlib=libc++   -o CMakeFiles/acngstuff.dir/filereader.cc.o -c /tmp/apt-cacher-ng-20170419-35804-1oxac2d/apt-cacher-ng-a59728c/source/filereader.cc
/tmp/apt-cacher-ng-20170419-35804-1oxac2d/apt-cacher-ng-a59728c/source/meta.cc:726:22: error: no member named 'fmemopen' in the global namespace
   FILE* memStrm = ::fmemopen( (void*) pAscii, len, "r");
                   ~~^
1 error generated.
make[2]: *** [fs/CMakeFiles/acngfs.dir/__/source/meta.cc.o] Error 1
make[2]: *** Waiting for unfinished jobs....
[ 56%] Building CXX object source/CMakeFiles/acngstuff.dir/header.cc.o
cd /tmp/apt-cacher-ng-20170419-35804-1oxac2d/apt-cacher-ng-a59728c/source && /usr/local/Homebrew/Library/Homebrew/shims/super/clang++   -I/tmp/apt-cacher-ng-20170419-35804-1oxac2d/apt-cacher-ng-a59728c -I/tmp/apt-cacher-ng-20170419-35804-1oxac2d/apt-cacher-ng-a59728c/include  -DNDEBUG   -D_FILE_OFFSET_BITS=64 -Wall -Wextra -Wno-unused-parameter -fvisibility=hidden -D_DARWIN_C_SOURCE -I/usr/local/Cellar/openssl/1.0.2k/include -fvisibility-inlines-hidden -std=c++11 -stdlib=libc++   -o CMakeFiles/acngstuff.dir/header.cc.o -c /tmp/apt-cacher-ng-20170419-35804-1oxac2d/apt-cacher-ng-a59728c/source/header.cc
[ 58%] Building CXX object source/CMakeFiles/acngstuff.dir/meta.cc.o
cd /tmp/apt-cacher-ng-20170419-35804-1oxac2d/apt-cacher-ng-a59728c/source && /usr/local/Homebrew/Library/Homebrew/shims/super/clang++   -I/tmp/apt-cacher-ng-20170419-35804-1oxac2d/apt-cacher-ng-a59728c -I/tmp/apt-cacher-ng-20170419-35804-1oxac2d/apt-cacher-ng-a59728c/include  -DNDEBUG   -D_FILE_OFFSET_BITS=64 -Wall -Wextra -Wno-unused-parameter -fvisibility=hidden -D_DARWIN_C_SOURCE -I/usr/local/Cellar/openssl/1.0.2k/include -fvisibility-inlines-hidden -std=c++11 -stdlib=libc++   -o CMakeFiles/acngstuff.dir/meta.cc.o -c /tmp/apt-cacher-ng-20170419-35804-1oxac2d/apt-cacher-ng-a59728c/source/meta.cc
/tmp/apt-cacher-ng-20170419-35804-1oxac2d/apt-cacher-ng-a59728c/source/fileitem.cc:994:56: error: no member named 'st_mtim' in 'acng::Cstat'
        auto sideFileAbs = tgtDir + ltos(st.st_ino) + ltos(st.st_mtim.tv_sec) + ltos(st.st_mtim.tv_nsec);
                                                           ~~ ^
/tmp/apt-cacher-ng-20170419-35804-1oxac2d/apt-cacher-ng-a59728c/source/fileitem.cc:994:82: error: no member named 'st_mtim' in 'acng::Cstat'
        auto sideFileAbs = tgtDir + ltos(st.st_ino) + ltos(st.st_mtim.tv_sec) + ltos(st.st_mtim.tv_nsec);
                                                                                     ~~ ^
2 errors generated.
make[2]: *** [source/CMakeFiles/acngstuff.dir/fileitem.cc.o] Error 1
make[2]: *** Waiting for unfinished jobs....
/tmp/apt-cacher-ng-20170419-35804-1oxac2d/apt-cacher-ng-a59728c/source/meta.cc:726:22: error: no member named 'fmemopen' in the global namespace
   FILE* memStrm = ::fmemopen( (void*) pAscii, len, "r");
```
Looks like this might be related: https://github.com/tavianator/bfs/issues/12

# TODO: 

