cask "aegisub-japan7" do
  version "51a77036"
  sha256 "51a770366fe71b0d0745c6fe3a7eb12fae97e21c349c4a44318f0cafa074b1e2"

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
