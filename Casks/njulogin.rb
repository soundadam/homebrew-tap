# frozen_string_literal: true

# scripts/render-cask.sh fills in the version and the SHA-256 of each release
# archive; the release workflow pushes the result to soundadam/homebrew-tap as
# Casks/njulogin.rb.
cask "njulogin" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "macos", linux: "linux"

  version "0.2.1"
  sha256 arm:          "7482fd8024df6b96aac410b08d58b7a2750c0b2a187fbcdcd51e81c980f9004a",
         intel:        "cf1a405824fefb6c38b1eea30ad146caef8c824a8a65d3396103ff3b5299605e",
         arm64_linux:  "9067d8ebcf1d1be00601b7f170ae3f28319acf535c1c78a506b1c98578254f9a",
         x86_64_linux: "17fa5a3f10fc9720156c11d69f32d0ca0e00f967f2ecd3ae7af7596af1e56a5b"

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
