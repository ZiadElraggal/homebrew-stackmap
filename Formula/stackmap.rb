class Stackmap < Formula
  desc "Architecture diagrams that generate themselves from infrastructure code"
  homepage "https://github.com/ZiadElraggal/stackmap"
  url "https://github.com/ZiadElraggal/stackmap/archive/refs/tags/v0.1.7.tar.gz"
  version "0.1.7"
  sha256 "93d8f56e1fe338fbe1e12706ff2f3dda97e35f63cedde78528acced885f8c15c"
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
