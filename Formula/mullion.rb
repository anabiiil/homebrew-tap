# Homebrew formula template for Mullion.
# The release workflow substitutes v1.5.1, 1.5.1, b4712e1e780b894a3efcb4b442d8b6a1082ca2904e9641046c6980040a6d565d, 0347a041cc1918f33af9a2829ef0b0b9595dc1c37d2e6c3f7132553fdbeeb582
# and pushes the result to the anabiiil/homebrew-tap repository as
# Formula/mullion.rb — do not edit the generated copy by hand.
class Mullion < Formula
  desc "PHP version manager & local dev server (Caddy, MySQL, .test domains, HTTPS)"
  homepage "https://github.com/anabiiil/mullion"
  version "1.5.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/anabiiil/mullion/releases/download/v1.5.1/mullion-v1.5.1-darwin-arm64.tar.gz"
      sha256 "b4712e1e780b894a3efcb4b442d8b6a1082ca2904e9641046c6980040a6d565d"
    else
      url "https://github.com/anabiiil/mullion/releases/download/v1.5.1/mullion-v1.5.1-darwin-amd64.tar.gz"
      sha256 "0347a041cc1918f33af9a2829ef0b0b9595dc1c37d2e6c3f7132553fdbeeb582"
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
