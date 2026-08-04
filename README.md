# Homebrew Tap

Public Homebrew definitions maintained by `soundadam`.

Public source repositories are consumed directly from immutable release tags when
possible. Packages whose source or build pipeline is private use anonymously
downloadable assets in [`soundadam/homebrew-dist`](https://github.com/soundadam/homebrew-dist).
Each Formula or Cask pins an exact version and checksum. AGPL binary releases include
the exact corresponding-source archive.

`njulogin` is an exception: its source repository and release asset are private.
Its Formula uses a checksum-pinned GitHub Release asset and requires
`HOMEBREW_GITHUB_API_TOKEN` with read access to `soundadam/njulogin`.

## Install

```bash
brew install soundadam/tap/codex-switch
brew install soundadam/tap/soundprobe
brew install soundadam/tap/teaway
brew install --cask soundadam/tap/codex-pulse
brew install --cask soundadam/tap/mac-thermal-lab
```

For private `njulogin` source access:

```bash
export HOMEBREW_GITHUB_API_TOKEN="$(gh auth token)"
brew install soundadam/tap/njulogin
```

The token is used by Homebrew for the authenticated source download and is not
embedded in the Formula or installed executable.

Use fully qualified names with current Homebrew tap-trust rules. This trusts only
the explicitly requested Formula or Cask, not every current and future entry.

## Security boundaries

- `codex-pulse` and `mac-thermal-lab` are ad-hoc signed and not notarized.
- Homebrew preserves quarantine; no Cask removes quarantine or changes Gatekeeper.
- `teaway` is built from its public immutable source tag. `on`, `off`, helper
  registration, and shutdown mutation should be run only from an attended terminal.
- `njulogin` stores one plaintext credential file protected by directory mode
  `0700` and file mode `0600`; its private source asset requires repository-read
  authorization.

## Distribution releases

- [Codex Switch 0.1.0](https://github.com/soundadam/homebrew-dist/releases/tag/codex-switch-v0.1.0)
- [SoundProbe 0.3.0](https://github.com/soundadam/soundprobe/releases/tag/v0.3.0)
- [teaway 0.3.0](https://github.com/soundadam/teaway/releases/tag/v0.3.0)
- [Codex Pulse 1.0.1](https://github.com/soundadam/homebrew-dist/releases/tag/codex-pulse-v1.0.1)
- [Mac Thermal Lab 0.2.0 unsigned preview](https://github.com/soundadam/homebrew-dist/releases/tag/mac-thermal-lab-v0.2.0)
