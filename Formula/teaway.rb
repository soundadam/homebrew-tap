# frozen_string_literal: true

# Formula for the soundadam teaway macOS power-management CLI.
class Teaway < Formula
  desc "Run a Mac as an always-on server with reversible sleep control"
  homepage "https://github.com/soundadam/teaway"
  url "https://github.com/soundadam/teaway/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "0abed5488669167074c9eb56e37ab01401e06862b157af00c2497a24482acdc7"
  license "MIT"

  depends_on xcode: ["15.0", :build]
  depends_on macos: :ventura

  def install
    system "swift", "build", "--disable-sandbox", "-c", "release", "--product", "teaway"
    bin.install ".build/release/teaway"
  end

  test do
    assert_match "teaway #{version}", shell_output("#{bin}/teaway version")
    assert_match "Usage:", shell_output("#{bin}/teaway help")
    assert_match "privileged helper must run as root",
                 shell_output("#{bin}/teaway __teaway_privileged version 2>&1", 77)
  end
end
