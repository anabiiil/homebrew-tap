# Homebrew formula template for Mullion.
# The release workflow substitutes v1.5.0, 1.5.0, f8e80aa8a3fc1b4de2689429838c016c18180c037c5f8b5c65f209865060d4cd, 24adf1711c095c2b1ed8f17a954f04968bf412f91289929e01b927b5992c3c85
# and pushes the result to the anabiiil/homebrew-tap repository as
# Formula/mullion.rb — do not edit the generated copy by hand.
class Mullion < Formula
  desc "PHP version manager & local dev server (Caddy, MySQL, .test domains, HTTPS)"
  homepage "https://github.com/anabiiil/mullion"
  version "1.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/anabiiil/mullion/releases/download/v1.5.0/mullion-v1.5.0-darwin-arm64.tar.gz"
      sha256 "f8e80aa8a3fc1b4de2689429838c016c18180c037c5f8b5c65f209865060d4cd"
    else
      url "https://github.com/anabiiil/mullion/releases/download/v1.5.0/mullion-v1.5.0-darwin-amd64.tar.gz"
      sha256 "24adf1711c095c2b1ed8f17a954f04968bf412f91289929e01b927b5992c3c85"
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
