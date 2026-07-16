class Keel < Formula
  desc "Controlled execution governance for AI coding agents"
  homepage "https://github.com/locustave/keel"
  url "https://github.com/locustave/keel/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "948ce0240593f8dde2403e56581afce3f756796632e1f417872df950b3c10453"
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
