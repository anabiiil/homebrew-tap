# Homebrew formula template for Mullion.
# The release workflow substitutes v1.2.1, 1.2.1, d1713de52e6a892f86e9a41ece1ba7e9ba2bbe69e12cb2917fe87d8bc537785e, e986b9d8dda6a07815728dd1b8febe46b8abfe2696b02266d03704f1141ed0ca
# and pushes the result to the anabiiil/homebrew-tap repository as
# Formula/mullion.rb — do not edit the generated copy by hand.
class Mullion < Formula
  desc "PHP version manager & local dev server (Caddy, MySQL, .test domains, HTTPS)"
  homepage "https://github.com/anabiiil/mullion"
  version "1.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/anabiiil/mullion/releases/download/v1.2.1/mullion-v1.2.1-darwin-arm64.tar.gz"
      sha256 "d1713de52e6a892f86e9a41ece1ba7e9ba2bbe69e12cb2917fe87d8bc537785e"
    else
      url "https://github.com/anabiiil/mullion/releases/download/v1.2.1/mullion-v1.2.1-darwin-amd64.tar.gz"
      sha256 "e986b9d8dda6a07815728dd1b8febe46b8abfe2696b02266d03704f1141ed0ca"
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
