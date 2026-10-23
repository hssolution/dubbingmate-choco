$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

[array]$key = Get-UninstallRegistryKey -SoftwareName 'DubbingMate*'

if ($key.Count -eq 1) {
  $key | ForEach-Object {
    $uninstaller = if ($_.QuietUninstallString) { $_.QuietUninstallString } else { $_.UninstallString }
    # 경로에 공백이 있고 인자가 붙어 있을 수 있어 실행 파일 부분만 뽑는다
    if ($uninstaller -match '^\s*"([^"]+)"') { $packageArgs['file'] = $Matches[1] }
    else { $packageArgs['file'] = ($uninstaller -replace '\s+/S\s*$', '').Trim() }
    Uninstall-ChocolateyPackage @packageArgs
  }
} elseif ($key.Count -eq 0) {
  Write-Warning "$env:ChocolateyPackageName has already been uninstalled by other means."
} else {
  Write-Warning "$($key.Count) matches found!"
  Write-Warning "To prevent accidental data loss, no programs will be uninstalled."
  Write-Warning "Please alert the package maintainer that the following keys were matched:"
  $key | ForEach-Object { Write-Warning "- $($_.DisplayName)" }
}
