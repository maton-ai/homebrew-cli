class Maton < Formula
  desc "Maton's official command line tool"
  homepage "https://maton.ai"
  version "0.4.0"

  on_macos do
    on_arm do
      url "https://github.com/maton-ai/cli/releases/download/v0.4.0/maton_0.4.0_macOS_arm64.zip"
      sha256 "6a58df71ef201644b24443e936fc946257a21f79b38a8f5d4df265288b94d8b5"
    end
    on_intel do
      url "https://github.com/maton-ai/cli/releases/download/v0.4.0/maton_0.4.0_macOS_amd64.zip"
      sha256 "58e1cc0d837df049c1b5bc929151dec5df1f8d54e5c2854c8dbba3417078e471"
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
