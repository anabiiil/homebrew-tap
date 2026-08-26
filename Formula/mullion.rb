# Homebrew formula template for Mullion.
# The release workflow substitutes v1.6.0, 1.6.0, 142a6b32442e1a4567180ca123ed38df154d33c9bdcc50a8aada6b74305c0d58, aaa05c8f995029129a364ab21a897d8d4e34acef0d4ec6333dd3a3ba66988f81
# and pushes the result to the anabiiil/homebrew-tap repository as
# Formula/mullion.rb — do not edit the generated copy by hand.
class Mullion < Formula
  desc "PHP version manager & local dev server (Caddy, MySQL, .test domains, HTTPS)"
  homepage "https://github.com/anabiiil/mullion"
  version "1.6.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/anabiiil/mullion/releases/download/v1.6.0/mullion-v1.6.0-darwin-arm64.tar.gz"
      sha256 "142a6b32442e1a4567180ca123ed38df154d33c9bdcc50a8aada6b74305c0d58"
    else
      url "https://github.com/anabiiil/mullion/releases/download/v1.6.0/mullion-v1.6.0-darwin-amd64.tar.gz"
      sha256 "aaa05c8f995029129a364ab21a897d8d4e34acef0d4ec6333dd3a3ba66988f81"
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
