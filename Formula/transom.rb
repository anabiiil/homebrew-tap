# Homebrew formula template for Transom.
# The release workflow substitutes v0.1.1, 0.1.1, 1a3443eb9580aea16cdd7ea884f71f6052715937cf7be8f0c63680db4915dfa3, c2c343253d5d36ed048cf728229803e6555fe8ccb1746c6b25874e06ee9e75c2
# and pushes the result to the anabiiil/homebrew-tap repository as
# Formula/transom.rb — do not edit the generated copy by hand.
class Transom < Formula
  desc "Careful disk cleaner for macOS"
  homepage "https://github.com/anabiiil/transom"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/anabiiil/transom/releases/download/v0.1.1/transom-v0.1.1-darwin-arm64.tar.gz"
      sha256 "1a3443eb9580aea16cdd7ea884f71f6052715937cf7be8f0c63680db4915dfa3"
    else
      url "https://github.com/anabiiil/transom/releases/download/v0.1.1/transom-v0.1.1-darwin-amd64.tar.gz"
      sha256 "c2c343253d5d36ed048cf728229803e6555fe8ccb1746c6b25874e06ee9e75c2"
    end
  end

  def install
    bin.install "transom"
  end

  def caveats
    <<~EOS
      Run `transom ui` — the first run installs Transom.app into
      /Applications.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/transom version")
  end
end
