cask "aegisub-japan7" do
  on_arm do
    version "b44bea95"
    sha256 "b44bea954eb9b124afdabe427e9c07e9cd8fced9dccdbcf064f0a62a638b7df4"
  end
  on_intel do
    version "f56071d9"
    sha256 "f56071d992f075df1330f1aceb74d9796bd689bc4608a64511d3a24cca81f169"
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
