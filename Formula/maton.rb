class Maton < Formula
  desc "Maton's official command line tool"
  homepage "https://maton.ai"
  version "0.1.2"

  on_macos do
    on_arm do
      url "https://github.com/maton-ai/cli/releases/download/v0.1.2/maton_0.1.2_macOS_arm64.zip"
      sha256 "b52f4e66c32cd45a073bb754173be7089a73f8ad09398472166f77b0a5086dd6"
    end
    on_intel do
      url "https://github.com/maton-ai/cli/releases/download/v0.1.2/maton_0.1.2_macOS_amd64.zip"
      sha256 "ff731d02f775258e73af06b81b571440c8fc2cae180ec298c3050e8edbaa6de6"
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
