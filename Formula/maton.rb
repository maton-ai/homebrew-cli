class Maton < Formula
  desc "Maton's official command line tool"
  homepage "https://maton.ai"
  version "0.6.0"

  on_macos do
    on_arm do
      url "https://github.com/maton-ai/cli/releases/download/v0.6.0/maton_0.6.0_macOS_arm64.zip"
      sha256 "37fe0b422a1339aa5db3117c61fbb616eee2f4541a1217ae4c9422ba81e0cac9"
    end
    on_intel do
      url "https://github.com/maton-ai/cli/releases/download/v0.6.0/maton_0.6.0_macOS_amd64.zip"
      sha256 "41f2769b8254c6e32d760156a0704f027e929caa4d4e5b49a5d09dda4d53f603"
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
