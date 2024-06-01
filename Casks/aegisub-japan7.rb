cask "aegisub-japan7" do
  on_arm do
    version "249474e9"
    sha256 "249474e933d06531a2840c0fe1123fb239fa5609b69ade812c13a6c393c119ac"
  end
  on_intel do
    version "47077133"
    sha256 "4707713363a30be1c96fcf86a65da9015250e2c4532d2f20fb33f68e47563603"
  end

  url "https://hikari.butaishoujo.moe/b/#{version}/Aegisub-3.2.2.dmg.zip",
      verified: "hikari.butaishoujo.moe/"
  name "Aegisub-Japan7"
  desc "Create and modify subtitles"
  homepage "https://github.com/odrling/Aegisub"

  conflicts_with cask: "aegisub"

  app "Aegisub.app"

  uninstall quit: "com.aegisub.aegisub"

  zap trash: [
    "~/Library/Application Support/Aegisub",
    "~/Library/Preferences/com.aegisub.aegisub.plist",
    "~/Library/Saved Application State/com.aegisub.aegisub.savedState",
  ]
end
