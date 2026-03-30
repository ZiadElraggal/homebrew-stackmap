class Stackmap < Formula
  desc "Architecture diagrams that generate themselves from infrastructure code"
  homepage "https://github.com/ZiadElraggal/stackmap"
  url "https://github.com/ZiadElraggal/stackmap/archive/refs/tags/v0.1.2.tar.gz"
  version "0.1.2"
  sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
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
