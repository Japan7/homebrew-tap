cask "aegisub-japan7" do
  on_arm do
    version "69b1c036"
    sha256 "69b1c036dbaa88ad385d96825af53a7c76de0338f5d46c37b3e621d98f3b6e1e"
  end
  on_intel do
    version "184e2446"
    sha256 "184e24468196b4897b9a5034ded918425458f087e96dd57d56287c986253c600"
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
