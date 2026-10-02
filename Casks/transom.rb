# Homebrew cask template for Transom's prebuilt macOS CLI.
# The release workflow substitutes v0.2.3, 0.2.3, 50bfbf639c67c325412433f048d7ce44bf05a5de118d3f7e7f7a00af403f5354, 541ac5bf618dedcabcf553275df7b09104bdc70a932608d6bf7fdeada1b691b4
# and pushes the result to the anabiiil/homebrew-tap repository as
# Casks/transom.rb — do not edit the generated copy by hand.
# A cask installs the binary directly, without formula source-build checks
# that require a current Xcode/Command Line Tools toolchain on the user's Mac.
cask "transom" do
  arch arm: "arm64", intel: "amd64"

  version "0.2.3"
  sha256 arm:   "50bfbf639c67c325412433f048d7ce44bf05a5de118d3f7e7f7a00af403f5354",
         intel: "541ac5bf618dedcabcf553275df7b09104bdc70a932608d6bf7fdeada1b691b4"

  url "https://github.com/anabiiil/transom/releases/download/v0.2.3/transom-v0.2.3-darwin-#{arch}.tar.gz"
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
