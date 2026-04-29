class Maton < Formula
  desc "Maton's official command line tool"
  homepage "https://maton.ai"
  version "0.1.0"

  on_macos do
    on_arm do
      url "https://github.com/maton-ai/cli/releases/download/v0.1.0/maton_0.1.0_macOS_arm64.zip"
      sha256 "11835dc8096667665ec629257b000d05b1cbec7e1ecbcdd6cecd6612562a0f33"
    end
    on_intel do
      url "https://github.com/maton-ai/cli/releases/download/v0.1.0/maton_0.1.0_macOS_amd64.zip"
      sha256 "008b59707e36198c6581bf390aec140e9b12e6ff55f4500542544f9dba216af0"
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
