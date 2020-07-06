class Pnpm < Formula
  require "language/node"

  desc "📦🚀 Fast, disk space efficient package manager"
  homepage "https://pnpm.js.org"
  url "https://registry.npmjs.org/pnpm/-/pnpm-5.2.9.tgz"
  sha256 "cc26f5f93300cf9b12d3a08fc8343516150fb3572cb956c72b5da5b1f710eee7"

  bottle do
    cellar :any_skip_relocation
    sha256 "e6044bbb1f1ed90019a1c2bcf6e79214e29a2b6f197bae7ad919f20671721e3b" => :catalina
    sha256 "0ab720ca6f3ed440e943201419bf28d226b307de17fcf06652384971fbd1e638" => :mojave
    sha256 "c191440f2313c9161afb5b5d418c8238dd23bbbe3eb732998b10ad5415f02db8" => :high_sierra
  end

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    system "#{bin}/pnpm", "init", "-y"
    assert_predicate testpath/"package.json", :exist?, "package.json must exist"
  end
end
