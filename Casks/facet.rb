# frozen_string_literal: true

# The release workflow's homebrew job fills in 0.2.0 and the SHA-256 of each
# archive and writes the result to Casks/facet.rb in soundadam/homebrew-tap.
cask "facet" do
  version "0.2.0"

  on_macos do
    on_arm do
      sha256 "b972a992f26cf05ce539745213f5dff6d9823a69e286f30409b26a77c0443f63"

      url "https://github.com/soundadam/facet/releases/download/v#{version}/facet-#{version}-macos-aarch64.tar.gz"

      binary "facet-#{version}-macos-aarch64/facet"
    end
    on_intel do
      sha256 "0c00fc68776379b9d35e0e61f497c35e667081f30e9100e68e06ccf33115f729"

      url "https://github.com/soundadam/facet/releases/download/v#{version}/facet-#{version}-macos-x86_64.tar.gz"

      binary "facet-#{version}-macos-x86_64/facet"
    end

    # Ad-hoc signed and not notarized: clear the quarantine bit so Gatekeeper
    # treats it like a file that facet update put in place.
    postflight_steps do
      run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{staged_path}}"]
    end
  end
  on_linux do
    on_arm do
      sha256 "5579159980166c64a3724d0ee05c0a9af3aae1e6ba8a42c44fa6d57ec4de0fa5"

      url "https://github.com/soundadam/facet/releases/download/v#{version}/facet-#{version}-linux-aarch64.tar.gz"

      binary "facet-#{version}-linux-aarch64/facet"
    end
    on_intel do
      sha256 "2b3031952569caf9eb7c6015244a889a3b24467b70db0fb119664b5d900dbef8"

      url "https://github.com/soundadam/facet/releases/download/v#{version}/facet-#{version}-linux-x86_64.tar.gz"

      binary "facet-#{version}-linux-x86_64/facet"
    end
  end

  name "facet"
  desc "Manage fingerprint-chromium profiles for multiple accounts"
  homepage "https://github.com/soundadam/facet"

  livecheck do
    url :url
    strategy :github_latest
  end

  caveats <<~EOS
    facet is MIT licensed.

    facet launches fingerprint-chromium but does not bundle it. Install
    version 142 or later as /Applications/Chromium.app (macOS) or put
    fingerprint-chromium on PATH (Linux), or point FACET_CHROMIUM at it.
  EOS
end
