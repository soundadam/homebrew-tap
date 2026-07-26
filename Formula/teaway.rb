# frozen_string_literal: true

# Formula for the soundadam teaway macOS power-management CLI.
class Teaway < Formula
  desc "Keep a closed Mac awake and schedule explicit delayed shutdowns"
  homepage "https://github.com/soundadam/homebrew-dist/releases/tag/teaway-v0.2.3"
  url "https://github.com/soundadam/homebrew-dist/releases/download/teaway-v0.2.3/teaway-0.2.3.tar.gz"
  sha256 "5af3d17b303965f79ccf5d350ab9230d08225d82e9c042ac1535a552eec4db0e"
  license "MIT"

  depends_on xcode: ["15.0", :build]
  depends_on macos: :ventura

  def install
    system "swift", "build", "--disable-sandbox", "-c", "release", "--product", "teaway"
    bin.install ".build/release/teaway"
  end

  test do
    ENV["TEAWAY_STATE_DIR"] = testpath/"state"
    assert_match "teaway #{version}", shell_output("#{bin}/teaway version")
    assert_match "teaway:", shell_output("#{bin}/teaway status")
  end
end
