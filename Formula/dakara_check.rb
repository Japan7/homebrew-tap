class DakaraCheck < Formula
  desc "Checks for dakara karaokes"
  homepage "https://github.com/Japan7/dakara_check"
  url "https://github.com/Japan7/dakara_check/archive/refs/tags/4.0.4.tar.gz"
  sha256 "4374c4e031e4a1716c8e31432a65fc2b1c03c613f07d968a01ad1397dcd9afc9"
  license "LGPL-3.0-or-later"
  head "https://github.com/Japan7/dakara_check.git", branch: "master"

  depends_on "meson" => :build
  depends_on "ninja" => :build
  depends_on "pkg-config" => [:build, :test]
  depends_on "ffmpeg"
  depends_on "ffmpegaacsucks"

  def install
    system "meson", "setup", "build", *std_meson_args
    system "meson", "compile", "-C", "build", "--verbose"
    system "meson", "install", "-C", "build"
  end

  test do
    system "#{bin}/dakara_check", test_fixtures("test.mp3")
    system "pkg-config", "dakara_check"
  end
end
