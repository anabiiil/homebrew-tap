# Homebrew formula template for Mullion.
# The release workflow substitutes v1.7.3, 1.7.3, 9f78fffd2942871872209936bebe9cdf776600d4ed8636325b69b9094746b828, c408ef2934d9f9d8271c0ccf4600b4e46c5fa35ea103ed871ad85a7df4401ff0
# and pushes the result to the anabiiil/homebrew-tap repository as
# Formula/mullion.rb — do not edit the generated copy by hand.
class Mullion < Formula
  desc "PHP version manager & local dev server (Caddy, MySQL, .test domains, HTTPS)"
  homepage "https://github.com/anabiiil/mullion"
  version "1.7.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/anabiiil/mullion/releases/download/v1.7.3/mullion-v1.7.3-darwin-arm64.tar.gz"
      sha256 "9f78fffd2942871872209936bebe9cdf776600d4ed8636325b69b9094746b828"
    else
      url "https://github.com/anabiiil/mullion/releases/download/v1.7.3/mullion-v1.7.3-darwin-amd64.tar.gz"
      sha256 "c408ef2934d9f9d8271c0ccf4600b4e46c5fa35ea103ed871ad85a7df4401ff0"
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
