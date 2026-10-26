# frozen_string_literal: true

# The release workflow's homebrew job fills in 0.3.0 and the SHA-256 of each
# archive and writes the result to Casks/chatvault.rb in soundadam/homebrew-tap.
cask "chatvault" do
  version "0.3.0"

  on_arm do
    sha256 "13b07e62febbad94d922509cb3796f546d3fb710f911d2a3794048bd4fa48821"

    url "https://github.com/soundadam/chatvault/releases/download/v#{version}/chatvault-#{version}-macos-aarch64.tar.gz"

    binary "chatvault-#{version}-macos-aarch64/chatvault"
  end
  on_intel do
    sha256 "97f22f31a209a224f766d63255d67a39fc3c8fea80c1649a271aa2fecea80633"

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
