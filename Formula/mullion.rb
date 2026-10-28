# Homebrew formula template for Mullion.
# The release workflow substitutes v2.5.0, 2.5.0, 24fe88c7fa0011115eae202cf36b097464003d43cdfc772c70ce1e174d27be7d, 8828deaec96e104dc5adac5bb475ea7eb3c8916a916c6384a9931c8c1900888d
# and pushes the result to the anabiiil/homebrew-tap repository as
# Formula/mullion.rb — do not edit the generated copy by hand.
class Mullion < Formula
  desc "PHP version manager & local dev server (Caddy, MySQL, .test domains, HTTPS)"
  homepage "https://github.com/anabiiil/mullion"
  version "2.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/anabiiil/mullion/releases/download/v2.5.0/mullion-v2.5.0-darwin-arm64.tar.gz"
      sha256 "24fe88c7fa0011115eae202cf36b097464003d43cdfc772c70ce1e174d27be7d"
    else
      url "https://github.com/anabiiil/mullion/releases/download/v2.5.0/mullion-v2.5.0-darwin-amd64.tar.gz"
      sha256 "8828deaec96e104dc5adac5bb475ea7eb3c8916a916c6384a9931c8c1900888d"
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
