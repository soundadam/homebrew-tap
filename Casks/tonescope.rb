# frozen_string_literal: true

# release workflow 的 homebrew job 把 0.1.2 与两处 SHA-256 填好，写到 soundadam/homebrew-tap 的 Casks/tonescope.rb
cask "tonescope" do
  version "0.1.2"

  on_macos do
    sha256 "49246564c03c432b0382ecba0628b25aa6442e11bd071525f88af82b41fe2b77"

    url "https://github.com/soundadam/tonescope/releases/download/v#{version}/tonescope-#{version}-macos-universal.zip"

    app "Tonescope.app"
    binary "#{appdir}/Tonescope.app/Contents/MacOS/tonescope"

    caveats <<~EOS
      Tonescope.app is ad-hoc signed and not notarized. Homebrew preserves
      quarantine and this cask does not change Gatekeeper, so macOS blocks
      the first launch. Either allow it under System Settings → Privacy &
      Security → Open Anyway, or remove quarantine yourself:

        xattr -dr com.apple.quarantine "#{appdir}/Tonescope.app"

      macOS asks for microphone access the first time it runs.
    EOS
  end
  on_linux do
    on_intel do
      sha256 "92691626672b51d604e4825dcf0fd9d0aa3f71b9ea65098504c84147f5830a08"

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
