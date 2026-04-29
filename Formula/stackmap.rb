class Stackmap < Formula
  desc "Architecture diagrams that generate themselves from infrastructure code"
  homepage "https://github.com/ZiadElraggal/stackmap"
  url "https://github.com/ZiadElraggal/stackmap/releases/download/v0.4.0/stackmap-0.4.0-source.tar.gz"
  version "0.4.0"
  sha256 "0057546ea33c07e62d9ba08975bc612dc98180e0357b35d42930c3b7dc57f408"
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
