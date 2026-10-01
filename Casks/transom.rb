# Homebrew cask template for Transom's prebuilt macOS CLI.
# The release workflow substitutes v0.2.2, 0.2.2, 4f0a3767c9d4e3d66e4e36247c6c34c65d262c7f79bc634cf917d18f2fcf8906, 56872eb17b3eec4f1ba0547e3fe8fabf932f2b98a1e5350fcbaa8b105b9411da
# and pushes the result to the anabiiil/homebrew-tap repository as
# Casks/transom.rb — do not edit the generated copy by hand.
# A cask installs the binary directly, without formula source-build checks
# that require a current Xcode/Command Line Tools toolchain on the user's Mac.
cask "transom" do
  arch arm: "arm64", intel: "amd64"

  version "0.2.2"
  sha256 arm:   "4f0a3767c9d4e3d66e4e36247c6c34c65d262c7f79bc634cf917d18f2fcf8906",
         intel: "56872eb17b3eec4f1ba0547e3fe8fabf932f2b98a1e5350fcbaa8b105b9411da"

  url "https://github.com/anabiiil/transom/releases/download/v0.2.2/transom-v0.2.2-darwin-#{arch}.tar.gz"
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
