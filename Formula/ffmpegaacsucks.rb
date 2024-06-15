class Ffmpegaacsucks < Formula
  desc "Because FFmpeg AAC sucks"
  homepage "https://github.com/odrling/ffmpegaacsucks"
  url "https://github.com/odrling/ffmpegaacsucks/archive/refs/tags/2.0.1.tar.gz"
  sha256 "8b2578c9e7a15d85b3a46c8db30f400320a1a04d3d121f109722cdd5499ab5d5"
  license "LGPL-3.0-or-later"
  head "https://github.com/odrling/ffmpegaacsucks.git", branch: "master"

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
