class Maton < Formula
  desc "Maton's official command line tool"
  homepage "https://maton.ai"
  version "0.1.6"

  on_macos do
    on_arm do
      url "https://github.com/maton-ai/cli/releases/download/v0.1.6/maton_0.1.6_macOS_arm64.zip"
      sha256 "009ffcc96e8d4638c3c7f34207d3193a9761397ddfa8b6e8546fa741fff04eab"
    end
    on_intel do
      url "https://github.com/maton-ai/cli/releases/download/v0.1.6/maton_0.1.6_macOS_amd64.zip"
      sha256 "3dc2f17f965efc348214a22ad88fff26220026c6d7b7dca7982f9ee6931c0973"
    end
  end

  def install
    bin.install "bin/maton"
    man1.install Dir["share/man/man1/maton*.1"]
    (bash_completion/"maton").write Utils.safe_popen_read(bin/"maton", "completion", "-s", "bash")
    (zsh_completion/"_maton").write Utils.safe_popen_read(bin/"maton", "completion", "-s", "zsh")
    (fish_completion/"maton.fish").write Utils.safe_popen_read(bin/"maton", "completion", "-s", "fish")
  end

  test do
    system "#{bin}/maton", "--version"
  end
end
