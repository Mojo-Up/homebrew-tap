cask "ai-workbench" do

<<<<<<< HEAD
  version "0.91.3"
  sha256 "977f531dc202d2673570624056db4a756ff154a9c514c666f6cde459e91019aa"
=======
  version "0.90.32"
  sha256 "a50633035144cd48badc319ebae3a0f4d811cf86f665ed536a9b700c17f02f2a"
>>>>>>> origin/main

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

  depends_on macos: ">= :big_sur"
  depends_on arch: :arm64

  app "AI Workbench.app"

  zap trash: [
    "~/Library/Application Support/AI Workbench",
    "~/Library/Caches/com.mojoup.workbench",
    "~/Library/Preferences/com.mojoup.workbench.plist",
    "~/Library/Saved Application State/com.mojoup.workbench.savedState",
  ]
end
