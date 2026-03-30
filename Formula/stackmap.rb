class Stackmap < Formula
  desc "Architecture diagrams that generate themselves from infrastructure code"
  homepage "https://github.com/ZiadElraggal/stackmap"
  url "https://github.com/ZiadElraggal/stackmap/archive/refs/tags/v0.1.4.tar.gz"
  version "0.1.4"
  sha256 "262dc30a057ea3ab74c6beb383733240907a633636c2b9794dac87ed539ceb8e"
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
