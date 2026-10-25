# frozen_string_literal: true

# scripts/render-cask.sh fills in the version and the SHA-256 of each release
# archive; the release workflow pushes the result to soundadam/homebrew-tap as
# Casks/njulogin.rb.
cask "njulogin" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "macos", linux: "linux"

  version "0.2.0"
  sha256 arm:          "378ddac7e5502180d4f4e2c3454b8bfc0fdc102c5e03afc2b4488c3ff195b8ae",
         intel:        "c71e0dd040252963c25117b968ba909e86470441a14993af7fd9b5849253d173",
         arm64_linux:  "454c34a6ae370aa1cc20618504051a834f854b213a9a4fa5d5dd4dc689ba9ad6",
         x86_64_linux: "bc705c14f7fa8b2b98957cd289a5c396bb3ba204edc2caa94afb3fabad0b25d3"

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
