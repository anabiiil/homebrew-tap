# Homebrew formula template for Mullion.
# The release workflow substitutes v1.5.3, 1.5.3, 563797dd75baf35dad23c247931c13ea69ef57ded3fdba3051760b5c99fdb83d, e45ebcd1380f32a3e9e59b2b55fe3024206bd18e1228786fb0cda087f4d6a54a
# and pushes the result to the anabiiil/homebrew-tap repository as
# Formula/mullion.rb — do not edit the generated copy by hand.
class Mullion < Formula
  desc "PHP version manager & local dev server (Caddy, MySQL, .test domains, HTTPS)"
  homepage "https://github.com/anabiiil/mullion"
  version "1.5.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/anabiiil/mullion/releases/download/v1.5.3/mullion-v1.5.3-darwin-arm64.tar.gz"
      sha256 "563797dd75baf35dad23c247931c13ea69ef57ded3fdba3051760b5c99fdb83d"
    else
      url "https://github.com/anabiiil/mullion/releases/download/v1.5.3/mullion-v1.5.3-darwin-amd64.tar.gz"
      sha256 "e45ebcd1380f32a3e9e59b2b55fe3024206bd18e1228786fb0cda087f4d6a54a"
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
