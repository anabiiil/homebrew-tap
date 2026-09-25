# Homebrew formula template for Mullion.
# The release workflow substitutes v2.0.0, 2.0.0, c3c9457483a97da8402925010d7dcfaeef768f807d85fb0578c04ba26efe9120, a6cdafbd5780a39492f337d2c93446bb342009bcb7d242b7c8655735a2423609
# and pushes the result to the anabiiil/homebrew-tap repository as
# Formula/mullion.rb — do not edit the generated copy by hand.
class Mullion < Formula
  desc "PHP version manager & local dev server (Caddy, MySQL, .test domains, HTTPS)"
  homepage "https://github.com/anabiiil/mullion"
  version "2.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/anabiiil/mullion/releases/download/v2.0.0/mullion-v2.0.0-darwin-arm64.tar.gz"
      sha256 "c3c9457483a97da8402925010d7dcfaeef768f807d85fb0578c04ba26efe9120"
    else
      url "https://github.com/anabiiil/mullion/releases/download/v2.0.0/mullion-v2.0.0-darwin-amd64.tar.gz"
      sha256 "a6cdafbd5780a39492f337d2c93446bb342009bcb7d242b7c8655735a2423609"
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
