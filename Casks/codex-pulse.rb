# frozen_string_literal: true

cask "codex-pulse" do
  version "1.0.1"
  sha256 "0837101042307819ad8d3497573a0892d6541f09ad7fde6f91fd2b3539538b60"

  url "https://github.com/soundadam/homebrew-dist/releases/download/codex-pulse-v#{version}/Codex-Pulse-#{version}-macOS-universal.zip"
  name "Codex Pulse"
  desc "Live reasoning-token telemetry for Codex"
  homepage "https://github.com/soundadam/homebrew-dist/releases/tag/codex-pulse-v#{version}"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Codex Pulse.app"

  zap trash: [
    "~/Library/Caches/CodexPulse",
    "~/Library/Preferences/com.soundadam.codex-pulse.plist",
  ]

  caveats <<~EOS
    Codex Pulse #{version} is ad-hoc signed and not Apple-notarized. Homebrew
    preserves quarantine and does not change Gatekeeper policy. Review the
    immutable Release, binary SHA-256, and exact AGPL corresponding-source
    archive before making an explicit macOS security decision.
  EOS
end
