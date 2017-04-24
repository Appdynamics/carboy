# apt-cacher-ng

* SCM repo: https://alioth.debian.org/scm/?group_id=100566
  * Browse...
    * "tags"
      * click "commit" for a release tag
        * Copy link "snapshot" for the commits tree, (gets a .tar.gz archive)
* `brew create 'https://alioth.debian.org/plugins/scmgit/cgi-bin/gitweb.cgi?p=apt-cacher-ng/apt-cacher-ng.git;a=snapshot;h=a59728c2239758a7d7986e8eadf2f65fea2bf029;sf=tgz' --cmake --tap mprzybylski/carboy`

## Current hangup:
```
_append() isn't doing the right thing in fs/CMakeLists.txt with fmemopen
```

## TODO: 


# fmemopen


