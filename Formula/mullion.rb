# Homebrew formula template for Mullion.
# The release workflow substitutes v2.1.0, 2.1.0, 1fae70260c15a76ba5c846af11ba5bee5f7ba0f12500122c1246fb3dcf81e7b8, dc80ded90e6b9396891f41d32b07cf5d9873752b5dd5f5460b676a54a74416b4
# and pushes the result to the anabiiil/homebrew-tap repository as
# Formula/mullion.rb — do not edit the generated copy by hand.
class Mullion < Formula
  desc "PHP version manager & local dev server (Caddy, MySQL, .test domains, HTTPS)"
  homepage "https://github.com/anabiiil/mullion"
  version "2.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/anabiiil/mullion/releases/download/v2.1.0/mullion-v2.1.0-darwin-arm64.tar.gz"
      sha256 "1fae70260c15a76ba5c846af11ba5bee5f7ba0f12500122c1246fb3dcf81e7b8"
    else
      url "https://github.com/anabiiil/mullion/releases/download/v2.1.0/mullion-v2.1.0-darwin-amd64.tar.gz"
      sha256 "dc80ded90e6b9396891f41d32b07cf5d9873752b5dd5f5460b676a54a74416b4"
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
