class MojoupNode < Formula
  desc "Headless AI Workbench node: runs agent teams on a machine without a screen"
  homepage "https://github.com/Mojo-Up/ai-workbench-releases"
  version "0.90.33"
  # Free to use, not open source (LICENSE in the releases repository); no SPDX identifier says that.
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/Mojo-Up/ai-workbench-releases/releases/download/v0.90.33/MojoUp-AI-Workbench-Node-0.90.33-darwin-arm64.tar.gz"
      sha256 "cccd4818bd97c80811eeebefe79b30b34c02a216eacf06e72d4114dbb5124b22"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Mojo-Up/ai-workbench-releases/releases/download/v0.90.33/MojoUp-AI-Workbench-Node-0.90.33-linux-arm64.tar.gz"
      sha256 "36ad76fd83cb65c678fe01a732e66ba990123abd22e6e1caec3c2501f824e298"
    end
    on_intel do
      url "https://github.com/Mojo-Up/ai-workbench-releases/releases/download/v0.90.33/MojoUp-AI-Workbench-Node-0.90.33-linux-x64.tar.gz"
      sha256 "adb0d53da72c1ae3591d6bb5cdb5e87913299c099c1ce75a68c699f02b388880"
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
