class Ffmpegaacsucks < Formula
  desc "Because FFmpeg AAC sucks"
  homepage "https://github.com/odrling/ffmpegaacsucks"
  url "https://github.com/odrling/ffmpegaacsucks/archive/refs/tags/2.0.1.tar.gz"
  sha256 "8b2578c9e7a15d85b3a46c8db30f400320a1a04d3d121f109722cdd5499ab5d5"
  license "LGPL-3.0-or-later"
  head "https://github.com/odrling/ffmpegaacsucks.git", branch: "master"

  bottle do
    root_url "https://github.com/Japan7/homebrew-tap/releases/download/ffmpegaacsucks-2.0.1"
    sha256 cellar: :any,                 arm64_sonoma: "649b6a02038bf5b0da9ef7ddc2096d01b9efe7490f4be5bc15d0c61278596352"
    sha256 cellar: :any,                 ventura:      "f823a795320732ffd305df15540b0b80ba9df55e36ba69ebec9adeecfde56f06"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "bc0bdcfa2d2bfb2ca85fc3cf901c0b255ca3116e58dd9f7cfd18832ae2cc202f"
  end

  depends_on "meson" => :build
  depends_on "ninja" => :build
  depends_on "pkg-config" => [:build, :test]
  depends_on "ffmpeg"

  def install
    system "meson", "setup", "build", *std_meson_args
    system "meson", "compile", "-C", "build", "--verbose"
    system "meson", "install", "-C", "build"
  end

  test do
    system "#{bin}/ffmpegaacsucks", test_fixtures("test.m4a")
    system "pkg-config", "ffmpegaacsucks"
  end
end
