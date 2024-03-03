cask "syncplay-japan7" do
  version "2571ed3f"
  sha256 "2571ed3fce065c93710315dae56d5ceef949c7ef2516d1db8144763c36d38d87"

  url "https://hikari.butaishoujo.moe/b/#{version}/Syncplay_1.7.2.dmg.zip",
      verified: "hikari.butaishoujo.moe/"
  name "Syncplay-Japan7"
  desc "Synchronises media players"
  homepage "https://github.com/odrling/syncplay"

  conflicts_with cask: "syncplay"
  depends_on macos: ">= :sierra"

  app "Syncplay.app"

  zap trash: [
    "~/.syncplay",
    "~/Library/Preferences/com.syncplay.Interface.plist",
    "~/Library/Preferences/com.syncplay.MainWindow.plist",
    "~/Library/Preferences/com.syncplay.MoreSettings.plist",
    "~/Library/Preferences/com.syncplay.PlayerList.plist",
    "~/Library/Preferences/pl.syncplay.Syncplay.plist",
    "~/Library/Saved Application State/pl.syncplay.Syncplay.savedState",
  ]
end
