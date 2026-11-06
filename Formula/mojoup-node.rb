class MojoupNode < Formula
  desc "Headless AI Workbench node: runs agent teams on a machine without a screen"
  homepage "https://github.com/Mojo-Up/ai-workbench-releases"
  version "0.92.0"
  # Free to use, not open source (LICENSE in the releases repository); no SPDX identifier says that.
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/Mojo-Up/ai-workbench-releases/releases/download/v0.92.0/MojoUp-AI-Workbench-Node-0.92.0-darwin-arm64.tar.gz"
      sha256 "a2a11b39127c64ba3b57f806a53004b655ff667909033b24b032d419f212604f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Mojo-Up/ai-workbench-releases/releases/download/v0.92.0/MojoUp-AI-Workbench-Node-0.92.0-linux-arm64.tar.gz"
      sha256 "5e772984ceea34f01ec727ba7adc1d4d0292c42c16715c95d82d5d2909625cf2"
    end
    on_intel do
      url "https://github.com/Mojo-Up/ai-workbench-releases/releases/download/v0.92.0/MojoUp-AI-Workbench-Node-0.92.0-linux-x64.tar.gz"
      sha256 "cecfeac271f7ec6a7ba200e48495e1dd809cfb959e9d78c7881c136cfbc0041a"
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
