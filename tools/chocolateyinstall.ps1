$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url64bit       = 'https://dubbingmate.com/download/updates/DubbingMate-Setup-0.1.32-x64.exe'
  checksum64     = '5f2f423d3b015f5aead2b86f13eb744d1657501d0cdfeae33168117aa1c578d3'
  checksumType64 = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
