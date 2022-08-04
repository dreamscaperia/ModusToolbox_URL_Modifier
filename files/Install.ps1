$InstPath = Get-ChildItem -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall |%{if($_.GetValue("DisplayName") -like "*ModusToolbox*"){$_.GetValue("InstallLocation")}}|Select-Object -Last 1
if ( -not $InstPath ){ $InstPath = Get-ChildItem -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Uninstall |%{if($_.GetValue("DisplayName") -like "*ModusToolbox*"){$_.GetValue("InstallLocation")}}|Select-Object -Last 1 }
Get-ChildItem -Path $instpath -Filter "tool*"|%{
    Rename-Item -Path ($_.FullName + "\modus-shell\etc\gitconfig") -NewName "gitconfig.old" 2>&1 | Out-Null
}
$cur = Split-Path -Parent $MyInvocation.MyCommand.Definition
Get-ChildItem -Path $instpath -Filter "tool*"|%{
    Copy-Item -Path ($cur + "\gitconfig") -Destination ($_.FullName + "\modus-shell\etc\")
}
[System.Environment]::SetEnvironmentVariable('CyRemoteManifestOverride', 'https://itools.infineon.cn/mtb/manifests/mtb-super-manifest-fv2.xml', 'User')
if (Test-Path env:CY_GETLIBS_OFFLINE) {
    [System.Environment]::SetEnvironmentVariable('CY_GETLIBS_OFFLINE', '', 'User')
    [System.Environment]::SetEnvironmentVariable('CY_GETLIBS_OFFLINE1', 'true', 'User')
    echo "CY_GETLIBS_OFFLINE: reserved"
}