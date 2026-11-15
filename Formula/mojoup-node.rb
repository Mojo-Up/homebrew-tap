class MojoupNode < Formula
  desc "Headless AI Workbench node: runs agent teams on a machine without a screen"
  homepage "https://github.com/Mojo-Up/ai-workbench-releases"
  version "0.92.47"
  # Free to use, not open source (LICENSE in the releases repository); no SPDX identifier says that.
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/Mojo-Up/ai-workbench-releases/releases/download/v0.92.47/MojoUp-AI-Workbench-Node-0.92.47-darwin-arm64.tar.gz"
      sha256 "90ec5b1f410321eae15190afeeaec7d7d1bd12af6928b8c7ba174694fc59acd3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Mojo-Up/ai-workbench-releases/releases/download/v0.92.47/MojoUp-AI-Workbench-Node-0.92.47-linux-arm64.tar.gz"
      sha256 "66d6a36873e18247bf6f359a6081455e655bd9cba2a8a9d98f2c1f5c8ab5c4bb"
    end
    on_intel do
      url "https://github.com/Mojo-Up/ai-workbench-releases/releases/download/v0.92.47/MojoUp-AI-Workbench-Node-0.92.47-linux-x64.tar.gz"
      sha256 "0e54ef2cfd57b0b5526f39d3ba0d58ce194eca4f9d597e90b877073e6897afa2"
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
