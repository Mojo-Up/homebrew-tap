class MojoupNode < Formula
  desc "Headless AI Workbench node: runs agent teams on a machine without a screen"
  homepage "https://github.com/Mojo-Up/ai-workbench-releases"
  version "0.90.30"
  # Free to use, not open source (LICENSE in the releases repository); no SPDX identifier says that.
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/Mojo-Up/ai-workbench-releases/releases/download/v0.90.30/MojoUp-AI-Workbench-Node-0.90.30-darwin-arm64.tar.gz"
      sha256 "5c7e2b895be5bc0f1036f5b20baf2e37358b96d42751ea5b1f5b79de92970303"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Mojo-Up/ai-workbench-releases/releases/download/v0.90.30/MojoUp-AI-Workbench-Node-0.90.30-linux-arm64.tar.gz"
      sha256 "d16cd191a4eb0a66c25557f1630936f39492a5e6cf24d547ddd8e546a3f6ff10"
    end
    on_intel do
      url "https://github.com/Mojo-Up/ai-workbench-releases/releases/download/v0.90.30/MojoUp-AI-Workbench-Node-0.90.30-linux-x64.tar.gz"
      sha256 "27cb6a39b58695df1ad81eace1dc0d23bdfcce11aa63d6bcc8f204249a3d8f50"
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
