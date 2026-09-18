class Maton < Formula
  desc "Maton's official command line tool"
  homepage "https://maton.ai"
  version "0.3.2"

  on_macos do
    on_arm do
      url "https://github.com/maton-ai/cli/releases/download/v0.3.2/maton_0.3.2_macOS_arm64.zip"
      sha256 "063bb51ced8c60703edd81bd336320e7bdc623f7b49a15191bd63815d74374a3"
    end
    on_intel do
      url "https://github.com/maton-ai/cli/releases/download/v0.3.2/maton_0.3.2_macOS_amd64.zip"
      sha256 "53fad55d6329502281c1ca9d25ca0b2675f833fd68f0b84a20048ea6b6c70e00"
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
