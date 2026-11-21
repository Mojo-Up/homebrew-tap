cask "mojoflow" do
  version "0.12.5"
  sha256 "0dacadbc33bc6cc647566182d3b6e524fa941065b650c7f4056d15d992dd52d6"

  url "https://github.com/Mojo-Up/mojoflow-releases/releases/download/v#{version}/MojoFlow-#{version}-mac-arm64.zip"
  name "MojoFlow"
  desc "Push-to-talk dictation that runs entirely on your Mac"
  homepage "https://github.com/Mojo-Up/mojoflow-releases"

  livecheck do
    url "https://github.com/Mojo-Up/mojoflow-releases/releases"
    strategy :github_latest
  end

  # Homebrew owns the install on a Mac: the app points at `brew upgrade --cask mojoflow` there.
  auto_updates false
  depends_on macos: :sonoma
  depends_on arch: :arm64

  app "MojoFlow.app"

  zap trash: [
    "~/Library/Application Support/MojoFlow",
    "~/Library/Caches/au.com.mojoup.MojoFlow",
    "~/Library/Preferences/au.com.mojoup.MojoFlow.plist",
    "~/Library/Saved Application State/au.com.mojoup.MojoFlow.savedState",
  ]
end
