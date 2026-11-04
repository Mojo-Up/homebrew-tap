class MojoupNode < Formula
  desc "Headless AI Workbench node: runs agent teams on a machine without a screen"
  homepage "https://github.com/Mojo-Up/ai-workbench-releases"
<<<<<<< HEAD
  version "0.91.3"
=======
  version "0.90.32"
>>>>>>> origin/main
  # Free to use, not open source (LICENSE in the releases repository); no SPDX identifier says that.
  license :cannot_represent

  on_macos do
    on_arm do
<<<<<<< HEAD
      url "https://github.com/Mojo-Up/ai-workbench-releases/releases/download/v0.91.3/MojoUp-AI-Workbench-Node-0.91.3-darwin-arm64.tar.gz"
      sha256 "cbcf10f7d171c13702952f739faf7e421e66233658a21dab99b3e8f1341318f4"
=======
      url "https://github.com/Mojo-Up/ai-workbench-releases/releases/download/v0.90.32/MojoUp-AI-Workbench-Node-0.90.32-darwin-arm64.tar.gz"
      sha256 "9bb82c3193ad1b55173e1284dc62b39503a717ef6143d2a6d62687389f4c806c"
>>>>>>> origin/main
    end
  end

  on_linux do
    on_arm do
<<<<<<< HEAD
      url "https://github.com/Mojo-Up/ai-workbench-releases/releases/download/v0.91.3/MojoUp-AI-Workbench-Node-0.91.3-linux-arm64.tar.gz"
      sha256 "15aaa7555d5f75c85e122496716cb6b9510523bde86ad3a0f5b1f6b5112e918d"
    end
    on_intel do
      url "https://github.com/Mojo-Up/ai-workbench-releases/releases/download/v0.91.3/MojoUp-AI-Workbench-Node-0.91.3-linux-x64.tar.gz"
      sha256 "1d2ebd493208fe589354a7d6d6466df039b44b64721edd5f840edab8b5a1207b"
=======
      url "https://github.com/Mojo-Up/ai-workbench-releases/releases/download/v0.90.32/MojoUp-AI-Workbench-Node-0.90.32-linux-arm64.tar.gz"
      sha256 "b86bb25ea49cf18c7503a379ede58e78ce1e719590bbdbbb19a36e9e459f1c5f"
    end
    on_intel do
      url "https://github.com/Mojo-Up/ai-workbench-releases/releases/download/v0.90.32/MojoUp-AI-Workbench-Node-0.90.32-linux-x64.tar.gz"
      sha256 "4b75c012d7c18aa6e3195907756bf6a2ea8cd3070801a8f4cb15ac7522b4f92e"
>>>>>>> origin/main
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
