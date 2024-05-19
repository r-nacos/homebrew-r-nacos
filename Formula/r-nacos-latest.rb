# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class RNacosLatest < Formula
  desc "r-nacos latest"
  homepage "https://github.com/r-nacos/r-nacos"
  url "https://github.com/nacos-group/r-nacos/releases/download/v0.5.8-beta.1/rnacos-x86_64-apple-darwin.tar.gz"
  version "v0.5.8-beta.1"
  #sha256 "811f7f5d5f45f3ba9167093be4656bb610d9cc5e287c39f55af02cdaa56303e4"
  license "Apache-2.0 license"

  # depends_on "cmake" => :build
  on_macos do
    on_arm do
      url "https://github.com/nacos-group/r-nacos/releases/download/v0.5.8-beta.1/rnacos-aarch64-apple-darwin.tar.gz"
    end
  end

  on_linux do
    url "https://github.com/nacos-group/r-nacos/releases/download/v0.5.8-beta.1/rnacos-x86_64-unknown-linux-musl.tar.gz"
    on_arm do
      url "https://github.com/nacos-group/r-nacos/releases/download/v0.5.8-beta.1/rnacos-aarch64-unknown-linux-musl.tar.gz"
    end
  end

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    # Remove unrecognized options if warned by configure
    # https://rubydoc.brew.sh/Formula.html#std_configure_args-instance_method
    #system "./configure", *std_configure_args, "--disable-silent-rules"
    # system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    bin.install "rnacos"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test r-nacos`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "#{bin}/rnacos", "--version" 
  end
end
