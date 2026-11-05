class MojoupNode < Formula
  desc "Headless AI Workbench node: runs agent teams on a machine without a screen"
  homepage "https://github.com/Mojo-Up/ai-workbench-releases"
  version "0.91.4"
  # Free to use, not open source (LICENSE in the releases repository); no SPDX identifier says that.
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/Mojo-Up/ai-workbench-releases/releases/download/v0.91.4/MojoUp-AI-Workbench-Node-0.91.4-darwin-arm64.tar.gz"
      sha256 "75d8fdedb8d628bc21b53c696223288341a3e133417cdceff8a97a39add43a5f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Mojo-Up/ai-workbench-releases/releases/download/v0.91.4/MojoUp-AI-Workbench-Node-0.91.4-linux-arm64.tar.gz"
      sha256 "93e3d3806605b51963f9f6a34822c0cf25c8039a9619093d2735d05ae804f63e"
    end
    on_intel do
      url "https://github.com/Mojo-Up/ai-workbench-releases/releases/download/v0.91.4/MojoUp-AI-Workbench-Node-0.91.4-linux-x64.tar.gz"
      sha256 "c719802845ab42696fb483ae0f8f3f007981dca105d45581f983711cb5b66c78"
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
