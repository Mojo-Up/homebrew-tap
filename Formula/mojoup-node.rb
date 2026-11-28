class MojoupNode < Formula
  desc "Headless AI Workbench node: runs agent teams on a machine without a screen"
  homepage "https://github.com/Mojo-Up/ai-workbench-releases"
  version "0.92.51"
  # Free to use, not open source (LICENSE in the releases repository); no SPDX identifier says that.
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/Mojo-Up/ai-workbench-releases/releases/download/v0.92.51/MojoUp-AI-Workbench-Node-0.92.51-darwin-arm64.tar.gz"
      sha256 "cb6b8c35dd5cee0e5b43e77b1c0aec827d5dc33ef92d5648b107e9e9bed4fa7f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Mojo-Up/ai-workbench-releases/releases/download/v0.92.51/MojoUp-AI-Workbench-Node-0.92.51-linux-arm64.tar.gz"
      sha256 "544451095d5741c5174ce0e559da7021885669e6be5f9860145def9107265dc9"
    end
    on_intel do
      url "https://github.com/Mojo-Up/ai-workbench-releases/releases/download/v0.92.51/MojoUp-AI-Workbench-Node-0.92.51-linux-x64.tar.gz"
      sha256 "70ece29bc2d9247cc2424ae4bf31305c13803f080b4f6184f8eadf7edf52d8ee"
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
