# Homebrew formula template for Mullion.
# The release workflow substitutes v1.4.1, 1.4.1, 49870c7236b66b27ec08e1ef54078d585361473a10a08e4b1684b0bfef7de1f3, dec84589a2d3a95b9b90f0371b06dd635f476cb17b6573de615442bf2d9085a2
# and pushes the result to the anabiiil/homebrew-tap repository as
# Formula/mullion.rb — do not edit the generated copy by hand.
class Mullion < Formula
  desc "PHP version manager & local dev server (Caddy, MySQL, .test domains, HTTPS)"
  homepage "https://github.com/anabiiil/mullion"
  version "1.4.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/anabiiil/mullion/releases/download/v1.4.1/mullion-v1.4.1-darwin-arm64.tar.gz"
      sha256 "49870c7236b66b27ec08e1ef54078d585361473a10a08e4b1684b0bfef7de1f3"
    else
      url "https://github.com/anabiiil/mullion/releases/download/v1.4.1/mullion-v1.4.1-darwin-amd64.tar.gz"
      sha256 "dec84589a2d3a95b9b90f0371b06dd635f476cb17b6573de615442bf2d9085a2"
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
