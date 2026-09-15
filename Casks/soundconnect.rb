# frozen_string_literal: true

cask "soundconnect" do
  version "1.1.0-alpha.1"
  sha256 "b813e78f57918dadf313876740289ff297f9dcedcf14763d3c4a1e686d124210"

  url "https://github.com/soundadam/homebrew-dist/releases/download/soundconnect-v#{version}/soundconnect-#{version}-macos-universal.zip"
  name "soundconnect"
  desc "Menu-bar controller and native campus-connectivity CLI"
  homepage "https://github.com/soundadam/homebrew-dist/releases/tag/soundconnect-v#{version}"

  depends_on formula: "librespeed-cli-soundconnect"
  depends_on macos: :ventura

  app "soundconnect.app"
  binary "#{appdir}/soundconnect.app/Contents/Helpers/soundconnect"

  uninstall quit: "io.github.soundadam.soundconnect.menu"

  zap trash: [
    "~/Library/Application Support/soundconnect",
    "~/Library/Caches/io.github.soundadam.soundconnect.menu",
    "~/Library/Preferences/io.github.soundadam.soundconnect.menu.plist",
  ]

  caveats <<~EOS
    This cask distributes an ad-hoc signed, non-notarized preview. Homebrew
    preserves quarantine and this cask does not change Gatekeeper policy or
    remove extended attributes automatically. Corresponding source is not
    published with this preview.

    Review the immutable Release, SHA-256, and build manifest before making a
    local security exception. After that review, the account owner may remove
    quarantine explicitly with:

      xattr -dr com.apple.quarantine "#{appdir}/soundconnect.app"

    This exception permits local execution only. It does not provide an Apple
    Team ID, Developer ID trust, or notarization. VPN setup, connection
    control, runtime status, and campus speed testing use the bundled native
    soundconnect CLI. Speed measurements also require the separately installed
    librespeed-cli-soundconnect Homebrew Formula.
  EOS
end
