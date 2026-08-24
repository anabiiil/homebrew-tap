# Homebrew formula template for Mullion.
# The release workflow substitutes v1.4.0, 1.4.0, 23b3c9ac5156c1c0cba390f175224d66548ae60bddebd6af67cb155d40ba82ae, a5d6af1fc461f019a7d7661552f154eb756d7affc0e9ed5a9a4bec62c32e927e
# and pushes the result to the anabiiil/homebrew-tap repository as
# Formula/mullion.rb — do not edit the generated copy by hand.
class Mullion < Formula
  desc "PHP version manager & local dev server (Caddy, MySQL, .test domains, HTTPS)"
  homepage "https://github.com/anabiiil/mullion"
  version "1.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/anabiiil/mullion/releases/download/v1.4.0/mullion-v1.4.0-darwin-arm64.tar.gz"
      sha256 "23b3c9ac5156c1c0cba390f175224d66548ae60bddebd6af67cb155d40ba82ae"
    else
      url "https://github.com/anabiiil/mullion/releases/download/v1.4.0/mullion-v1.4.0-darwin-amd64.tar.gz"
      sha256 "a5d6af1fc461f019a7d7661552f154eb756d7affc0e9ed5a9a4bec62c32e927e"
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
