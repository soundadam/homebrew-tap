# frozen_string_literal: true

# The release workflow's homebrew job fills in 0.2.0 and the SHA-256 of each
# archive and writes the result to Casks/chatvault.rb in soundadam/homebrew-tap.
cask "chatvault" do
  version "0.2.0"

  on_arm do
    sha256 "38c67e83371f3f97d7e4db4e581e4d93c1a948c46cebe23d450212e200989158"

    url "https://github.com/soundadam/chatvault/releases/download/v#{version}/chatvault-#{version}-macos-aarch64.tar.gz"

    binary "chatvault-#{version}-macos-aarch64/chatvault"
  end
  on_intel do
    sha256 "5547b5b3e8f54c1cfeca3f1103f991dac1dc1072d954de0a4fb1ec39605c447b"

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

    It reads the macOS WeChat 4 client's databases, which need their keys
    imported once: see the README. The vault, with decrypted copies of those
    databases, is ~/Documents/ChatVault; uninstalling leaves it in place.
  EOS
end
