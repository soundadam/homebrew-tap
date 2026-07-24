# Homebrew Tap

Homebrew formulae maintained by `soundadam`.

## CodexIQ

Install the native macOS Codex reasoning monitor. The Cask token and transitional app-bundle filename retain the original Codex Pulse compatibility names:

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
