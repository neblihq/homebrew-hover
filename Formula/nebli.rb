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
  version "0.1.329"

  on_macos do
    on_arm do
      url "https://downloads.nebli.ai/cli/versions/v#{version}/nebli-darwin-arm64.tar.gz"
      sha256 "4b8f1f110cb379dccdc25de02410127614b5db25e866b912cd3106b1f2c23205"
    end

    on_intel do
      url "https://downloads.nebli.ai/cli/versions/v#{version}/nebli-darwin-amd64.tar.gz"
      sha256 "833a542e4ae94719b5094f0ada9fc95b37ea003c22563574d6b7d7e01b65517a"
    end
  end

  on_linux do
    on_intel do
      url "https://downloads.nebli.ai/cli/versions/v#{version}/nebli-linux-amd64.tar.gz"
      sha256 "cc2e843d07c4f6bec192fc4a692a4a72785962bcf66619523945a5bb857c2704"
    end

    on_arm do
      url "https://downloads.nebli.ai/cli/versions/v#{version}/nebli-linux-arm64.tar.gz"
      sha256 "3b91e100880232b02fdbcf3a2f9148ae230e1c05b68c29576b816ac8d2b1a36d"
    end
  end

  def install
    bin.install "nebli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/nebli --version")
  end
end
