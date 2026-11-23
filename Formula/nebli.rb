# This file is the SOURCE TEMPLATE. The rendered formula is committed to
# neblihq/homebrew-hover:Formula/nebli.rb by the "Homebrew bump" step in
# .github/workflows/release.yml on each prod-v* tag push. The tap repo is named
# `homebrew-hover` so `brew tap neblihq/hover` resolves it with no explicit URL.
#
# Binaries are served from S3/CloudFront (downloads.nebli.ai/cli/...),
# NOT GitHub releases — the tap repo holds ONLY this formula now.
class Nebli < Formula
  desc "Drone relay CLI for Nebli"
  homepage "https://nebli.ai"
  version "1.2.1"

  on_macos do
    # The darwin binaries need macOS 14 (their minos): brew stops on an older
    # Mac instead of installing a binary that will not load.
    depends_on macos: :sonoma

    on_arm do
      url "https://downloads.nebli.ai/cli/versions/v#{version}/nebli-darwin-arm64.tar.gz"
      sha256 "92fb4079c7a1c71a82438ae4e62933882b07d67163fe639c2e12eb965cc74e1a"
    end

    on_intel do
      url "https://downloads.nebli.ai/cli/versions/v#{version}/nebli-darwin-amd64.tar.gz"
      sha256 "02c596943d6dcd336069148cbb1a872ebeb7fe90e5a23eb87fab25a7ef691776"
    end
  end

  on_linux do
    on_intel do
      url "https://downloads.nebli.ai/cli/versions/v#{version}/nebli-linux-amd64.tar.gz"
      sha256 "89e420cf61c8054d075c3e886b7f026c9fcf33e4d1ceea99c8a98a1245d09b2d"
    end

    on_arm do
      url "https://downloads.nebli.ai/cli/versions/v#{version}/nebli-linux-arm64.tar.gz"
      sha256 "1eda809769b417b7b0c3a7b4c1e8c85e34dfd61447cde7d8070bf2b486c7c2a6"
    end
  end

  def install
    bin.install "nebli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/nebli --version")
  end
end
