class CodexSwitch < Formula
  desc "Switch local Codex auth profiles"
  homepage "https://github.com/soundadam/codex-switch"
  url "https://github.com/soundadam/codex-switch/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "0861944e14ec77fdf09f9d5e88eee0e9e94270ac4ab8648502847082edaf3b61"
  license "MIT"

  depends_on "python@3.14"

  def install
    bin.install "scripts/codex-switch"
    pkgshare.install "templates"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/codex-switch --help")
  end
end
