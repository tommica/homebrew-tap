class Difly < Formula
  desc "Git commit and merge GUI with editable diffs and hunk selection"
  homepage "https://github.com/tommica/difly"
  url "https://github.com/tommica/difly/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "ef36407a40e39c9a189a40fcc79eec19b75f848d7d4d45ed2317cd2f40bbe2d3"
  license "MIT"

  depends_on "rust" => :build
  depends_on "git"

  on_linux do
    depends_on "pkgconf" => :build
    depends_on "libx11"
    depends_on "libxcursor"
    depends_on "libxi"
    depends_on "libxkbcommon"
    depends_on "libxrandr"
    depends_on "mesa"
    depends_on "wayland"
  end

  def install
    system "cargo", "install", *std_cargo_args
    (pkgshare/"licenses").install "assets/fonts/OFL.txt" => "JetBrainsMono-OFL.txt"
  end

  test do
    assert_equal "difly #{version}", shell_output("#{bin}/difly --version").strip
    assert_match "Usage: difly", shell_output("#{bin}/difly --help")
  end
end
