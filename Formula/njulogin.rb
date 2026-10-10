# frozen_string_literal: true

class Njulogin < Formula
  desc "Authenticate local or remote network paths with the NJU portal"
  homepage "https://github.com/soundadam/njulogin"
  url "https://github.com/soundadam/njulogin/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "127aea0d9fcd7cd0c63da26e896c35c83134beb4f23f21561ea92601e5817547"
  license "MIT"

  depends_on "go" => :build
  depends_on macos: :ventura

  def install
    ldflags = "-s -w -X main.version=#{version}"
    system "go", "build", "-trimpath", "-ldflags", ldflags,
           "-o", bin/"njulogin", "./cmd/njulogin"
    doc.install "LICENSE", "NOTICE", "THIRD_PARTY_NOTICES.md", "third_party_licenses"
  end

  test do
    assert_match "njulogin #{version}", shell_output("#{bin}/njulogin version")
    assert_match "Usage:", shell_output("#{bin}/njulogin help 2>&1")
    assert_path_exists doc/"THIRD_PARTY_NOTICES.md"
    assert_path_exists doc/"third_party_licenses/github.com_skip2_go-qrcode_LICENSE"
    assert_path_exists doc/"third_party_licenses/golang.org_x_term_LICENSE"
    assert_path_exists doc/"third_party_licenses/golang.org_x_sys_LICENSE"
  end
end
