class Hobo < Formula
  desc "A collection of shell scripts for managing the life cycle of lab VMs on OS X "
  homepage "https://github.com/Appdynamics/hobo"
  #url "https://github.com/Appdynamics/hobo/archive/0.5.tar.gz"
  #sha256 "2adc8ec2af058664273c07dae0284cc32d80cea7aed4c697e4cb8820fe41d4d7"
  #version "0.5"
  version_scheme 0
  revision 0

  head "git@github.com:Appdynamics/hobo.git", :branch => "develop", :using => :git

  resource "live-image-iso"  do
    url "https://github.com/Appdynamics/lab-on-a-laptop-bootstrap-image/releases/download/0.5/live-image-amd64.hybrid.iso"
    sha256 "bd353be727422d9a56cd09aad2b7c53f95f382ef7c09e5b1e0758ef2b89b0a3d"
  end

  depends_on "cmake" => :build
  depends_on "apt-cacher-ng" => :run

  def install
    system "cmake", ".", *std_cmake_args, "-DSHAREDIR=#{pkgshare}"
    system "make", "install"

    pkgshare.install resource("live-image-iso").files
  end

  #TODO: force cleanup of previous versions?
end
