# Homebrew formula template for Mullion.
# The release workflow substitutes v2.1.1, 2.1.1, c03e1fd2ba9c76606cbf04f79c4b1b25886ad8233bb63111a73f920f0ba0c2f6, 8290a9d52d2dbc9f1ccca840dc778881b8ec794b7aabcc1e632edc9d13f78f88
# and pushes the result to the anabiiil/homebrew-tap repository as
# Formula/mullion.rb — do not edit the generated copy by hand.
class Mullion < Formula
  desc "PHP version manager & local dev server (Caddy, MySQL, .test domains, HTTPS)"
  homepage "https://github.com/anabiiil/mullion"
  version "2.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/anabiiil/mullion/releases/download/v2.1.1/mullion-v2.1.1-darwin-arm64.tar.gz"
      sha256 "c03e1fd2ba9c76606cbf04f79c4b1b25886ad8233bb63111a73f920f0ba0c2f6"
    else
      url "https://github.com/anabiiil/mullion/releases/download/v2.1.1/mullion-v2.1.1-darwin-amd64.tar.gz"
      sha256 "8290a9d52d2dbc9f1ccca840dc778881b8ec794b7aabcc1e632edc9d13f78f88"
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
