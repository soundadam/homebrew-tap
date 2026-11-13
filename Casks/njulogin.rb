# frozen_string_literal: true

# scripts/render-cask.sh fills in the version and the SHA-256 of each release
# archive; the release workflow pushes the result to soundadam/homebrew-tap as
# Casks/njulogin.rb.
cask "njulogin" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "macos", linux: "linux"

  version "0.3.0"
  sha256 arm:          "b9f58697abc5db3cd52c075c70f6c793eb98110e4af74ca445581a3506c056f1",
         intel:        "84be220e53d508f970714a1cf35af7252a79bb9591d34cb224b14016c8d916a9",
         arm64_linux:  "9220ff91ee7ac6eada0d8ac84c2246fc169d07c84329896c1b8bcb64e7a52899",
         x86_64_linux: "6e5cbf139fbab81d1b836f60c5ba8296e7760f964940f11b1e5df630cc3a5877"

  on_macos do
    # Ad-hoc signed and not notarized: drop the quarantine attribute so
    # Gatekeeper treats the Cask install like a self-updated binary.
    postflight_steps do
      run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{staged_path}}"]
    end
  end

  url "https://github.com/soundadam/njulogin/releases/download/v#{version}/njulogin-#{version}-#{os}-#{arch}.tar.gz"
  name "NJUlogin"
  desc "Authenticate local or remote network paths with the NJU portal"
  homepage "https://github.com/soundadam/njulogin"

  livecheck do
    url :url
    strategy :github_latest
  end

  binary "njulogin-#{version}-#{os}-#{arch}/njulogin"
end
