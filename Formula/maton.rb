class Maton < Formula
  desc "Maton's official command line tool"
  homepage "https://maton.ai"
  version "0.3.0"

  on_macos do
    on_arm do
      url "https://github.com/maton-ai/cli/releases/download/v0.3.0/maton_0.3.0_macOS_arm64.zip"
      sha256 "17b908ef8a666552c75bc83224441fc2902354bf8180e415f7258325bd5a3d4d"
    end
    on_intel do
      url "https://github.com/maton-ai/cli/releases/download/v0.3.0/maton_0.3.0_macOS_amd64.zip"
      sha256 "3b510cb455c8cc8255622d20bae750c373fb378e12fb273a3d502106aff6c016"
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
