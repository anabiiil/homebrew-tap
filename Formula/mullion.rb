# Homebrew formula template for Mullion.
# The release workflow substitutes v2.3.0, 2.3.0, 6b4fbf4d59c012e90d51b7220785adb3ab78d631c38537bb54d440edfa5be804, da7a39568d29a70873b20835d16df10c74d179d7e342c3ca734488fc600619e7
# and pushes the result to the anabiiil/homebrew-tap repository as
# Formula/mullion.rb — do not edit the generated copy by hand.
class Mullion < Formula
  desc "PHP version manager & local dev server (Caddy, MySQL, .test domains, HTTPS)"
  homepage "https://github.com/anabiiil/mullion"
  version "2.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/anabiiil/mullion/releases/download/v2.3.0/mullion-v2.3.0-darwin-arm64.tar.gz"
      sha256 "6b4fbf4d59c012e90d51b7220785adb3ab78d631c38537bb54d440edfa5be804"
    else
      url "https://github.com/anabiiil/mullion/releases/download/v2.3.0/mullion-v2.3.0-darwin-amd64.tar.gz"
      sha256 "da7a39568d29a70873b20835d16df10c74d179d7e342c3ca734488fc600619e7"
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
