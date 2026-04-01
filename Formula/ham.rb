class Ham < Formula
  desc "Multi-agent orchestration with pixel hamsters for Claude Code"
  homepage "https://github.com/0doyun/ham-agents"
  version "0.1.1"
  license "MIT"

  depends_on :macos
  depends_on arch: :arm64

  url "https://github.com/0doyun/ham-agents/releases/download/v0.1.1/ham-agents_darwin_arm64.tar.gz"
  sha256 "93f3a31f095ecabc5ec51e8e4050f5a010cdf743b18fc3028e411e4f52399260"

  bottle do
    root_url "https://github.com/0doyun/ham-agents/releases/download/v0.1.1"
    sha256 cellar: :any_skip_relocation, all: "a8ab9597ebc59679198d224ad49f2a325cf7585d3df162d9610d01ebc8004023"
  end

  def install
    bin.install "ham"
    bin.install "hamd"
    bin.install "ham-menubar"
  end

  def caveats
    <<~EOS
      To complete setup, run:
        ham setup

      This registers Claude Code hooks so ham-agents starts automatically.
      Requires Claude Code CLI: https://docs.anthropic.com/en/docs/claude-code
    EOS
  end

  test do
    assert_match "ham-agents", shell_output("#{bin}/ham help")
  end
end
