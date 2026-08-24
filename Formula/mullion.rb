# Homebrew formula template for Mullion.
# The release workflow substitutes v1.5.10, 1.5.10, b872fd034ee2d0deaf583de12d3e10b55afa50e30844a9e463f7a5e2c359cb6d, 3bf6ea946db89ae88c3952ba4804756522ae6c1646f5e6bf4bd0b2ba1e1ac409
# and pushes the result to the anabiiil/homebrew-tap repository as
# Formula/mullion.rb — do not edit the generated copy by hand.
class Mullion < Formula
  desc "PHP version manager & local dev server (Caddy, MySQL, .test domains, HTTPS)"
  homepage "https://github.com/anabiiil/mullion"
  version "1.5.10"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/anabiiil/mullion/releases/download/v1.5.10/mullion-v1.5.10-darwin-arm64.tar.gz"
      sha256 "b872fd034ee2d0deaf583de12d3e10b55afa50e30844a9e463f7a5e2c359cb6d"
    else
      url "https://github.com/anabiiil/mullion/releases/download/v1.5.10/mullion-v1.5.10-darwin-amd64.tar.gz"
      sha256 "3bf6ea946db89ae88c3952ba4804756522ae6c1646f5e6bf4bd0b2ba1e1ac409"
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
