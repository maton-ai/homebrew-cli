class Maton < Formula
  desc "Maton's official command line tool"
  homepage "https://maton.ai"
  version "0.1.4"

  on_macos do
    on_arm do
      url "https://github.com/maton-ai/cli/releases/download/v0.1.4/maton_0.1.4_macOS_arm64.zip"
      sha256 "faf8f27e5f0b17a7314dd01b39e9b9ef5ab733b4f66ff3960d3355bff1197fbf"
    end
    on_intel do
      url "https://github.com/maton-ai/cli/releases/download/v0.1.4/maton_0.1.4_macOS_amd64.zip"
      sha256 "d99186cd750cfebf1d875c482188aa74473ba12e48935f4fb18d40354e7ffcb3"
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
