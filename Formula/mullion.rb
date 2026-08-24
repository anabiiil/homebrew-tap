# Homebrew formula template for Mullion.
# The release workflow substitutes v1.5.4, 1.5.4, 64eaf7d543be3aab390e9029cded0c12c421c660098e24539aa6534c185780bb, d5014839364861e5c3b334729281da1ed5b475d184899326e0a5916a383a5944
# and pushes the result to the anabiiil/homebrew-tap repository as
# Formula/mullion.rb — do not edit the generated copy by hand.
class Mullion < Formula
  desc "PHP version manager & local dev server (Caddy, MySQL, .test domains, HTTPS)"
  homepage "https://github.com/anabiiil/mullion"
  version "1.5.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/anabiiil/mullion/releases/download/v1.5.4/mullion-v1.5.4-darwin-arm64.tar.gz"
      sha256 "64eaf7d543be3aab390e9029cded0c12c421c660098e24539aa6534c185780bb"
    else
      url "https://github.com/anabiiil/mullion/releases/download/v1.5.4/mullion-v1.5.4-darwin-amd64.tar.gz"
      sha256 "d5014839364861e5c3b334729281da1ed5b475d184899326e0a5916a383a5944"
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
