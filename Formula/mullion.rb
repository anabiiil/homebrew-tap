# Homebrew formula template for Mullion.
# The release workflow substitutes v1.5.6, 1.5.6, df45d1c9bb256d56c8c0bebc8bc3048a2674a899d08325944a4d6f8b9791b91e, 0625a6deb5502b025594fa1238b0bbdd947af2d5c440b94657f69056def1849d
# and pushes the result to the anabiiil/homebrew-tap repository as
# Formula/mullion.rb — do not edit the generated copy by hand.
class Mullion < Formula
  desc "PHP version manager & local dev server (Caddy, MySQL, .test domains, HTTPS)"
  homepage "https://github.com/anabiiil/mullion"
  version "1.5.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/anabiiil/mullion/releases/download/v1.5.6/mullion-v1.5.6-darwin-arm64.tar.gz"
      sha256 "df45d1c9bb256d56c8c0bebc8bc3048a2674a899d08325944a4d6f8b9791b91e"
    else
      url "https://github.com/anabiiil/mullion/releases/download/v1.5.6/mullion-v1.5.6-darwin-amd64.tar.gz"
      sha256 "0625a6deb5502b025594fa1238b0bbdd947af2d5c440b94657f69056def1849d"
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
