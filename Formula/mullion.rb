# Homebrew formula template for Mullion.
# The release workflow substitutes v1.2.3, 1.2.3, 71752fd9dff5ee964f20974056ccd2f0855ae2516dcd92476c4a610a16115360, 9a4d0ed2cfa4da0383f91f149a5107d494f20e4556cb6d6d1a36ff617485a4ed
# and pushes the result to the anabiiil/homebrew-tap repository as
# Formula/mullion.rb — do not edit the generated copy by hand.
class Mullion < Formula
  desc "PHP version manager & local dev server (Caddy, MySQL, .test domains, HTTPS)"
  homepage "https://github.com/anabiiil/mullion"
  version "1.2.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/anabiiil/mullion/releases/download/v1.2.3/mullion-v1.2.3-darwin-arm64.tar.gz"
      sha256 "71752fd9dff5ee964f20974056ccd2f0855ae2516dcd92476c4a610a16115360"
    else
      url "https://github.com/anabiiil/mullion/releases/download/v1.2.3/mullion-v1.2.3-darwin-amd64.tar.gz"
      sha256 "9a4d0ed2cfa4da0383f91f149a5107d494f20e4556cb6d6d1a36ff617485a4ed"
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
