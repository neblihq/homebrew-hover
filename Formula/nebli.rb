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
  version "0.1.317"

  on_macos do
    on_arm do
      url "https://downloads.nebli.ai/cli/versions/v#{version}/nebli-darwin-arm64.tar.gz"
      sha256 "02a9ca8ad348707ba245a5b7c7250d818d926d9ef7c15fa46db28beeb327e0f7"
    end

    on_intel do
      url "https://downloads.nebli.ai/cli/versions/v#{version}/nebli-darwin-amd64.tar.gz"
      sha256 "536c97314bd1e245d604626819a7458081fa51c053b9d1c58d8730792aa095dc"
    end
  end

  on_linux do
    on_intel do
      url "https://downloads.nebli.ai/cli/versions/v#{version}/nebli-linux-amd64.tar.gz"
      sha256 "34a15c806322863077ce7f095020a3207cafa6a6f0ec02833a456891a5797faa"
    end

    on_arm do
      url "https://downloads.nebli.ai/cli/versions/v#{version}/nebli-linux-arm64.tar.gz"
      sha256 "d69d35678680aa83ae7d196c5ea3b660d591f6511addb6f1132f2a4b62623c41"
    end
  end

  def install
    bin.install "nebli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/nebli --version")
  end
end
