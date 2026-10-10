# frozen_string_literal: true

# release workflow 的 homebrew job 把 0.1.0 与两处 SHA-256 填好，写到 soundadam/homebrew-tap 的 Casks/tonescope.rb
cask "tonescope" do
  version "0.1.0"

  on_macos do
    sha256 "a637dd5fed585b9079bf7cc02a39ece4b05208a0d01590bc3f301a340d02b1ba"

    url "https://github.com/soundadam/tonescope/releases/download/v#{version}/tonescope-#{version}-macos-universal.zip"

    app "Tonescope.app"

    caveats <<~EOS
      Tonescope.app is ad-hoc signed and not notarized. Homebrew preserves
      quarantine and this cask does not change Gatekeeper. On first launch,
      allow it under System Settings → Privacy & Security → Open Anyway.
      macOS asks for microphone access the first time it runs.
    EOS
  end
  on_linux do
    on_intel do
      sha256 "02aa9d0dd2aa14e11bd7c7a7fbec497e41de4ef2374ecf79df5233dc2426cd77"

      url "https://github.com/soundadam/tonescope/releases/download/v#{version}/tonescope-#{version}-linux-x86_64.tar.gz"

      binary "tonescope-#{version}-linux-x86_64/tonescope"

      caveats <<~EOS
        Tonescope captures audio through ALSA (libasound2); PulseAudio and
        PipeWire are reached through their ALSA compatibility layer.
      EOS
    end
  end

  name "Tonescope"
  desc "Real-time log-frequency spectrogram with musical scale overlays"
  homepage "https://soundadam.com/projects/tonescope/"

  livecheck do
    url :url
    strategy :github_latest
  end
end
