# dubbingmate Chocolatey 패키지

새 판을 올릴 때 바꿀 것은 세 곳이다.
1. `dubbingmate.nuspec` 의 `<version>` 을 새 버전으로 바꾼다.
2. `tools/chocolateyinstall.ps1` 의 `url64bit`(파일명의 버전)과 `checksum64`(새 설치 파일의 SHA256)를 바꾼다.
3. `choco pack` 으로 확인한 뒤 커밋한다(`.github/workflows/test.yml` 이 pack·설치·제거를 시험한다).
