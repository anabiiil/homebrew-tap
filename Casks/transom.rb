# Homebrew cask template for Transom's prebuilt macOS CLI.
# The release workflow substitutes v0.2.1, 0.2.1, 8ea1421fded788a66a39c9775821677d795afaef517e3d88f9deb586f783a345, f9734d2ec035c55d166126ff9b9c9dea0e20be4eb0a33a2008a13be1f2e2402b
# and pushes the result to the anabiiil/homebrew-tap repository as
# Casks/transom.rb — do not edit the generated copy by hand.
# A cask installs the binary directly, without formula source-build checks
# that require a current Xcode/Command Line Tools toolchain on the user's Mac.
cask "transom" do
  arch arm: "arm64", intel: "amd64"

  version "0.2.1"
  sha256 arm:   "8ea1421fded788a66a39c9775821677d795afaef517e3d88f9deb586f783a345",
         intel: "f9734d2ec035c55d166126ff9b9c9dea0e20be4eb0a33a2008a13be1f2e2402b"

  url "https://github.com/anabiiil/transom/releases/download/v0.2.1/transom-v0.2.1-darwin-#{arch}.tar.gz"
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
