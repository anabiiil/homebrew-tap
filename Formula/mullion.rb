# Homebrew formula template for Mullion.
# The release workflow substitutes v2.4.0, 2.4.0, 8e5fa815eaa84b743b7f1e9eb97e6f8044036f07732e572d95da1ade5385ee86, 60e77852f1a077c04e4362a0fd6848d2540d3b97e83d21bb802962dc7362bdfc
# and pushes the result to the anabiiil/homebrew-tap repository as
# Formula/mullion.rb — do not edit the generated copy by hand.
class Mullion < Formula
  desc "PHP version manager & local dev server (Caddy, MySQL, .test domains, HTTPS)"
  homepage "https://github.com/anabiiil/mullion"
  version "2.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/anabiiil/mullion/releases/download/v2.4.0/mullion-v2.4.0-darwin-arm64.tar.gz"
      sha256 "8e5fa815eaa84b743b7f1e9eb97e6f8044036f07732e572d95da1ade5385ee86"
    else
      url "https://github.com/anabiiil/mullion/releases/download/v2.4.0/mullion-v2.4.0-darwin-amd64.tar.gz"
      sha256 "60e77852f1a077c04e4362a0fd6848d2540d3b97e83d21bb802962dc7362bdfc"
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
