# frozen_string_literal: true

# release workflow 的 homebrew job 把 0.1.1 与两处 SHA-256 填好，写到 soundadam/homebrew-tap 的 Casks/tonescope.rb
cask "tonescope" do
  version "0.1.1"

  on_macos do
    sha256 "ea7b99ab30fdfcc8583ef3fc7906b4c0024f31fab64095d7dbaaee0cd605d2c9"

    url "https://github.com/soundadam/tonescope/releases/download/v#{version}/tonescope-#{version}-macos-universal.zip"

    app "Tonescope.app"

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
      sha256 "100a9623a5c98c11d6b87b64664dfbf801b9c5d54533d7e8f7921743e6258415"

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
