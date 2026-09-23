class Maton < Formula
  desc "Maton's official command line tool"
  homepage "https://maton.ai"
  version "0.3.4"

  on_macos do
    on_arm do
      url "https://github.com/maton-ai/cli/releases/download/v0.3.4/maton_0.3.4_macOS_arm64.zip"
      sha256 "d2caa7aa1557a22db4e854e13b426923f3bb9f3bf853bdc330d8f87fc33390ae"
    end
    on_intel do
      url "https://github.com/maton-ai/cli/releases/download/v0.3.4/maton_0.3.4_macOS_amd64.zip"
      sha256 "415509096fe4aba8c8245bce822e19646be317be33fd6fd2309eed78c4d30555"
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
