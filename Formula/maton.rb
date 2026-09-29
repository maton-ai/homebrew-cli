class Maton < Formula
  desc "Maton's official command line tool"
  homepage "https://maton.ai"
  version "0.3.5"

  on_macos do
    on_arm do
      url "https://github.com/maton-ai/cli/releases/download/v0.3.5/maton_0.3.5_macOS_arm64.zip"
      sha256 "d95fea66d5135e0a666d5d9139f1e8e53133ff4f6ffeccdded91730c4a98677a"
    end
    on_intel do
      url "https://github.com/maton-ai/cli/releases/download/v0.3.5/maton_0.3.5_macOS_amd64.zip"
      sha256 "db7443e0309234eff221cfa207242ce505eb53e552c9543ab544264afaa5d621"
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
