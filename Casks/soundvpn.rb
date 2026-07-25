# frozen_string_literal: true

cask "soundvpn" do
  version "0.2.0"
  sha256 "2a6b8afaf6b3e1a1e8875b7e1ebb1ef1b46208d9a92d262a2249996ab7342d6e"

  url "https://github.com/soundadam/homebrew-dist/releases/download/soundvpn-v#{version}/soundvpn-#{version}-macos-universal.zip"
  name "soundvpn"
  desc "Unofficial menu-bar client for selected Nanjing University VPN resources"
  homepage "https://github.com/soundadam/homebrew-dist/releases/tag/soundvpn-v#{version}"

  depends_on macos: :ventura

  app "soundvpn.app"
  binary "#{appdir}/soundvpn.app/Contents/Helpers/soundvpn"

  uninstall_preflight do
    system_command "#{appdir}/soundvpn.app/Contents/Resources/cask-uninstall-check.sh",
                   args: ["#{appdir}/soundvpn.app"]
  end

  uninstall launchctl: "io.github.soundadam.njuconnect.agent",
            quit:      "io.github.soundadam.njuconnect.menu"

  zap trash: [
    "~/Library/Application Support/soundvpn",
    "~/Library/Caches/soundvpn",
    "~/Library/Preferences/io.github.soundadam.njuconnect.menu.plist",
  ]

  caveats <<~EOS
    This cask currently distributes an unsigned, non-notarized preview from the
    maintainer's personal tap. Homebrew preserves quarantine and macOS may block
    the first launch. Review the exact GitHub Release version, SHA-256, and
    corresponding source before accepting that risk. This cask does not remove
    quarantine or change Gatekeeper policy automatically.

    The immutable Release also contains the exact AGPL corresponding source,
    licenses/notices, and build manifest. The account owner must make any macOS
    security decision explicitly; the cask does not automate that decision.

    soundvpn is one product: the menu-bar app contains its required CLI and
    current-user background agent. The CLI symlink is for recovery and
    diagnostics; it is not distributed as a separate Formula.

    A legacy njuconnect Formula or njuconnect-menu cask is never removed
    automatically. Before an accepted migration window, run:

      soundvpn config migrate-legacy

    This copies validated owner-only files into the soundvpn support directory
    and retains the legacy files for rollback.

    Starting the service may require approval in System Settings > General >
    Login Items. The service runs without root. Long-lived credentials stay in
    an explicitly selected owner-only local file; one-time codes pass only
    through the private local control socket.
  EOS
end
