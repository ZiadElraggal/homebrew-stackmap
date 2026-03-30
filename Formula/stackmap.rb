class Stackmap < Formula
  desc "Architecture diagrams that generate themselves from infrastructure code"
  homepage "https://github.com/ZiadElraggal/stackmap"
  url "https://github.com/ZiadElraggal/stackmap/archive/refs/tags/v0.1.3.tar.gz"
  version "0.1.3"
  sha256 "2a060d0ce762f934f93b1231886e539c3bf338513ac7f960c668b1003b4a5c5e"
  license "MIT"

  depends_on "python@3.12"

  def install
    python = Formula["python@3.12"].opt_bin/"python3.12"
    system python, "-m", "venv", libexec
    system libexec/"bin/pip", "install", "--upgrade", "pip"
    system libexec/"bin/pip", "install", buildpath
    bin.install_symlink libexec/"bin/stackmap"
  end

  test do
    output = shell_output("#{bin}/stackmap version")
    assert_match "stackmap", output
  end
end
