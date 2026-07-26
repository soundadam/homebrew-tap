# Homebrew Tap

Public Homebrew definitions maintained by `soundadam`.

Public source repositories are consumed directly from immutable release tags when
possible. Packages whose source or build pipeline is private use anonymously
downloadable assets in [`soundadam/homebrew-dist`](https://github.com/soundadam/homebrew-dist).
Each Formula or Cask pins an exact version and checksum. AGPL binary releases include
the exact corresponding-source archive.

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
- `teaway` is built from its public immutable source tag. `on`, `off`, helper
  registration, and shutdown mutation should be run only from an attended terminal.
- `soundvpn` never removes or migrates a legacy installation automatically.

## Distribution releases

- [Codex Switch 0.1.0](https://github.com/soundadam/homebrew-dist/releases/tag/codex-switch-v0.1.0)
- [NJUProbe 0.1.0](https://github.com/soundadam/homebrew-dist/releases/tag/njuprobe-v0.1.0)
- [teaway 0.3.0](https://github.com/soundadam/teaway/releases/tag/v0.3.0)
- [Codex Pulse 1.0.1](https://github.com/soundadam/homebrew-dist/releases/tag/codex-pulse-v1.0.1)
- [Mac Thermal Lab 0.2.0 unsigned preview](https://github.com/soundadam/homebrew-dist/releases/tag/mac-thermal-lab-v0.2.0)
- [SoundVPN 0.2.0 unsigned preview](https://github.com/soundadam/homebrew-dist/releases/tag/soundvpn-v0.2.0)
