class MojoupNode < Formula
  desc "Headless AI Workbench node: runs agent teams on a machine without a screen"
  homepage "https://github.com/Mojo-Up/ai-workbench-releases"
  version "0.92.41"
  # Free to use, not open source (LICENSE in the releases repository); no SPDX identifier says that.
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/Mojo-Up/ai-workbench-releases/releases/download/v0.92.41/MojoUp-AI-Workbench-Node-0.92.41-darwin-arm64.tar.gz"
      sha256 "f1283b19f27f74016d235931aefae8085c6ed49ca5bdd063562f2d871a6528bd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Mojo-Up/ai-workbench-releases/releases/download/v0.92.41/MojoUp-AI-Workbench-Node-0.92.41-linux-arm64.tar.gz"
      sha256 "1047c880e30850a5bd989ed229c7b7d8639cb4016cbe8683547a9ebbf0bf5381"
    end
    on_intel do
      url "https://github.com/Mojo-Up/ai-workbench-releases/releases/download/v0.92.41/MojoUp-AI-Workbench-Node-0.92.41-linux-x64.tar.gz"
      sha256 "9da596a04a8ad43f3e54680d447db03dee3276f6b7341c95014211d44dce0114"
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
