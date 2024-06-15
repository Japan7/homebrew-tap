class DakaraCheck < Formula
  desc "Checks for dakara karaokes"
  homepage "https://github.com/Japan7/dakara_check"
  url "https://github.com/Japan7/dakara_check/archive/refs/tags/4.0.4.tar.gz"
  sha256 "4374c4e031e4a1716c8e31432a65fc2b1c03c613f07d968a01ad1397dcd9afc9"
  license "LGPL-3.0-or-later"
  head "https://github.com/Japan7/dakara_check.git", branch: "master"

  bottle do
    root_url "https://github.com/Japan7/homebrew-tap/releases/download/dakara_check-4.0.4"
    sha256 cellar: :any,                 arm64_sonoma: "54f8c9ec1f858ae405b1d31b43beb039584ac5466ed235d695671d52c2456388"
    sha256 cellar: :any,                 ventura:      "87c20ec791919db66fd49e16a2e791e63d5b3dac3c056ea1d039ea324f4d534c"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "e454836b9cf8a7f15d9cc0d3a9d705d5c101c6e737a6a480da5b7ed54bea41f5"
  end

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
