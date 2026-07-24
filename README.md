# Homebrew Tap

Homebrew formulae maintained by `soundadam`.

## Codex Pulse

Install the native macOS Codex reasoning monitor:

```bash
brew install --cask soundadam/tap/codex-pulse
xattr -dr com.apple.quarantine "/Applications/Codex Pulse.app"
```

Project: [soundadam/codex-pulse](https://github.com/soundadam/codex-pulse)

## codex-switch

Install:

```bash
brew tap soundadam/tap
brew install codex-switch
```

`codex-switch` is a local Codex auth/profile switcher for ChatGPT subscription auth, API keys, and OpenAI-compatible mirror providers.

Project:

https://github.com/soundadam/codex-switch

## soundvpn

Install the signed and notarized macOS product through its single cask:

```bash
brew install --cask soundadam/tap/soundvpn
```

The cask installs `/Applications/soundvpn.app` and exposes the exact embedded
`soundvpn` helper on `PATH` for headless operation, diagnostics, configuration,
and recovery. The app owns the current-user background service lifecycle. There
is no separate `soundvpn` Formula and `brew services` is not a supported entry
point.

The cask remains on a draft branch until the Developer ID, notarization,
downloaded Gatekeeper, signed service lifecycle, live VPN, upgrade, rollback,
and uninstall gates are accepted. Do not merge or publish the draft checksum.

Project: [soundadam/soundvpn](https://github.com/soundadam/soundvpn)
