# frozen_string_literal: true

# The release workflow fills in 0.6.0 and the SHA-256 values and writes the result to
# Casks/tea.rb in soundadam/homebrew-tap.
cask "tea" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.6.0"
  sha256 arm:   "7dd320c79b99f20cbd64cb5441446c3633d44cb41a771dac6d7736da6b3c808b",
         intel: "13ab4b202394e2f393d008ef6ae425a40bb10da4b09f7cc2f9c7e2c9f533e3b8"

  url "https://github.com/soundadam/tea/releases/download/v#{version}/tea-#{version}-macos-#{arch}.tar.gz"
  name "tea"
  desc "Stay awake with the lid closed, then restore the previous sleep setting"
  homepage "https://soundadam.com/projects/tea/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  binary "tea-#{version}-macos-#{arch}/tea"

  # Ad-hoc signed and not notarized: clear quarantine so Gatekeeper treats it like a self-updated copy.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{staged_path}}"]
  end

  caveats <<~EOS
    The passwordless helper is a copy of tea made by `tea auth register`.
    After upgrading, run `tea auth register` again (the client offers this
    as "Repair helper"); until then, privileged actions go through sudo.

    Before uninstalling, run `tea off` and `tea auth unregister`.
  EOS
end
