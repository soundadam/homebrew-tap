# Homebrew Tap

Public Homebrew definitions maintained by `soundadam`.

Source repositories may be private. All package URLs below resolve to immutable,
anonymously downloadable assets in [`soundadam/homebrew-dist`](https://github.com/soundadam/homebrew-dist).
Each distribution Release records provenance, source commit, checksum, and license
boundary. AGPL binary releases include exact corresponding-source archives.

## Install

```bash
brew install soundadam/tap/codex-switch
brew install soundadam/tap/njuprobe
brew install soundadam/tap/teaway
brew install --cask soundadam/tap/codex-pulse
brew install --cask soundadam/tap/mac-thermal-lab
brew install --cask soundadam/tap/soundvpn
```

Use fully qualified names with current Homebrew tap-trust rules. This trusts only
the explicitly requested Formula or Cask, not every current and future entry.

## Security boundaries

- `codex-pulse`, `mac-thermal-lab`, and `soundvpn` are ad-hoc signed and not notarized.
- Homebrew preserves quarantine; no Cask removes quarantine or changes Gatekeeper.
- `teaway on` and `teaway off` change macOS power-management state and should be
  run only from an attended terminal.
- `soundvpn` never removes or migrates a legacy installation automatically.

## Distribution releases

- [Codex Switch 0.1.0](https://github.com/soundadam/homebrew-dist/releases/tag/codex-switch-v0.1.0)
- [NJUProbe 0.1.0](https://github.com/soundadam/homebrew-dist/releases/tag/njuprobe-v0.1.0)
- [Teaway 0.2.2](https://github.com/soundadam/homebrew-dist/releases/tag/teaway-v0.2.2)
- [Codex Pulse 1.0.1](https://github.com/soundadam/homebrew-dist/releases/tag/codex-pulse-v1.0.1)
- [Mac Thermal Lab 0.2.0 unsigned preview](https://github.com/soundadam/homebrew-dist/releases/tag/mac-thermal-lab-v0.2.0)
- [SoundVPN 0.2.0 unsigned preview](https://github.com/soundadam/homebrew-dist/releases/tag/soundvpn-v0.2.0)
