# frozen_string_literal: true

# The release workflow's homebrew job fills in 0.3.0 and the SHA-256 of each
# archive and writes the result to Casks/facet.rb in soundadam/homebrew-tap.
cask "facet" do
  version "0.3.0"

  on_macos do
    on_arm do
      sha256 "d2acaabb2fbb2157ec9b9cdec9ed125a8ab59da9b6e9b69c4940a8d6c4b3776e"

      url "https://github.com/soundadam/facet/releases/download/v#{version}/facet-#{version}-macos-aarch64.tar.gz"

      binary "facet-#{version}-macos-aarch64/facet"
    end
    on_intel do
      sha256 "60ef8421f42cb3ad61caef13f8ad14e4533395fe9c568c11eb045e5cdb869211"

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
      sha256 "7bafc753a7d34c19b764507a9d787e0c8eacaa5ea52846200cf5e07d174c00ef"

      url "https://github.com/soundadam/facet/releases/download/v#{version}/facet-#{version}-linux-aarch64.tar.gz"

      binary "facet-#{version}-linux-aarch64/facet"
    end
    on_intel do
      sha256 "bee2e4c5ebeab44fad029fcc18b90e35f398550c1bcb722dab755dae2b624406"

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
