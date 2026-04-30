class Maton < Formula
  desc "Maton's official command line tool"
  homepage "https://maton.ai"
  version "0.1.1"

  on_macos do
    on_arm do
      url "https://github.com/maton-ai/cli/releases/download/v0.1.1/maton_0.1.1_macOS_arm64.zip"
      sha256 "4ec0a7f450f7d04900b9064929c3f37fd0e794a64f21995a4ee240e0ef752f09"
    end
    on_intel do
      url "https://github.com/maton-ai/cli/releases/download/v0.1.1/maton_0.1.1_macOS_amd64.zip"
      sha256 "def0232b9c66485981c1dcefdcc09a12445dfbfd8548eb093830e59903e2ddf9"
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
