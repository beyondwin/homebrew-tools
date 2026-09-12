# FixThis CLI/MCP 설치 레시피.
# 제품 소스와 사용법은 https://github.com/beyondwin/FixThis
class Fixthis < Formula
  desc "Agent-first feedback handoff for Jetpack Compose Android apps"
  homepage "https://github.com/beyondwin/FixThis"
  url "https://github.com/beyondwin/FixThis/releases/download/v1.5.0/fixthis-cli-mcp-v1.5.0.tar.gz"
  sha256 "1e96f63f6fb7610df2587b76c6d0f3670a9781c5d14af0080c307083699944df"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "openjdk@21"

  def install
    # CLI가 MCP 서버를 옆 폴더에서 찾으므로 묶음을 그대로 둡니다.
    libexec.install Dir["*"]

    # 시스템에 있는 다른 JDK를 쓰지 않도록 Homebrew JDK 21을 고정합니다.
    java_home = formula_opt_prefix("openjdk@21")
    (bin/"fixthis").write_env_script libexec/"fixthis/bin/fixthis", JAVA_HOME: java_home
    (bin/"fixthis-mcp").write_env_script libexec/"fixthis-mcp/bin/fixthis-mcp", JAVA_HOME: java_home
  end

  def caveats
    <<~EOS
      From a Jetpack Compose Android app:

        fixthis install-agent --project-dir . --target all --verify --json

      Docs: https://github.com/beyondwin/FixThis
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fixthis --version")
    assert_match "Usage", shell_output("#{bin}/fixthis --help")
    assert_predicate bin/"fixthis-mcp", :executable?
  end
end
