class MojoupNode < Formula
  desc "Headless AI Workbench node: runs agent teams on a machine without a screen"
  homepage "https://github.com/Mojo-Up/ai-workbench-releases"
  version "0.92.49"
  # Free to use, not open source (LICENSE in the releases repository); no SPDX identifier says that.
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/Mojo-Up/ai-workbench-releases/releases/download/v0.92.49/MojoUp-AI-Workbench-Node-0.92.49-darwin-arm64.tar.gz"
      sha256 "af7f3eb9a2cc5e25ad0db926f9dc5383edcbf20a286052469837dc9f5595a6fa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Mojo-Up/ai-workbench-releases/releases/download/v0.92.49/MojoUp-AI-Workbench-Node-0.92.49-linux-arm64.tar.gz"
      sha256 "559593f3d3f86e788ddde4b460fbd872df58482c6dca387c84c80c289c550636"
    end
    on_intel do
      url "https://github.com/Mojo-Up/ai-workbench-releases/releases/download/v0.92.49/MojoUp-AI-Workbench-Node-0.92.49-linux-x64.tar.gz"
      sha256 "0ac72c912061d261899c45bc948da1bb060ba6935de90aa37aa2677cfb4dd389"
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
