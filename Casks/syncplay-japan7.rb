cask "syncplay-japan7" do
  version "d54d70ce"
  sha256 "d54d70cef9b7733e554a1191f93b6dd3317d3075acfb4d22c17396787b6de76f"

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
