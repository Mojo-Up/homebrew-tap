class MojoupNode < Formula
  desc "Headless AI Workbench node: runs agent teams on a machine without a screen"
  homepage "https://github.com/Mojo-Up/ai-workbench-releases"
  version "0.90.32"
  # Free to use, not open source (LICENSE in the releases repository); no SPDX identifier says that.
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/Mojo-Up/ai-workbench-releases/releases/download/v0.90.32/MojoUp-AI-Workbench-Node-0.90.32-darwin-arm64.tar.gz"
      sha256 "9bb82c3193ad1b55173e1284dc62b39503a717ef6143d2a6d62687389f4c806c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Mojo-Up/ai-workbench-releases/releases/download/v0.90.32/MojoUp-AI-Workbench-Node-0.90.32-linux-arm64.tar.gz"
      sha256 "b86bb25ea49cf18c7503a379ede58e78ce1e719590bbdbbb19a36e9e459f1c5f"
    end
    on_intel do
      url "https://github.com/Mojo-Up/ai-workbench-releases/releases/download/v0.90.32/MojoUp-AI-Workbench-Node-0.90.32-linux-x64.tar.gz"
      sha256 "4b75c012d7c18aa6e3195907756bf6a2ea8cd3070801a8f4cb15ac7522b4f92e"
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
