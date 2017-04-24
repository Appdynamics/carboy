# Documentation: http://docs.brew.sh/Formula-Cookbook.html
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Libfmemopen < Formula
  desc "C wrapper around BSD funopen() to emulate Linux fmemopen()"
  homepage "https://github.com/mprzybylski/darwin-fmemopen"
  url "https://github.com/mprzybylski/darwin-fmemopen/archive/0.2.tar.gz"
  sha256 "16075dbce4a2484ae2c811f270705e68f029fac7d97e4093cdb4080c2417d46b"
  version "0.2"
  version_scheme 0
  revision 0

  head "https://github.com/mprzybylski/darwin-fmemopen.git", :branch => "develop"

  depends_on "cmake" => :build

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel

    system "cmake", ".", *std_cmake_args
    system "make", "install" # if this fails, try separate make/make install steps
  end

  # TODO: add test program... eventually...
  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test libfmemopen`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
