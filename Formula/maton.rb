class Maton < Formula
  desc "Maton's official command line tool"
  homepage "https://maton.ai"
  version "0.3.3"

  on_macos do
    on_arm do
      url "https://github.com/maton-ai/cli/releases/download/v0.3.3/maton_0.3.3_macOS_arm64.zip"
      sha256 "85afcdc8874944ac578f2261928ffad4c2fba64cbffba1e6ce30ccc2a7392910"
    end
    on_intel do
      url "https://github.com/maton-ai/cli/releases/download/v0.3.3/maton_0.3.3_macOS_amd64.zip"
      sha256 "64036e8ba6d7ab63e991b079a8097aa7e7ed22a00a007e5ffacfd6eec2596d20"
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
