class Keel < Formula
  desc "Controlled execution governance for AI coding agents"
  homepage "https://github.com/locustave/keel"
  url "https://github.com/locustave/keel/archive/refs/tags/v0.0.1.tar.gz"
  sha256 "91b496ce819ff2087c62c7063da10edd280b16a89737d0152214d51fd04cd2e0"
  license "Apache-2.0"
  head "https://github.com/locustave/keel.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "./cmd/keel"
  end

  test do
    assert_match "keel", shell_output("#{bin}/keel --help 2>&1")
  end
end
