# Auther: dreamscaperia @github.com
# Version: 0.1.9.5

$InstPath = Get-ChildItem -LiteralPath HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall |%{if($_.GetValue("DisplayName") -like "*ModusToolbox*"){$_.GetValue("InstallLocation")}}|Where-Object {$_ -notlike "*Edge*" -and $_ -notlike "*Setup*" -and $_ -notlike "*packs*" -and $_ -notlike "*ModusToolboxEclipse*"}|Select-Object -Last 1
if ( -not $InstPath ){ $InstPath = Get-ChildItem -LiteralPath HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall |%{if($_.GetValue("DisplayName") -like "*ModusToolbox*"){$_.GetValue("InstallLocation")}}|Where-Object {$_ -notlike "*Edge*" -and $_ -notlike "*Setup*" -and $_ -notlike "*packs*" -and $_ -notlike "*ModusToolboxEclipse*"}|Select-Object -Last 1 }
Get-ChildItem -LiteralPath $instpath -Filter "tool*"|%{
    Rename-Item -LiteralPath ($_.FullName + "\modus-shell\etc\gitconfig") -NewName "gitconfig.old" 2>&1 | Out-Null
}
$cur = Split-Path -Parent $MyInvocation.MyCommand.Definition
Get-ChildItem -LiteralPath $instpath -Filter "tool*"|%{
    Copy-Item -LiteralPath ($cur + "\gitconfig") -Destination ($_.FullName + "\modus-shell\etc\")
}
[System.Environment]::SetEnvironmentVariable('CyRemoteManifestOverride', 'https://gitee.com/dreamscaperia/mtb-super-manifest/raw/master/mtb-super-manifest-fv2.xml', 'User')
if (Test-Path env:CY_GETLIBS_OFFLINE) {
    [System.Environment]::SetEnvironmentVariable('CY_GETLIBS_OFFLINE', '', 'User')
    [System.Environment]::SetEnvironmentVariable('CY_GETLIBS_OFFLINE1', 'true', 'User')
    echo "CY_GETLIBS_OFFLINE: reserved"
}