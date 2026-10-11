# Homebrew Tap

Public Homebrew definitions maintained by `soundadam`.

- Applications with a public repository ship prebuilt archives on their own
  immutable GitHub Releases. On each version tag their release workflow fills in
  `packaging/homebrew/<name>.rb` and writes it here as `Casks/<name>.rb`, following
  the [appkit](https://github.com/soundadam/appkit) conventions: `nju-connect`,
  `pace`, `tea`, and `tonescope`.
- `njulogin` and `librespeed-cli-nju-connect` are Formulae built from a public
  immutable release archive.
- Packages whose source or build pipeline is private use anonymously
  downloadable assets in [`soundadam/homebrew-dist`](https://github.com/soundadam/homebrew-dist):
  `codex-switch`, `codex-pulse`, and `mac-thermal-lab`. Their AGPL binary releases
  include the exact corresponding-source archive.

Each Formula or Cask pins an exact version and checksum.

## Install

Trust the tap once, then install by fully qualified name:

```bash
brew trust --tap soundadam/tap
brew install --cask soundadam/tap/nju-connect   # macOS and Linux
brew install --cask soundadam/tap/pace          # macOS and Linux
brew install --cask soundadam/tap/tea           # macOS
brew install --cask soundadam/tap/tonescope     # macOS and Linux x86_64
brew install soundadam/tap/njulogin
brew install soundadam/tap/codex-switch
brew install --cask soundadam/tap/codex-pulse
brew install --cask soundadam/tap/mac-thermal-lab
```

Homebrew loads a Formula or Cask from a third-party tap only when it is trusted.
Without the tap-wide trust, installing one by name trusts that one entry and
nothing it depends on, so the `nju-connect` Cask stops at
`librespeed-cli-nju-connect`.

`nju-connect` and `tea` were Formulae and are now Casks of the same name.
`tap_migrations.json` makes `brew update` replace an installed Formula with the
Cask when the Cask is trusted, and print the commands to do it otherwise.

## Security boundaries

- The macOS builds of every Cask here are ad-hoc signed and not notarized. A Cask
  whose `postflight_steps` runs `xattr -dr com.apple.quarantine` clears quarantine
  on install; the others keep it, and their caveats say how to open them.
- `pace` does not bundle its measurement helpers; run `pace doctor` after install.
- `nju-connect` is AGPL-3.0-or-later; its corresponding source is the public
  repository at the release tag. Its speed test uses the
  `librespeed-cli-nju-connect` Formula.
- homebrew-core's `tea` is the unrelated Gitea CLI, so install this one as
  `soundadam/tap/tea`. Run `on`, `off`, helper registration, and shutdown mutation
  only from an attended terminal.
- `njulogin` stores one plaintext credential file protected by directory mode
  `0700` and file mode `0600`.

## CI

[`formula-ci.yml`](.github/workflows/formula-ci.yml) covers `nju-connect`,
`njulogin`, `pace`, `tea`, and `tonescope`: it copies each definition into a
throwaway tap, runs `brew style` and `brew audit`, installs it, and smoke-tests
the installed command on the platforms it supports.
