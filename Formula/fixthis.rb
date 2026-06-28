class Fixthis < Formula
  desc "Agent-first feedback handoff for Jetpack Compose Android apps"
  homepage "https://github.com/beyondwin/FixThis"
  url "https://github.com/beyondwin/FixThis/releases/download/v1.4.0/fixthis-cli-mcp-v1.4.0.tar.gz"
  sha256 "e3f295eeaba6acbbd9945001f07c507e14a32c083d6e099c5eba2869de978bd8"
  license "MIT"

  depends_on "openjdk@21"

  def install
    libexec.install Dir["*"]
    java_home = formula_opt_prefix("openjdk@21")
    (bin/"fixthis").write_env_script libexec/"fixthis/bin/fixthis", JAVA_HOME: java_home
    (bin/"fixthis-mcp").write_env_script libexec/"fixthis-mcp/bin/fixthis-mcp", JAVA_HOME: java_home
  end

  test do
    assert_match "Usage", shell_output("#{bin}/fixthis --help")
    assert_predicate bin/"fixthis-mcp", :executable?
  end
end
