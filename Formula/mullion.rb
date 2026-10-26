# Homebrew formula template for Mullion.
# The release workflow substitutes v2.3.1, 2.3.1, 76b4e6ea63aaed4b0444fd8b6bda0ce12631bc5478c79e1eafb72199c3063337, 0344d8ad1504b3a5acd3928e5356ea25d2e6e50b1872f3bc7af8f859d81c9116
# and pushes the result to the anabiiil/homebrew-tap repository as
# Formula/mullion.rb — do not edit the generated copy by hand.
class Mullion < Formula
  desc "PHP version manager & local dev server (Caddy, MySQL, .test domains, HTTPS)"
  homepage "https://github.com/anabiiil/mullion"
  version "2.3.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/anabiiil/mullion/releases/download/v2.3.1/mullion-v2.3.1-darwin-arm64.tar.gz"
      sha256 "76b4e6ea63aaed4b0444fd8b6bda0ce12631bc5478c79e1eafb72199c3063337"
    else
      url "https://github.com/anabiiil/mullion/releases/download/v2.3.1/mullion-v2.3.1-darwin-amd64.tar.gz"
      sha256 "0344d8ad1504b3a5acd3928e5356ea25d2e6e50b1872f3bc7af8f859d81c9116"
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
