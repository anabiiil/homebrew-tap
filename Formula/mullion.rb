# Homebrew formula template for Mullion.
# The release workflow substitutes v1.5.2, 1.5.2, b41677865204321dc63a06aaf7f33708fc6df290871b3e77944f30694e4c9978, 22ac65c858c9e0d6d0f05af58fe46e629dfc487727b8b6763b9d5ac06f1a42e6
# and pushes the result to the anabiiil/homebrew-tap repository as
# Formula/mullion.rb — do not edit the generated copy by hand.
class Mullion < Formula
  desc "PHP version manager & local dev server (Caddy, MySQL, .test domains, HTTPS)"
  homepage "https://github.com/anabiiil/mullion"
  version "1.5.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/anabiiil/mullion/releases/download/v1.5.2/mullion-v1.5.2-darwin-arm64.tar.gz"
      sha256 "b41677865204321dc63a06aaf7f33708fc6df290871b3e77944f30694e4c9978"
    else
      url "https://github.com/anabiiil/mullion/releases/download/v1.5.2/mullion-v1.5.2-darwin-amd64.tar.gz"
      sha256 "22ac65c858c9e0d6d0f05af58fe46e629dfc487727b8b6763b9d5ac06f1a42e6"
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
