class Ham < Formula
  desc "Multi-agent orchestration with pixel hamsters for Claude Code"
  homepage "https://github.com/0doyun/ham-agents"
  version "0.1.2"
  license "MIT"

  depends_on :macos
  depends_on arch: :arm64

  url "https://github.com/0doyun/ham-agents/releases/download/v0.1.2/ham-agents_darwin_arm64.tar.gz"
  sha256 "ad892cd2980f4223366ed947c3712f43bd76d5f9849c1e3ab252a5812756c9e9"

  bottle do
    root_url "https://github.com/0doyun/ham-agents/releases/download/v0.1.2"
    sha256 cellar: :any_skip_relocation, all: "a9d22e68da878c6139f9949e9ad070577f0a4e05fb351e8ede08b196f1d4c3fa"
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
