class MojoupNode < Formula
  desc "Headless AI Workbench node: runs agent teams on a machine without a screen"
  homepage "https://github.com/Mojo-Up/ai-workbench-releases"
  version "0.92.48"
  # Free to use, not open source (LICENSE in the releases repository); no SPDX identifier says that.
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/Mojo-Up/ai-workbench-releases/releases/download/v0.92.48/MojoUp-AI-Workbench-Node-0.92.48-darwin-arm64.tar.gz"
      sha256 "6d580a9e6154477c33fcb0aafc81e8b41fa83c69484d8c6f22eef55732e8c7c7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Mojo-Up/ai-workbench-releases/releases/download/v0.92.48/MojoUp-AI-Workbench-Node-0.92.48-linux-arm64.tar.gz"
      sha256 "e5e5dafda69b24058a884c01e09f396a33049e22f17a7db71f1aec4bfff59cd8"
    end
    on_intel do
      url "https://github.com/Mojo-Up/ai-workbench-releases/releases/download/v0.92.48/MojoUp-AI-Workbench-Node-0.92.48-linux-x64.tar.gz"
      sha256 "4ab6d2c43c780f02d0f71b55bab4014b02d9adeca31aa20e6ff695a2ec380678"
    end
  end

  def install
    libexec.install Dir["*"]
    bin.write_exec_script libexec/"mojoup-node"
  end

  def caveats
    <<~EOS
      Update with `brew upgrade mojoup-node` rather than `mojoup-node update`: Homebrew owns this copy.
      Run `mojoup-node` once for the guided set-up (pairing, joining an organisation, running as a service).
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mojoup-node --version")
  end
end
