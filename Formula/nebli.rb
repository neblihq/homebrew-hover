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
  version "1.2.0"

  on_macos do
    # The darwin binaries need macOS 14 (their minos): brew stops on an older
    # Mac instead of installing a binary that will not load.
    depends_on macos: :sonoma

    on_arm do
      url "https://downloads.nebli.ai/cli/versions/v#{version}/nebli-darwin-arm64.tar.gz"
      sha256 "6bf2386980303f494ff36872ff6ed48d82665b37cbf392ab558725677ff4e7dd"
    end

    on_intel do
      url "https://downloads.nebli.ai/cli/versions/v#{version}/nebli-darwin-amd64.tar.gz"
      sha256 "aa8ae837c5df9b1a464e60b0d59d8ba8e5c1b05dbd24531379fd134fd9672bd4"
    end
  end

  on_linux do
    on_intel do
      url "https://downloads.nebli.ai/cli/versions/v#{version}/nebli-linux-amd64.tar.gz"
      sha256 "dd922bc7e541be051c3d774cf1dd9a0005623705c9b8c9b7b20f61e4dc83bf05"
    end

    on_arm do
      url "https://downloads.nebli.ai/cli/versions/v#{version}/nebli-linux-arm64.tar.gz"
      sha256 "da15fbcf63596a0b6d9a3856b2f48f830f352e55169398126b6ee606e07af336"
    end
  end

  def install
    bin.install "nebli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/nebli --version")
  end
end
