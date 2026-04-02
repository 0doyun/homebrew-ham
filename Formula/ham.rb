class Ham < Formula
  desc "Multi-agent orchestration with pixel hamsters for Claude Code"
  homepage "https://github.com/0doyun/ham-agents"
  version "0.2.0"
  license "MIT"

  depends_on :macos
  depends_on arch: :arm64

  url "https://github.com/0doyun/ham-agents/releases/download/v0.2.0/ham-agents_darwin_arm64.tar.gz"
  sha256 "b032ad5b4114f5cf8ad3bda97501fbfc033524ccefa35612159b470d511f4b4e"

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

      Upgrading from v0.1.x? Run `ham setup` again to register new hooks.
    EOS
  end

  test do
    assert_match "ham-agents", shell_output("#{bin}/ham help")
  end
end
