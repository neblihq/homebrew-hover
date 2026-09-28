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
  version "0.1.314"

  on_macos do
    on_arm do
      url "https://downloads.nebli.ai/cli/versions/v#{version}/nebli-darwin-arm64.tar.gz"
      sha256 "e13a4dc451ae002440bd6ba9e40538ce93c6a3e112a6ca5f4a8c929dd705fd04"
    end

    on_intel do
      url "https://downloads.nebli.ai/cli/versions/v#{version}/nebli-darwin-amd64.tar.gz"
      sha256 "932ad9617bdb61463ea87bf0ba6d00dcd1e378a3fa1c3926efd087f2c8c8aeb1"
    end
  end

  on_linux do
    on_intel do
      url "https://downloads.nebli.ai/cli/versions/v#{version}/nebli-linux-amd64.tar.gz"
      sha256 "6d3157129151c66fca88df6c1af928b854bce0ce0e51f269b6dab07d79a739f1"
    end

    on_arm do
      url "https://downloads.nebli.ai/cli/versions/v#{version}/nebli-linux-arm64.tar.gz"
      sha256 "839409aa95261d01038e819ce96f633398a91102572f3571ddd9fb6f2d7361cd"
    end
  end

  def install
    bin.install "nebli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/nebli --version")
  end
end
