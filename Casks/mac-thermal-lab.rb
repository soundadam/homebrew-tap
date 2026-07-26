# frozen_string_literal: true

cask "mac-thermal-lab" do
  version "0.2.0"
  sha256 "f7d3fbe2d7ef0575b65438446516d9b6e5941def573fac4eda36921f7d795fc4"

  url "https://github.com/soundadam/homebrew-dist/releases/download/mac-thermal-lab-v#{version}/Mac-Thermal-Lab-#{version}-macOS-arm64.zip"
  name "Mac Thermal Lab"
  desc "Unsigned Apple Silicon thermal monitor preview with a read-only packaged CLI"
  homepage "https://github.com/soundadam/homebrew-dist/releases/tag/mac-thermal-lab-v#{version}"

  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "Mac Thermal Lab.app"
  binary "#{appdir}/Mac Thermal Lab.app/Contents/Helpers/mtl"

  uninstall quit: "dev.adam.MacThermalLab"

  zap trash: [
    "~/Library/Application Support/Mac Thermal Lab/.PackageReplacementHandoff.json.tmp",
    "~/Library/Application Support/Mac Thermal Lab/PackageReplacementHandoff.json",
    "~/Library/Caches/Mac Thermal Lab",
    "~/Library/Preferences/dev.adam.MacThermalLab.plist",
  ]

  caveats <<~EOS
    This cask distributes an ad-hoc signed, non-notarized preview from the
    maintainer's personal tap. Homebrew preserves quarantine and this cask does
    not change Gatekeeper policy or remove extended attributes automatically.

    Review the exact GitHub Release, SHA-256, build manifest, and corresponding
    AGPL source archive before making a local security exception. After that
    review, the account owner may remove quarantine explicitly with:

      xattr -dr com.apple.quarantine "#{appdir}/Mac Thermal Lab.app"

    This exception permits local execution only. It does not provide an Apple
    Team ID, Developer ID trust, notarization, or production Helper eligibility.
    Active and Full Blast cooling remain unavailable in this preview. The
    bundled `mtl` supports monitoring, recording, diagnostics, replay, and
    attended workload tools; `mtl fan ...` fails closed.
  EOS
end
