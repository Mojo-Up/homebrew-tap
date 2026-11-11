class MojoupNode < Formula
  desc "Headless AI Workbench node: runs agent teams on a machine without a screen"
  homepage "https://github.com/Mojo-Up/ai-workbench-releases"
  version "0.92.42"
  # Free to use, not open source (LICENSE in the releases repository); no SPDX identifier says that.
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/Mojo-Up/ai-workbench-releases/releases/download/v0.92.42/MojoUp-AI-Workbench-Node-0.92.42-darwin-arm64.tar.gz"
      sha256 "0e2dbb21b76859cbc62a7d632606e0faf50257b1bbb369bed28f76b5e34c0cff"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Mojo-Up/ai-workbench-releases/releases/download/v0.92.42/MojoUp-AI-Workbench-Node-0.92.42-linux-arm64.tar.gz"
      sha256 "2c395f724fe9f6ab9145c01cf62bbe876479b9cd41f4063fc4820639d60d866d"
    end
    on_intel do
      url "https://github.com/Mojo-Up/ai-workbench-releases/releases/download/v0.92.42/MojoUp-AI-Workbench-Node-0.92.42-linux-x64.tar.gz"
      sha256 "2323fb0eb02c2824db0a48a8b776d77721644332496b963dbb507237580c5b0e"
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
