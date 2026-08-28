# Homebrew formula template for Mullion.
# The release workflow substitutes v1.7.2, 1.7.2, 77b85c63b731b822173307e650a1e24d415c4a75b0da56848f31410bb94236dd, d195669d83c9d91a5b234d89891eab83a12d606293c6c49be680f905e09cc66d
# and pushes the result to the anabiiil/homebrew-tap repository as
# Formula/mullion.rb — do not edit the generated copy by hand.
class Mullion < Formula
  desc "PHP version manager & local dev server (Caddy, MySQL, .test domains, HTTPS)"
  homepage "https://github.com/anabiiil/mullion"
  version "1.7.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/anabiiil/mullion/releases/download/v1.7.2/mullion-v1.7.2-darwin-arm64.tar.gz"
      sha256 "77b85c63b731b822173307e650a1e24d415c4a75b0da56848f31410bb94236dd"
    else
      url "https://github.com/anabiiil/mullion/releases/download/v1.7.2/mullion-v1.7.2-darwin-amd64.tar.gz"
      sha256 "d195669d83c9d91a5b234d89891eab83a12d606293c6c49be680f905e09cc66d"
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
