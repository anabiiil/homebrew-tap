# Homebrew cask template for Transom's prebuilt macOS CLI.
# The release workflow substitutes v0.1.1, 0.1.1, 1a3443eb9580aea16cdd7ea884f71f6052715937cf7be8f0c63680db4915dfa3, c2c343253d5d36ed048cf728229803e6555fe8ccb1746c6b25874e06ee9e75c2
# and pushes the result to the anabiiil/homebrew-tap repository as
# Casks/transom.rb — do not edit the generated copy by hand.
# A cask installs the binary directly, without formula source-build checks
# that require a current Xcode/Command Line Tools toolchain on the user's Mac.
cask "transom" do
  arch arm: "arm64", intel: "amd64"

  version "0.1.1"
  sha256 arm:   "1a3443eb9580aea16cdd7ea884f71f6052715937cf7be8f0c63680db4915dfa3",
         intel: "c2c343253d5d36ed048cf728229803e6555fe8ccb1746c6b25874e06ee9e75c2"

  url "https://github.com/anabiiil/transom/releases/download/v0.1.1/transom-v0.1.1-darwin-#{arch}.tar.gz"
  name "Transom"
  desc "Careful disk cleaner for macOS"
  homepage "https://github.com/anabiiil/transom"

  # Older Homebrew releases interpret a bare macOS symbol as an exact
  # version; the newer shared parser interprets it as a minimum instead.
  if MacOSRequirement.respond_to?(:parse)
    depends_on macos: :monterey
  else
    depends_on macos: ">= :monterey"
  end

  binary "transom"

  caveats <<~EOS
    Run `transom ui` — the first run installs Transom.app into
    /Applications, or ~/Applications if /Applications isn't writable.
  EOS
end
