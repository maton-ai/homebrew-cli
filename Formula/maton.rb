class Maton < Formula
  desc "Maton's official command line tool"
  homepage "https://maton.ai"
  version "0.5.0"

  on_macos do
    on_arm do
      url "https://github.com/maton-ai/cli/releases/download/v0.5.0/maton_0.5.0_macOS_arm64.zip"
      sha256 "661da5b4e989b67991ca8145b3a7714925dbbd5a1c77a46cdb936827529bd001"
    end
    on_intel do
      url "https://github.com/maton-ai/cli/releases/download/v0.5.0/maton_0.5.0_macOS_amd64.zip"
      sha256 "cbce390e83f0290c18fa3473c85dd5d0af42b8e97c2b516d2af1599ba9a458fb"
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
