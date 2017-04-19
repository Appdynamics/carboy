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

  patch do
    url "https://raw.githubusercontent.com/mprzybylski/carboy/develop/patches/apt-cacher-ng0.patch"
    sha256 "50a6763d557d82d1ed04a8643326c911f9976ef4cab45348ae44c59f52b451ff"
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
