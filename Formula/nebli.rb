# This file is the SOURCE TEMPLATE. The rendered formula is committed to
# neblihq/homebrew-hover:Formula/nebli.rb by the "Homebrew bump" step in
# .github/workflows/cicd.yml on each prod-v* tag push. The tap repo is named
# `homebrew-hover` so `brew tap neblihq/hover` resolves it with no explicit URL.
#
# Binaries are served from S3/CloudFront (downloads.nebli.ai/cli/...),
# NOT GitHub releases — the tap repo holds ONLY this formula now.
class Nebli < Formula
  desc "Drone relay CLI for Nebli"
  homepage "https://nebli.ai"
  version "0.1.340"

  on_macos do
    on_arm do
      url "https://downloads.nebli.ai/cli/versions/v#{version}/nebli-darwin-arm64.tar.gz"
      sha256 "ec836f65fca00562c5e2bc1f38d774e49bdca0f173b103f38c545a1b57d6a6f8"
    end

    on_intel do
      url "https://downloads.nebli.ai/cli/versions/v#{version}/nebli-darwin-amd64.tar.gz"
      sha256 "ff3a6a91e93ece1c2f12805fe2583ec47c6a2ef2ab20712dcc01050db2fb0591"
    end
  end

  on_linux do
    on_intel do
      url "https://downloads.nebli.ai/cli/versions/v#{version}/nebli-linux-amd64.tar.gz"
      sha256 "465bd3e733edbf3f8ef2ca0ab508adf473c359332aa91eedf8ce66eea59c1ea7"
    end

    on_arm do
      url "https://downloads.nebli.ai/cli/versions/v#{version}/nebli-linux-arm64.tar.gz"
      sha256 "8c0d36b121318fff9cce9ae7517860513dadb72c26f675cdbc7a2c77e5f5ed68"
    end
  end

  def install
    bin.install "nebli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/nebli --version")
  end
end
