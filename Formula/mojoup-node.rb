class MojoupNode < Formula
  desc "Headless AI Workbench node: runs agent teams on a machine without a screen"
  homepage "https://github.com/Mojo-Up/ai-workbench-releases"
  version "0.92.46"
  # Free to use, not open source (LICENSE in the releases repository); no SPDX identifier says that.
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/Mojo-Up/ai-workbench-releases/releases/download/v0.92.46/MojoUp-AI-Workbench-Node-0.92.46-darwin-arm64.tar.gz"
      sha256 "b82f441f95dc7fc86c7fe69a6f3ffa107a0e0096b755e18da01160355aec7e55"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Mojo-Up/ai-workbench-releases/releases/download/v0.92.46/MojoUp-AI-Workbench-Node-0.92.46-linux-arm64.tar.gz"
      sha256 "2a390dda6809f2a809515e6a38789f924b1908d653f6df8a62b88e543e0a0ee0"
    end
    on_intel do
      url "https://github.com/Mojo-Up/ai-workbench-releases/releases/download/v0.92.46/MojoUp-AI-Workbench-Node-0.92.46-linux-x64.tar.gz"
      sha256 "cd5a35b530d409e362554eb7a6436af027a32ccac3d1403c65082c4128e36fa9"
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
