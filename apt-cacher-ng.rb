# Documentation: http://docs.brew.sh/Formula-Cookbook.html
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class AptCacherNg < Formula
  desc "A caching proxy. Specialized for package files from Linux distributors, primarily for Debian" +
         " (and Debian based) distributions but not limited to those."
  homepage "https://www.unix-ag.uni-kl.de/~bloch/acng/"
  url "https://alioth.debian.org/plugins/scmgit/cgi-bin/gitweb.cgi?p=apt-cacher-ng/apt-cacher-ng.git;a=snapshot;h=a59728c2239758a7d7986e8eadf2f65fea2bf029;sf=tgz"
  sha256 "9dffe361d5b82608dc1b4e8c8f8432216d0bd7732b0eeea77dbfcba2cc47f587"
  version "3-4"
  version_scheme 0
  revision 0

  #TODO: add HEAD pointer

  depends_on "pkg-config" => :build # so that cmake can find all of its dependencies
  depends_on "cmake" => :build
  depends_on "openssl" => :build
  depends_on :osxfuse => :build
  depends_on "xz" => :build
  depends_on "libfmemopen" => :build

  patch do
    # Patch CMakeLists.txt to include -std=c++11 in its clang++ flags
    url "https://raw.githubusercontent.com/mprzybylski/carboy/develop/patches/apt-cacher-ng_osx-cxxflags.patch"
    sha256 "ff6fc8b3d844b095aafcfcd47bbfc948e2f405ad13e0add602534fcc27a442db"
  end

  patch do
    # OS X names its atime, mtime, and ctime fields differently from Linux.
    # fixes issue similar to https://github.com/tavianator/bfs/issues/12
    # patterned after https://github.com/tavianator/bfs/pull/13/files#diff-8b2aa0a4ac567369abb850524cda081c
    url "https://raw.githubusercontent.com/mprzybylski/carboy/develop/patches/apt-cacher-ng_osx-timespec-aliases.patch"
    sha256 "b7706efb8b8fc0884608b307cab92980c0d246d074a9b06c80cf68d8cfd81bfc"
  end

  patch do
    # apt-cacher-ng relies on the Linux-only system call fmemopen()
    # patch an emulation wrapper for fmemopen() into the build.
    url "https://raw.githubusercontent.com/mprzybylski/carboy/develop/patches/apt-cacher-ng_include-fmemopen.patch"
    sha256 "d9776014424a5737bfc35a79ef7f7056685f25607746b29525bb9ff8b0d88266"
  end

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel

    system "cmake", ".", *std_cmake_args
    system "make", "install" # if this fails, try separate make/make install steps
  end

  test do
    # `test do` will create, run in and delete a temporary directory
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test apt`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
