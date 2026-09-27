# frozen_string_literal: true

cask "nju-connect" do
  version "1.1.0"
  sha256 "3466c6f63e6d43d2cf1732bd588ee2644a208adf38e813c5e44b45ea5ce94a8b"

  url "https://github.com/soundadam/nju-connect/releases/download/v1.1.0/nju-connect-1.1.0-macos-universal.zip"
  name "nju-connect"
  desc "Menu-bar controller and native campus-connectivity CLI"
  homepage "https://soundadam.github.io/nju-connect/"

  depends_on formula: "librespeed-cli-nju-connect"
  depends_on macos: :ventura

  app "nju-connect.app"
  binary "#{appdir}/nju-connect.app/Contents/Helpers/nju-connect"

  uninstall quit: "io.github.soundadam.nju-connect.menu"

  zap trash: [
    "~/Library/Application Support/nju-connect",
    "~/Library/Caches/io.github.soundadam.nju-connect.menu",
    "~/Library/Preferences/io.github.soundadam.nju-connect.menu.plist",
  ]

  caveats <<~EOS
    This cask is an ad-hoc signed, non-notarized release from the maintainer's
    personal tap. Homebrew preserves quarantine and this cask does not bypass
    Gatekeeper. VPN setup, connection control, runtime status, and campus speed
    testing use the bundled native nju-connect CLI. Speed measurements also
    require the separately installed librespeed-cli-nju-connect Homebrew Formula.

    nju-connect is licensed under AGPL-3.0. Review the corresponding source,
    immutable Release, SHA-256, build manifest, notices, and security state
    before making a local macOS security decision.
  EOS
end
