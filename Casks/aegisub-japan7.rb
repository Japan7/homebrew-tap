cask "aegisub-japan7" do
  on_arm do
    version "3ad0b988"
    sha256 "3ad0b98813a384d9c3ab6c5cca25defa92069db078ebf8109da1c36034c757eb"
  end
  on_intel do
    version "5c461b23"
    sha256 "5c461b230c87a67a0b4d4b9ac006a7ded7342b522a740df5b292d51c978c16e8"
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
