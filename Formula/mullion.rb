# Homebrew formula template for Mullion.
# The release workflow substitutes v1.3.0, 1.3.0, d4b5443762a45bb00796bfdb633884d255e56c985c01902985316fa26f4e01d3, 25dd631d98b5930e537509f2bc5a509b79bded698c92b20e01e64758b8cffe80
# and pushes the result to the anabiiil/homebrew-tap repository as
# Formula/mullion.rb — do not edit the generated copy by hand.
class Mullion < Formula
  desc "PHP version manager & local dev server (Caddy, MySQL, .test domains, HTTPS)"
  homepage "https://github.com/anabiiil/mullion"
  version "1.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/anabiiil/mullion/releases/download/v1.3.0/mullion-v1.3.0-darwin-arm64.tar.gz"
      sha256 "d4b5443762a45bb00796bfdb633884d255e56c985c01902985316fa26f4e01d3"
    else
      url "https://github.com/anabiiil/mullion/releases/download/v1.3.0/mullion-v1.3.0-darwin-amd64.tar.gz"
      sha256 "25dd631d98b5930e537509f2bc5a509b79bded698c92b20e01e64758b8cffe80"
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
