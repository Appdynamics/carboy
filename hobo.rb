class Hobo < Formula
  desc "A collection of shell scripts for managing the life cycle of lab VMs on OS X "
  homepage "https://github.com/Appdynamics/hobo"
  #url "https://github.com/Appdynamics/hobo/archive/0.5.tar.gz"
  #sha256 "2adc8ec2af058664273c07dae0284cc32d80cea7aed4c697e4cb8820fe41d4d7"
  #version "0.5"
  version_scheme 0
  revision 0

  head "git@github.com:Appdynamics/hobo.git", :branch => "develop", :using => :git

  @@live_iso_resource_name="live-iso"
  @@live_iso_basename="live-image-amd64.hybrid.iso"

  resource @@live_iso_resource_name  do
    #FIXME: repoint to GitHub URL before next release
    url "file:///Users/mikep/Downloads/#{@@live_iso_basename}"
    #sha256 ""
  end

  depends_on "cmake" => :build
  depends_on "apt-cacher-ng" => :run
  # TODO: uncomment once DNS manipulation scripts are ready
  # depends_on "pdns" => [:run, "with-postgresql"]

  def install
    system "cmake", ".", *std_cmake_args, "-DHOMEBREW_PREFIX=#{HOMEBREW_PREFIX}", "-DSHAREDIR=#{pkgshare}",
           "-DCFGDIR=#{etc}/#{name}"
    system "make", "install"

    live_iso=resource(@@live_iso_resource_name)
    live_iso.fetch
    pkgshare.mkpath
    FileUtils.cp live_iso.cached_download, "#{pkgshare}/#{@@live_iso_basename}"
  end

  #TODO: force cleanup of previous versions?
end
