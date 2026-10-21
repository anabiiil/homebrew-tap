# Homebrew formula template for Mullion.
# The release workflow substitutes v2.2.0, 2.2.0, 56f57c131b3cc6c2656f1130d8c086a455bd3ac874ed2ef66e784287f6e0d045, 75979a5cc69edf4b8c8dc163fc4f5a4cfda22da33575434776538d6bfcacd883
# and pushes the result to the anabiiil/homebrew-tap repository as
# Formula/mullion.rb — do not edit the generated copy by hand.
class Mullion < Formula
  desc "PHP version manager & local dev server (Caddy, MySQL, .test domains, HTTPS)"
  homepage "https://github.com/anabiiil/mullion"
  version "2.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/anabiiil/mullion/releases/download/v2.2.0/mullion-v2.2.0-darwin-arm64.tar.gz"
      sha256 "56f57c131b3cc6c2656f1130d8c086a455bd3ac874ed2ef66e784287f6e0d045"
    else
      url "https://github.com/anabiiil/mullion/releases/download/v2.2.0/mullion-v2.2.0-darwin-amd64.tar.gz"
      sha256 "75979a5cc69edf4b8c8dc163fc4f5a4cfda22da33575434776538d6bfcacd883"
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
