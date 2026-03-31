class Ham < Formula
  desc "Multi-agent orchestration with pixel hamsters for Claude Code"
  homepage "https://github.com/0doyun/ham-agents"
  version "0.1.0"
  license "MIT"

  depends_on :macos
  depends_on arch: :arm64

  url "https://github.com/0doyun/ham-agents/releases/download/v0.1.0/ham-agents_darwin_arm64.tar.gz"
  sha256 "006237c4541325cc4dd62f69d6b9d3f89b3cdf02fe950dc92ccb6c84e215d6f5"

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
