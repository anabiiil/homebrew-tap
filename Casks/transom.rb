# Homebrew cask template for Transom's prebuilt macOS CLI.
# The release workflow substitutes v0.2.0, 0.2.0, 26e19472f315133733e4e849d3cf909bb2af8dba644908df96a70aee97c93e14, 53d9f8ced5e59639bb00b658811f628f2838e1e898573f5ae93a07b16b36c15a
# and pushes the result to the anabiiil/homebrew-tap repository as
# Casks/transom.rb — do not edit the generated copy by hand.
# A cask installs the binary directly, without formula source-build checks
# that require a current Xcode/Command Line Tools toolchain on the user's Mac.
cask "transom" do
  arch arm: "arm64", intel: "amd64"

  version "0.2.0"
  sha256 arm:   "26e19472f315133733e4e849d3cf909bb2af8dba644908df96a70aee97c93e14",
         intel: "53d9f8ced5e59639bb00b658811f628f2838e1e898573f5ae93a07b16b36c15a"

  url "https://github.com/anabiiil/transom/releases/download/v0.2.0/transom-v0.2.0-darwin-#{arch}.tar.gz"
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
