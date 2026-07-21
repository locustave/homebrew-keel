class Keel < Formula
  desc "Controlled execution governance for AI coding agents"
  homepage "https://github.com/locustave/keel"
  url "https://github.com/locustave/keel/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "21f48d82896dffbef03c31bf6c2910940e737609539c5a00347e28c2ed349417"
  license "Apache-2.0"
  head "https://github.com/locustave/keel.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=#{version}"), "./cmd/keel"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/keel version").strip
  end
end
