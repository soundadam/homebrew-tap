# frozen_string_literal: true

# release workflow 的 homebrew job 把 0.2.0 与两处 SHA-256 填好，写到 soundadam/homebrew-tap 的 Casks/kwscope.rb
cask "kwscope" do
  version "0.2.0"

  on_macos do
    depends_on macos: :ventura
    depends_on arch: :arm64

    sha256 "a058d58974872ce12b2c5c0fc9b4bbfd465ccb58a88f7304aa4495fb073d812a"

    url "https://github.com/soundadam/kwscope/releases/download/v#{version}/kwscope-#{version}-macos-universal.zip"

    app "Kwscope.app"
    binary "#{appdir}/Kwscope.app/Contents/MacOS/kwscope"

    # ad-hoc 签名、未公证：去掉隔离属性，与自更新换上的文件一样不被 Gatekeeper 拦下
    postflight_steps do
      run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Kwscope.app"]
    end

    caveats "macOS asks for microphone access the first time Kwscope runs."
  end
  on_linux do
    on_intel do
      sha256 "536c3eeb3d4bc4ec201c816eb0a29368e7d19df80412079501c21e52fb825696"

      url "https://github.com/soundadam/kwscope/releases/download/v#{version}/kwscope-#{version}-linux-x86_64.tar.gz"

      binary "kwscope-#{version}-linux-x86_64/kwscope"

      caveats <<~EOS
        Kwscope captures audio through ALSA (libasound2); PulseAudio and
        PipeWire are reached through their ALSA compatibility layer.
      EOS
    end
  end

  name "Kwscope"
  desc "Test wake-word ONNX models on a live spectrogram"
  homepage "https://soundadam.com/projects/kwscope/"

  livecheck do
    url :url
    strategy :github_latest
  end
end
