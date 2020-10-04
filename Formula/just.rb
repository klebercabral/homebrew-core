class Just < Formula
  desc "Handy way to save and run project-specific commands"
  homepage "https://github.com/casey/just"
  url "https://github.com/casey/just/archive/v0.8.0.tar.gz"
  sha256 "624cf1681cf7df8e50b70f37b29e4194cf4ad7327a335fcdf94dd83b19e45a2b"
  license "CC0-1.0"

  bottle do
    cellar :any_skip_relocation
    sha256 "05779efa951cab78a59fe97bb25dd45dd55360f6b86b8a0cf5e3fe56bf5aa539" => :catalina
    sha256 "1356651b8b4f7f14530708f0fc792434bf58dd838fe1d7d99a4e0444a5ead5b8" => :mojave
    sha256 "40e0282de3cf278ed48d8a96954f2914aad2475dccae5bd555e62f572deab169" => :high_sierra
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    (testpath/"justfile").write <<~EOS
      default:
        touch it-worked
    EOS
    system "#{bin}/just"
    assert_predicate testpath/"it-worked", :exist?
  end
end
