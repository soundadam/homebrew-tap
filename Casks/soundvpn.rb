# draft: replace version and sha256 from the immutable unsigned-preview release before merge
cask "soundvpn" do
  version "0.2.0"
  sha256 "9d15420f5ca5bdd999f7fe78e10bd58e5674c3e1f364ce847e01fcb7a06986f9"

  url "https://github.com/soundadam/soundvpn/releases/download/v#{version}/soundvpn-#{version}-macos-universal.zip"
  name "soundvpn"
  desc "Unofficial menu-bar client for selected Nanjing University VPN resources"
  homepage "https://github.com/soundadam/soundvpn"

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

    After reviewing the release and deciding to continue, the account owner may
    remove quarantine manually:

      xattr -dr com.apple.quarantine /Applications/soundvpn.app

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
