class MojoupNode < Formula
  desc "Headless AI Workbench node: runs agent teams on a machine without a screen"
  homepage "https://github.com/Mojo-Up/ai-workbench-releases"
  version "0.92.50"
  # Free to use, not open source (LICENSE in the releases repository); no SPDX identifier says that.
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/Mojo-Up/ai-workbench-releases/releases/download/v0.92.50/MojoUp-AI-Workbench-Node-0.92.50-darwin-arm64.tar.gz"
      sha256 "31173b6a479d71d65eaa94665db810d3c6001a2c29b1c052e8bb870243e78652"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Mojo-Up/ai-workbench-releases/releases/download/v0.92.50/MojoUp-AI-Workbench-Node-0.92.50-linux-arm64.tar.gz"
      sha256 "60d1f9e6db67809193d468b6b629daf5d3b6510c7fb96f5e35d12bc12eea1f34"
    end
    on_intel do
      url "https://github.com/Mojo-Up/ai-workbench-releases/releases/download/v0.92.50/MojoUp-AI-Workbench-Node-0.92.50-linux-x64.tar.gz"
      sha256 "7637a93130c0080d4ff7585565e14958f63ab8f997438ebdd10507fc1662d9cc"
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
