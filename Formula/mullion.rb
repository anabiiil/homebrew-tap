# Homebrew formula template for Mullion.
# The release workflow substitutes v1.2.4, 1.2.4, 573661c4a641a60bd8aa646f31d089bee9009e3971e57803d6ccb740d44a0aa2, 2ca5ba6cf3c6b9e8fa47d7adeba60318a69f87543b32f933f4d70aae1d3726c8
# and pushes the result to the anabiiil/homebrew-tap repository as
# Formula/mullion.rb — do not edit the generated copy by hand.
class Mullion < Formula
  desc "PHP version manager & local dev server (Caddy, MySQL, .test domains, HTTPS)"
  homepage "https://github.com/anabiiil/mullion"
  version "1.2.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/anabiiil/mullion/releases/download/v1.2.4/mullion-v1.2.4-darwin-arm64.tar.gz"
      sha256 "573661c4a641a60bd8aa646f31d089bee9009e3971e57803d6ccb740d44a0aa2"
    else
      url "https://github.com/anabiiil/mullion/releases/download/v1.2.4/mullion-v1.2.4-darwin-amd64.tar.gz"
      sha256 "2ca5ba6cf3c6b9e8fa47d7adeba60318a69f87543b32f933f4d70aae1d3726c8"
    end
  end

  def install
    bin.install "mullion"
  end

  def caveats
    <<~EOS
      Set up the full stack (Caddy, latest PHP, Composer, MySQL, phpMyAdmin) with:
        mullion setup
      Then open a NEW terminal so the PATH changes take effect.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mullion --version")
  end
end
