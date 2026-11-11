cask "ai-workbench" do

  version "0.92.42"
  sha256 "327f5d5541048dc668e7d717862599d22bf23c1608fe205204b40d617db0c6a1"

  url "https://github.com/Mojo-Up/ai-workbench-releases/releases/download/v#{version}/mju-ai-workbench-desktop-#{version}-mac-arm64.dmg"
  name "AI Workbench"
  desc "Run teams of AI coding agents on your own repositories"
  homepage "https://github.com/Mojo-Up/ai-workbench-releases"

  livecheck do
    url "https://github.com/Mojo-Up/ai-workbench-releases/releases"
    strategy :github_latest
  end

  # Homebrew owns the install on a Mac: the Updates pane only points at the download page there.
  auto_updates false

  depends_on macos: :big_sur
  depends_on arch: :arm64

  app "AI Workbench.app"

  zap trash: [
    "~/Library/Application Support/AI Workbench",
    "~/Library/Caches/com.mojoup.workbench",
    "~/Library/Preferences/com.mojoup.workbench.plist",
    "~/Library/Saved Application State/com.mojoup.workbench.savedState",
  ]
end
