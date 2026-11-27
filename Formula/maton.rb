class Maton < Formula
  desc "Maton's official command line tool"
  homepage "https://maton.ai"
  version "0.7.0"

  on_macos do
    on_arm do
      url "https://github.com/maton-ai/cli/releases/download/v0.7.0/maton_0.7.0_macOS_arm64.zip"
      sha256 "f425d5cb29d1c1b7d5f083c0af7e8b483bc41bb7d650e1393746a78d9f05256b"
    end
    on_intel do
      url "https://github.com/maton-ai/cli/releases/download/v0.7.0/maton_0.7.0_macOS_amd64.zip"
      sha256 "4974b4f45a99e42922bbae7b072dadbf0deffd7a773c81321becca5df5776248"
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
