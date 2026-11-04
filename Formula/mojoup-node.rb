class MojoupNode < Formula
  desc "Headless AI Workbench node: runs agent teams on a machine without a screen"
  homepage "https://github.com/Mojo-Up/ai-workbench-releases"
  version "0.90.31"
  # Free to use, not open source (LICENSE in the releases repository); no SPDX identifier says that.
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/Mojo-Up/ai-workbench-releases/releases/download/v0.90.31/MojoUp-AI-Workbench-Node-0.90.31-darwin-arm64.tar.gz"
      sha256 "a9935a1b4285783e35fc288bdbcd7c13451d47a74e3c5b99b5bf5ec09d8d585f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Mojo-Up/ai-workbench-releases/releases/download/v0.90.31/MojoUp-AI-Workbench-Node-0.90.31-linux-arm64.tar.gz"
      sha256 "201d01ea014018eb57d3c1acf594f5a9789267ba72d9c3a403846a431724368d"
    end
    on_intel do
      url "https://github.com/Mojo-Up/ai-workbench-releases/releases/download/v0.90.31/MojoUp-AI-Workbench-Node-0.90.31-linux-x64.tar.gz"
      sha256 "495867bcb073483e1395f9708206052a2b7ef2fbddf45d256d20a67d2612fe40"
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
