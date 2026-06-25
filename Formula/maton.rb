class Maton < Formula
  desc "Maton's official command line tool"
  homepage "https://maton.ai"
  version "0.1.5"

  on_macos do
    on_arm do
      url "https://github.com/maton-ai/cli/releases/download/v0.1.5/maton_0.1.5_macOS_arm64.zip"
      sha256 "552a3fea3a8e4d284b98d65d11c1be38c551568b25d8d6cfe1a65ad292bfc059"
    end
    on_intel do
      url "https://github.com/maton-ai/cli/releases/download/v0.1.5/maton_0.1.5_macOS_amd64.zip"
      sha256 "424097d5cd6652437845fa979f4735106ce99cc8924cd355d31af5a98d359d7f"
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
