# Homebrew formula template for Transom.
# The release workflow substitutes v0.1.0, 0.1.0, 9353b40822a1898ee41e30a7a0d91e85b5bf19de21d443db6b864320e1118207, 0e2c604443cac180d24a59a1b7545c6fc45b8a9f359f523c062a75dea06f25aa
# and pushes the result to the anabiiil/homebrew-tap repository as
# Formula/transom.rb — do not edit the generated copy by hand.
class Transom < Formula
  desc "Careful disk cleaner for macOS"
  homepage "https://github.com/anabiiil/transom"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/anabiiil/transom/releases/download/v0.1.0/transom-v0.1.0-darwin-arm64.tar.gz"
      sha256 "9353b40822a1898ee41e30a7a0d91e85b5bf19de21d443db6b864320e1118207"
    else
      url "https://github.com/anabiiil/transom/releases/download/v0.1.0/transom-v0.1.0-darwin-amd64.tar.gz"
      sha256 "0e2c604443cac180d24a59a1b7545c6fc45b8a9f359f523c062a75dea06f25aa"
    end
  end

  def install
    bin.install "transom"
  end

  def caveats
    <<~EOS
      Install the native Transom.app (opens the control panel in its own
      window) with:
        transom app install
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/transom version")
  end
end
