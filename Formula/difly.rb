class Difly < Formula
  desc "Git commit and merge GUI with editable diffs and hunk selection"
  homepage "https://github.com/tommica/difly"
  url "https://github.com/tommica/difly/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "e9b569943a3c33b8564c3957f67cd7d130c7eee6c4aaaf0ba193efcb2b94d73d"
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
