# Homebrew formula template for Mullion.
# The release workflow substitutes v1.5.7, 1.5.7, 992bae5b8bbdf8d605b9455a82e9221ca619f08e1d34c665b1f077113977104d, a831f41ed2063393610f448babfbd4370de57f93b38fc11f1fbfd44fd1f6d866
# and pushes the result to the anabiiil/homebrew-tap repository as
# Formula/mullion.rb — do not edit the generated copy by hand.
class Mullion < Formula
  desc "PHP version manager & local dev server (Caddy, MySQL, .test domains, HTTPS)"
  homepage "https://github.com/anabiiil/mullion"
  version "1.5.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/anabiiil/mullion/releases/download/v1.5.7/mullion-v1.5.7-darwin-arm64.tar.gz"
      sha256 "992bae5b8bbdf8d605b9455a82e9221ca619f08e1d34c665b1f077113977104d"
    else
      url "https://github.com/anabiiil/mullion/releases/download/v1.5.7/mullion-v1.5.7-darwin-amd64.tar.gz"
      sha256 "a831f41ed2063393610f448babfbd4370de57f93b38fc11f1fbfd44fd1f6d866"
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
