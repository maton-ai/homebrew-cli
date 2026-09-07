class Maton < Formula
  desc "Maton's official command line tool"
  homepage "https://maton.ai"
  version "0.3.1"

  on_macos do
    on_arm do
      url "https://github.com/maton-ai/cli/releases/download/v0.3.1/maton_0.3.1_macOS_arm64.zip"
      sha256 "24b542be1da686f6f4a5cf6af14de7fb1f0cdc3a79105c19278110e24f17b054"
    end
    on_intel do
      url "https://github.com/maton-ai/cli/releases/download/v0.3.1/maton_0.3.1_macOS_amd64.zip"
      sha256 "cfb2b31e4363369f8606f5eb62a31de22cb15ff76a42c788b2dbdc5f68c28da8"
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
