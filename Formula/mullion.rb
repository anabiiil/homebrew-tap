# Homebrew formula template for Mullion.
# The release workflow substitutes v1.2.0, 1.2.0, 34419cb4f2a02649d05ff6191da360ec5d19eb5c0e9acd9900e8b8718abf2366, cc21c761cb62550c4b9f6e909863316f809c6cd8807cb52a99b5898b4d8a8a4b
# and pushes the result to the anabiiil/homebrew-tap repository as
# Formula/mullion.rb — do not edit the generated copy by hand.
class Mullion < Formula
  desc "PHP version manager & local dev server (Caddy, MySQL, .test domains, HTTPS)"
  homepage "https://github.com/anabiiil/mullion"
  version "1.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/anabiiil/mullion/releases/download/v1.2.0/mullion-v1.2.0-darwin-arm64.tar.gz"
      sha256 "34419cb4f2a02649d05ff6191da360ec5d19eb5c0e9acd9900e8b8718abf2366"
    else
      url "https://github.com/anabiiil/mullion/releases/download/v1.2.0/mullion-v1.2.0-darwin-amd64.tar.gz"
      sha256 "cc21c761cb62550c4b9f6e909863316f809c6cd8807cb52a99b5898b4d8a8a4b"
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
