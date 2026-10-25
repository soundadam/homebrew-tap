# frozen_string_literal: true

# The release workflow's homebrew job fills in 0.1.0 and the SHA-256 of each
# archive and writes the result to Casks/facet.rb in soundadam/homebrew-tap.
cask "facet" do
  version "0.1.0"

  on_macos do
    on_arm do
      sha256 "c8f496453c22170945bd56775b887ae53c623a04c013c488bb98736e0d586f9d"

      url "https://github.com/soundadam/facet/releases/download/v#{version}/facet-#{version}-macos-aarch64.tar.gz"

      binary "facet-#{version}-macos-aarch64/facet"
    end
    on_intel do
      sha256 "f1ae86f5582854075972d8f0fda45ef1c47497ad3fc733ec6c0af72719c04180"

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
      sha256 "c488ca495d5d4f889f8f5f5569104bfdc6680fa5c9c0cfa5540eb3f3e8163912"

      url "https://github.com/soundadam/facet/releases/download/v#{version}/facet-#{version}-linux-aarch64.tar.gz"

      binary "facet-#{version}-linux-aarch64/facet"
    end
    on_intel do
      sha256 "4ea1ac8d0cbd05b24e90364f23fdb4bc04e0be703fca39aaea70be1cf0891782"

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
