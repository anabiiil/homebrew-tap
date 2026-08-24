# Homebrew formula template for Mullion.
# The release workflow substitutes v1.5.8, 1.5.8, 8e7b799323d43b8d328fa25c187e06764aa556044244a0bbf72762c81a17a04d, c72f4ec6ab327f37820a14af7b5a8a702626e0435d0aecf253ce65c06e3c213d
# and pushes the result to the anabiiil/homebrew-tap repository as
# Formula/mullion.rb — do not edit the generated copy by hand.
class Mullion < Formula
  desc "PHP version manager & local dev server (Caddy, MySQL, .test domains, HTTPS)"
  homepage "https://github.com/anabiiil/mullion"
  version "1.5.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/anabiiil/mullion/releases/download/v1.5.8/mullion-v1.5.8-darwin-arm64.tar.gz"
      sha256 "8e7b799323d43b8d328fa25c187e06764aa556044244a0bbf72762c81a17a04d"
    else
      url "https://github.com/anabiiil/mullion/releases/download/v1.5.8/mullion-v1.5.8-darwin-amd64.tar.gz"
      sha256 "c72f4ec6ab327f37820a14af7b5a8a702626e0435d0aecf253ce65c06e3c213d"
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
