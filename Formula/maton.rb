class Maton < Formula
  desc "Maton's official command line tool"
  homepage "https://maton.ai"
  version "0.1.3"

  on_macos do
    on_arm do
      url "https://github.com/maton-ai/cli/releases/download/v0.1.3/maton_0.1.3_macOS_arm64.zip"
      sha256 "a711a5555940b031a92dc7af047b915b0aa49cf165c5a525800aa81a449e5d7c"
    end
    on_intel do
      url "https://github.com/maton-ai/cli/releases/download/v0.1.3/maton_0.1.3_macOS_amd64.zip"
      sha256 "29b292f0d41e866b3347a020174e44116f49c93d136d92f96d1cf7e1791c425d"
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
