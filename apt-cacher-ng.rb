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
  revision 8

  depends_on "pkg-config" => :build # so that cmake can find all of its dependencies
  depends_on "cmake" => :build
  depends_on "openssl"
  depends_on "xz"
  depends_on "libfmemopen"
  depends_on :osxfuse => :optional
  depends_on "logrotate" => :run

  def caveats
    <<-EOS.undent
      Note: apt-cacher-ng only binds to localhost by default.  To bind to other
      interfaces, please specify their addresses in the 'BindAddress: ...' line
      of #{etc}/#{name}
    EOS
  end

  patch do
    # Rollup of all MacOS / Homebrew compile and install fixes
    url "https://raw.githubusercontent.com/Appdynamics/fermenter/develop/patches/apt-cacher-ng_homebrew_build_rollup.patch"
    sha256 "dbcba1c779200ea90ece927b77ad59f94dc85cfb09ae266daf49039bedb50e48"
  end

  patch do
    # Bind only to localhost by default
    url "https://raw.githubusercontent.com/Appdynamics/fermenter/develop/patches/apt-cacher-ng_bind_only_to_localhost.patch"
    sha256 "ef86110f72a8062064c48239edbe8b040901a817c93824d40d778eb0310d2d51"
  end

  # for automatic start at login time
  # see http://www.rubydoc.info/github/Homebrew/brew/Formula#plist-instance_method and launchd.plist(5)
  # for more details
  def plist; <<-PLIST.undent
     <?xml version="1.0" encoding="UTF-8"?>
     <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
     <plist version="1.0">
       <dict>
         <key>Label</key>
           <string>#{plist_name}</string>
         <key>ProgramArguments</key>
         <array>
           <string>#{sbin}/acng-wrapper.sh</string>
         </array>
         <key>RunAtLoad</key>
         <true/>
         <key>KeepAlive</key>
         <true/>
         <key>StandardErrorPath</key>
         <string>#{HOMEBREW_PREFIX}/var/log/apt-cacher-ng/apt-cacher.err</string>
         <key>StandardOutPath</key>
         <string>/dev/null</string>
       </dict>
     </plist>
  PLIST
end

  def install
    system "cmake", ".", *std_cmake_args, "-DHOMEBREW_PREFIX=#{HOMEBREW_PREFIX}", "-DSYSCONFDIR=#{etc}",
           "-DLAUNCHD_SERVICE_TARGET=gui/#{Process.uid}/#{plist_name}"
    system "make", "install" # if this fails, try separate make/make install steps
  end

  def post_install
    mkdir "#{HOMEBREW_PREFIX}/var/cache/apt-cacher-ng"
    mkdir "#{HOMEBREW_PREFIX}/var/log/apt-cacher-ng"
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
