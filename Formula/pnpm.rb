class Pnpm < Formula
  require "language/node"

  desc "📦🚀 Fast, disk space efficient package manager"
  homepage "https://pnpm.js.org"
  url "https://registry.npmjs.org/pnpm/-/pnpm-5.4.12.tgz"
  sha256 "9e2de4aa235c3d8e7ca06f766266f8dcbb503a3ea9163e91066086f4390c8849"
  license "MIT"

  bottle do
    cellar :any_skip_relocation
    sha256 "a3ea882b6f98d4c9043b4eb2c7c15aa3d583c313b8b8ca2ba3e653240944fe13" => :catalina
    sha256 "00873fcb020480522eee7ce1ed1446c31e9ebba0845752896d364da98fbcd6fd" => :mojave
    sha256 "dc748295d3c8dd84fb6f29a066e1e125b50dbf273849c6c8043aca93f8cac3a1" => :high_sierra
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
