# beyondwin/tools — 에이전트 메모

이 저장소는 Homebrew 탭입니다. FixThis 제품 코드가 아닙니다.

## 읽기 순서

1. 이 파일
2. [README.md](README.md)
3. [Formula/fixthis.rb](Formula/fixthis.rb)

제품 동작, Gradle 플러그인, MCP 도구, 콘솔 UI는 [FixThis](https://github.com/beyondwin/FixThis)에서 다룹니다.

## 이 저장소에서 하는 일

- `Formula/fixthis.rb`의 배포 묶음 URL과 SHA-256을 공개 릴리스에 맞춥니다.
- 설치 레시피가 왜 그렇게 생겼는지 짧은 주석으로 남깁니다.
- README에 설치 / 업그레이드 / 이 탭의 범위만 적습니다.

## 하지 않는 일

- FixThis 소스, 문서, 샘플 앱 수정
- `fixthis init`을 기본 설치 경로로 안내 (`install-agent`가 현재 경로)
- 존재하지 않는 탭 이름 `beyondwin/fixthis` 안내
- JDK 연결 방식 변경을 테스트 없이 적용

## 버전 올리기

1. 대상 태그: `https://github.com/beyondwin/FixThis/releases/tag/vX.Y.Z`
2. 묶음: `fixthis-cli-mcp-vX.Y.Z.tar.gz`
3. 체크섬: 같은 릴리스의 `.sha256` 파일. 로컬에서도 `shasum -a 256`으로 한 번 더 확인합니다.
4. `url`과 `sha256`만 바꿉니다. `desc` / `homepage` / `install`은 묶음 레이아웃이 바뀌지 않으면 그대로 둡니다.
5. 확인:

   ```bash
   brew style Formula/fixthis.rb
   brew audit --strict --online beyondwin/tools/fixthis
   brew livecheck --formula beyondwin/tools/fixthis
   ```

`audit` / `livecheck`는 `brew --repo beyondwin/tools` 클론을 읽습니다. 이 git 작업 복사본과 다르면 푸시 후 `brew update`한 다음 검수합니다. `brew test`는 이 Mac에 해당 버전이 brew로 설치된 뒤에만 의미가 있습니다.

CI는 `.github/workflows/tests.yml`의 `brew test-bot`입니다. 문법 검사와 `fixthis` 설치·테스트를 macOS/Linux에서 돌립니다.

## 레시피 제약

- CLI와 MCP는 `libexec` 아래 나란히 있어야 합니다.
- `JAVA_HOME`은 Homebrew `openjdk@21`입니다.
- `livecheck`는 GitHub 최신 릴리스를 봅니다.

## 완료 보고

실행한 명령, 종료 코드, `url`이 가리키는 태그, 확인한 SHA-256을 그대로 적습니다.
