# Homebrew formula template for Mullion.
# The release workflow substitutes v1.2.2, 1.2.2, 6e85140c7085c2795c15f4e285b3e88347142a72340ca2666165ac68dedbe9a7, 8bd3c0eeca76dc8f5eb7db509b842f71e30c98628f754e0197535bb9d2823fd4
# and pushes the result to the anabiiil/homebrew-tap repository as
# Formula/mullion.rb — do not edit the generated copy by hand.
class Mullion < Formula
  desc "PHP version manager & local dev server (Caddy, MySQL, .test domains, HTTPS)"
  homepage "https://github.com/anabiiil/mullion"
  version "1.2.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/anabiiil/mullion/releases/download/v1.2.2/mullion-v1.2.2-darwin-arm64.tar.gz"
      sha256 "6e85140c7085c2795c15f4e285b3e88347142a72340ca2666165ac68dedbe9a7"
    else
      url "https://github.com/anabiiil/mullion/releases/download/v1.2.2/mullion-v1.2.2-darwin-amd64.tar.gz"
      sha256 "8bd3c0eeca76dc8f5eb7db509b842f71e30c98628f754e0197535bb9d2823fd4"
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
