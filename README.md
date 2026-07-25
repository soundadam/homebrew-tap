# Homebrew Tap

Homebrew formulae maintained by `soundadam`.

## Codex Pulse

Install the native macOS Codex reasoning monitor:

```bash
brew install --cask soundadam/tap/codex-pulse
```

The current release is ad-hoc signed and not notarized. Review the exact Release
and checksum before deciding whether to remove quarantine manually; the cask
does not change Gatekeeper policy automatically.

Project: [soundadam/codex-pulse](https://github.com/soundadam/codex-pulse)

## codex-switch

Install:

```bash
brew install soundadam/tap/codex-switch
```

Use the fully qualified Formula name with current Homebrew tap-trust rules. This
trusts the explicitly requested Formula without granting broad trust to every
current and future entry in the tap.

`codex-switch` is a local Codex auth/profile switcher for ChatGPT subscription auth, API keys, and OpenAI-compatible mirror providers.

Project:

https://github.com/soundadam/codex-switch

## Teaway

Install the macOS power-management CLI:

```bash
brew install soundadam/tap/teaway
```

Inspect state without changing power settings:

```bash
teaway status
```

Commands such as `teaway on` and `teaway off` change macOS power-management
state and should be run only from an attended terminal after confirming that no
critical workload depends on the current sleep configuration.

Project: [soundadam/teaway](https://github.com/soundadam/teaway)
