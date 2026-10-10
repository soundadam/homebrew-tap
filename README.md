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
brew install --cask soundadam/tap/pace
brew install soundadam/tap/tea
brew install --cask soundadam/tap/codex-pulse
brew install --cask soundadam/tap/mac-thermal-lab
brew install --cask soundadam/tap/tonescope      # macOS and Linux x86_64
brew install --cask soundadam/tap/nju-connect   # macOS
brew install soundadam/tap/nju-connect          # Linux
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

- `codex-pulse`, `mac-thermal-lab`, `nju-connect`, and `tonescope` are ad-hoc
  signed and not notarized.
- Homebrew preserves quarantine for `codex-pulse`, `mac-thermal-lab`,
  `nju-connect`, and `tonescope`; those casks do not change Gatekeeper.
- `pace` is an unsigned CLI cask. Its post-install hook clears the
  quarantine xattr on the staged binary so Gatekeeper does not block it.
  Measurement helpers are not bundled; run `pace doctor` after install.
- `nju-connect` is an AGPL-3.0 preview built from its public tagged source.
  Recipients may remove quarantine locally with `xattr` after reviewing the
  Release and SHA-256. Its speed test uses the `librespeed-cli-nju-connect` Formula.
  The Linux-only `nju-connect` Formula builds the CLI from the same public tag.
- `tea` is built from its public immutable source tag. homebrew-core's `tea` is the
  unrelated Gitea CLI, so install it as `soundadam/tap/tea`. `on`, `off`, helper
  registration, and shutdown mutation should be run only from an attended terminal.
- `njulogin` stores one plaintext credential file protected by directory mode
  `0700` and file mode `0600`; its private source asset requires repository-read
  authorization.

## Distribution releases

- [Codex Switch 0.1.0](https://github.com/soundadam/homebrew-dist/releases/tag/codex-switch-v0.1.0)
- [pace 0.5.0](https://github.com/soundadam/pace/releases/tag/v0.5.0)
- [tea 0.5.0](https://github.com/soundadam/tea/releases/tag/v0.5.0)
- [Codex Pulse 1.0.1](https://github.com/soundadam/homebrew-dist/releases/tag/codex-pulse-v1.0.1)
- [Tonescope releases](https://github.com/soundadam/tonescope/releases); `Casks/tonescope.rb` is
  written by its release workflow on each version tag
- [Mac Thermal Lab 0.2.0 unsigned preview](https://github.com/soundadam/homebrew-dist/releases/tag/mac-thermal-lab-v0.2.0)
- [nju-connect 1.1.0-alpha.2 unsigned preview](https://github.com/soundadam/nju-connect/releases/tag/v1.1.0-alpha.2)
