class Maton < Formula
  desc "Maton's official command line tool"
  homepage "https://maton.ai"
  version "0.2.0"

  on_macos do
    on_arm do
      url "https://github.com/maton-ai/cli/releases/download/v0.2.0/maton_0.2.0_macOS_arm64.zip"
      sha256 "107ab2145fa04b9c7be72df59e26315e9d414ac3f02249218406e3caaf9214fa"
    end
    on_intel do
      url "https://github.com/maton-ai/cli/releases/download/v0.2.0/maton_0.2.0_macOS_amd64.zip"
      sha256 "d2a4536904afbf1a35da6d5470a750006fe121ede3177ef93551faa15317d59b"
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
