class MojoupNode < Formula
  desc "Headless AI Workbench node: runs agent teams on a machine without a screen"
  homepage "https://github.com/Mojo-Up/ai-workbench-releases"
  version "0.92.1"
  # Free to use, not open source (LICENSE in the releases repository); no SPDX identifier says that.
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/Mojo-Up/ai-workbench-releases/releases/download/v0.92.1/MojoUp-AI-Workbench-Node-0.92.1-darwin-arm64.tar.gz"
      sha256 "ba065c0a1e15d98e672dfc1520736afadc135b8d6341ed718441e17304b36757"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Mojo-Up/ai-workbench-releases/releases/download/v0.92.1/MojoUp-AI-Workbench-Node-0.92.1-linux-arm64.tar.gz"
      sha256 "b2debad47dc2b86b64df2df5c9b9f1251ef767de55f7e10f1f9d1f321ee8ca80"
    end
    on_intel do
      url "https://github.com/Mojo-Up/ai-workbench-releases/releases/download/v0.92.1/MojoUp-AI-Workbench-Node-0.92.1-linux-x64.tar.gz"
      sha256 "73d3551e0571eb571b9cff13a61cb2b3460120ef81b8de45bf6969840d7e0700"
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
