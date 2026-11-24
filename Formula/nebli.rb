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
  version "1.3.1"

  on_macos do
    # The darwin binaries need macOS 14 (their minos): brew stops on an older
    # Mac instead of installing a binary that will not load.
    depends_on macos: :sonoma

    on_arm do
      url "https://downloads.nebli.ai/cli/versions/v#{version}/nebli-darwin-arm64.tar.gz"
      sha256 "110a6c1c530a63a3559ffaeb03632b1bf5400c8098531e2efd329b2a6554be5d"
    end

    on_intel do
      url "https://downloads.nebli.ai/cli/versions/v#{version}/nebli-darwin-amd64.tar.gz"
      sha256 "d6fe3d46f8e271c2add1b5dfb20234e1d96f6ba16c438502fbafa8ab1f8bda35"
    end
  end

  on_linux do
    on_intel do
      url "https://downloads.nebli.ai/cli/versions/v#{version}/nebli-linux-amd64.tar.gz"
      sha256 "fd120a39c3dbd0e22b5342c32f21449e12d04820d02526c59f26e4a66a9fa283"
    end

    on_arm do
      url "https://downloads.nebli.ai/cli/versions/v#{version}/nebli-linux-arm64.tar.gz"
      sha256 "78f5f246e49f02d0d072a90eaa6abbbbf464819ad860dea48e5803d1985f6daf"
    end
  end

  def install
    bin.install "nebli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/nebli --version")
  end
end
