# frozen_string_literal: true

class NjuConnect < Formula
  desc "Native NJU campus VPN client (EasyConnect and aTrust) with a local SOCKS5 proxy"
  homepage "https://soundadam.github.io/nju-connect/"
  url "https://github.com/soundadam/nju-connect/archive/refs/tags/v1.1.1.tar.gz"
  sha256 "1867b87e5bb089ffe53e168074bb2939f269ecc52ff3ecb1e898e77e051f8f86"
  license "AGPL-3.0-or-later"

  depends_on "go" => :build
  depends_on "librespeed-cli-nju-connect"
  depends_on :linux

  def install
    ENV["CGO_ENABLED"] = "0"
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=#{version}"), "./cmd/nju-connect"
    doc.install "THIRD_PARTY_NOTICES"
  end

  def caveats
    <<~EOS
      On macOS install the menu-bar app instead:
        brew install --cask soundadam/tap/nju-connect
    EOS
  end

  test do
    assert_equal "nju-connect #{version}", shell_output("#{bin}/nju-connect version").strip
  end
end
