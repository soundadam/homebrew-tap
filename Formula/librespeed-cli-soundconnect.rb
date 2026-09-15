# frozen_string_literal: true

class LibrespeedCliSoundconnect < Formula
  desc "LibreSpeed CLI helper with explicit SOCKS and structured progress support"
  homepage "https://github.com/soundadam/soundprobe/tree/v0.3.0/components/librespeed-cli"
  url "https://github.com/soundadam/soundprobe/releases/download/v0.3.0/soundprobe-0.3.0.tar.gz"
  version "1.0.13"
  sha256 "7d9acadc87c7f22e6dc58b018091580dec6ed4b83741f548515bed35525af624"
  license "LGPL-3.0-only"
  revision 3

  depends_on "go" => :build

  def install
    cd "components/librespeed-cli" do
      ldflags = %w[
        -s -w
        -X github.com/librespeed/speedtest-cli/defs.ProgName=librespeed-cli
        -X github.com/librespeed/speedtest-cli/defs.ProgVersion=v1.0.13-campus.1
        -X github.com/librespeed/speedtest-cli/defs.BuildDate=1970-01-01T00:00:00Z
      ]
      system "go", "build", *std_go_args(output: libexec/"librespeed-cli", ldflags:), "./"
    end
    (pkgshare/"licenses/librespeed-cli").install "components/librespeed-cli/LICENSE"
    pkgshare.install "components/librespeed-cli/SOUNDADAM.md"
  end

  def caveats
    <<~EOS
      This keg provides a private libexec helper for soundconnect. It does not
      link a second librespeed-cli command into Homebrew's global bin directory.
    EOS
  end

  test do
    assert_match "v1.0.13-campus.1", shell_output("#{libexec}/librespeed-cli --version")
    assert_match "progress-json", shell_output("#{libexec}/librespeed-cli --help")
    assert_match "proxy", shell_output("#{libexec}/librespeed-cli --help")
  end
end
