class Teaway < Formula
  desc "Keep a closed Mac awake and schedule explicit delayed shutdowns"
  homepage "https://github.com/soundadam/teaway"
  url "https://github.com/soundadam/teaway/archive/refs/tags/v0.2.2.tar.gz"
  sha256 "a18d3b9be4a020a986a81ded7086a3bb8cf9676829d2213608d3a27343473514"
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
