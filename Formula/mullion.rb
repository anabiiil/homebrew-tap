# Homebrew formula template for Mullion.
# The release workflow substitutes v1.7.1, 1.7.1, b46277c86ec9ec86e04124ec5b4df16c477c97b41cc8ac5a79ef9bae9d1988a7, e3ff55e6d7ef8e82e3242864c9ca3599f01f36e751ff22ec4fb322e486773606
# and pushes the result to the anabiiil/homebrew-tap repository as
# Formula/mullion.rb — do not edit the generated copy by hand.
class Mullion < Formula
  desc "PHP version manager & local dev server (Caddy, MySQL, .test domains, HTTPS)"
  homepage "https://github.com/anabiiil/mullion"
  version "1.7.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/anabiiil/mullion/releases/download/v1.7.1/mullion-v1.7.1-darwin-arm64.tar.gz"
      sha256 "b46277c86ec9ec86e04124ec5b4df16c477c97b41cc8ac5a79ef9bae9d1988a7"
    else
      url "https://github.com/anabiiil/mullion/releases/download/v1.7.1/mullion-v1.7.1-darwin-amd64.tar.gz"
      sha256 "e3ff55e6d7ef8e82e3242864c9ca3599f01f36e751ff22ec4fb322e486773606"
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
