cask "mojoflow" do
  version "0.12.2"
  sha256 "a431754c21d0f67c18c7e4df126f697b3c4adb3cc783e72ca5b316d7242579f2"

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
  depends_on macos: ">= :sonoma"
  depends_on arch: :arm64

  app "MojoFlow.app"

  zap trash: [
    "~/Library/Application Support/MojoFlow",
    "~/Library/Caches/au.com.mojoup.MojoFlow",
    "~/Library/Preferences/au.com.mojoup.MojoFlow.plist",
    "~/Library/Saved Application State/au.com.mojoup.MojoFlow.savedState",
  ]
end
