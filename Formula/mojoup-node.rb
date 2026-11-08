class MojoupNode < Formula
  desc "Headless AI Workbench node: runs agent teams on a machine without a screen"
  homepage "https://github.com/Mojo-Up/ai-workbench-releases"
  version "0.92.39"
  # Free to use, not open source (LICENSE in the releases repository); no SPDX identifier says that.
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/Mojo-Up/ai-workbench-releases/releases/download/v0.92.39/MojoUp-AI-Workbench-Node-0.92.39-darwin-arm64.tar.gz"
      sha256 "884e6d9c7cfa2a7b2170f637402a4541368e4c8b2b0dec278c095213826ff913"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Mojo-Up/ai-workbench-releases/releases/download/v0.92.39/MojoUp-AI-Workbench-Node-0.92.39-linux-arm64.tar.gz"
      sha256 "b638436a5d083ee3fa578a179627a5f37aa5442bfcb673bcfba2be67618b978b"
    end
    on_intel do
      url "https://github.com/Mojo-Up/ai-workbench-releases/releases/download/v0.92.39/MojoUp-AI-Workbench-Node-0.92.39-linux-x64.tar.gz"
      sha256 "1b05a2940c4d26d584c9cad56e5863d1a978d67a186bfe530dca1827d6d75abf"
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
