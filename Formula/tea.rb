# frozen_string_literal: true

# Formula for the soundadam tea macOS power-management CLI.
class Tea < Formula
  desc "Run a Mac as an always-on server with reversible sleep control"
  homepage "https://github.com/soundadam/tea"
  url "https://github.com/soundadam/tea/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "a5f950621e712ab63b5df425c867ba8de94436ca0e4a94b465a4192fd3fff976"
  license "MIT"

  depends_on "go" => :build
  depends_on macos: :ventura

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    assert_match "tea #{version}", shell_output("#{bin}/tea version")
    assert_match "Usage:", shell_output("#{bin}/tea help")
    assert_match "privileged helper must run as root",
                 shell_output("#{bin}/tea __tea_privileged version 2>&1", 77)
  end
end
