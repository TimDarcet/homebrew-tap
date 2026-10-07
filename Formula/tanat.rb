class Tanat < Formula
  desc "High-quality caffeination: keep a Mac awake, lid closed included"
  homepage "https://github.com/timdarcet/tanat"
  url "https://github.com/timdarcet/tanat/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "00d0f919cca30b1575aec349424610acfb049a843cf1191a6807ee37d5a8c47c"
  license "MIT"

  depends_on :macos

  def install
    system ENV.cc, "-O2", "-fobjc-arc", "-framework", "Cocoa", "-framework", "IOKit", "-o", "tanat", "tanat.m"
    bin.install "tanat"
  end

  service do
    run [opt_bin/"tanat", "--bar"]
    run_at_load true
  end

  test do
    system bin/"tanat", "true"
  end
end
