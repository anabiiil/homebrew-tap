# Homebrew formula template for Mullion.
# The release workflow substitutes v1.5.5, 1.5.5, a9ebf75e404d194a093ebaa3c3f5787aa7cb3b7dbff2cb0fe1b4c3ecfa4aabf1, b9802cf5aadfab8585cbc85b47bbeb88826e73fd73fc06cc9344b8aeefc21acd
# and pushes the result to the anabiiil/homebrew-tap repository as
# Formula/mullion.rb — do not edit the generated copy by hand.
class Mullion < Formula
  desc "PHP version manager & local dev server (Caddy, MySQL, .test domains, HTTPS)"
  homepage "https://github.com/anabiiil/mullion"
  version "1.5.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/anabiiil/mullion/releases/download/v1.5.5/mullion-v1.5.5-darwin-arm64.tar.gz"
      sha256 "a9ebf75e404d194a093ebaa3c3f5787aa7cb3b7dbff2cb0fe1b4c3ecfa4aabf1"
    else
      url "https://github.com/anabiiil/mullion/releases/download/v1.5.5/mullion-v1.5.5-darwin-amd64.tar.gz"
      sha256 "b9802cf5aadfab8585cbc85b47bbeb88826e73fd73fc06cc9344b8aeefc21acd"
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
