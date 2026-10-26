# frozen_string_literal: true

# The release workflow's homebrew job fills in 0.1.0 and the SHA-256 of each
# archive and writes the result to Casks/chatvault.rb in soundadam/homebrew-tap.
cask "chatvault" do
  version "0.1.0"

  on_arm do
    sha256 "246a7bbff75728dd0bfac0dbff10645a349cb38ffbe8ba547a31bd13fbe44440"

    url "https://github.com/soundadam/chatvault/releases/download/v#{version}/chatvault-#{version}-macos-aarch64.tar.gz"

    binary "chatvault-#{version}-macos-aarch64/chatvault"
  end
  on_intel do
    sha256 "e85bf9d616492758a2ae1535b94c4e79351a78626f7624de4612561c8882a472"

    url "https://github.com/soundadam/chatvault/releases/download/v#{version}/chatvault-#{version}-macos-x86_64.tar.gz"

    binary "chatvault-#{version}-macos-x86_64/chatvault"
  end

  name "chatvault"
  desc "Keep every WeChat message in a local vault with incremental exports"
  homepage "https://github.com/soundadam/chatvault"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :monterey

  # Ad-hoc signed and not notarized: clear the quarantine bit so Gatekeeper
  # treats it like a file that chatvault update put in place.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{staged_path}}"]
  end

  caveats <<~EOS
    chatvault is Apache-2.0 licensed.

    It reads the macOS WeChat 4 client's databases, which needs their keys
    once: see https://github.com/soundadam/chatvault#取-key. The vault, with
    decrypted copies of those databases, is ~/Documents/ChatVault; uninstalling
    leaves it in place.
  EOS
end
