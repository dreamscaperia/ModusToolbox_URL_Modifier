# Auther: dreamscaperia @github.com
# Version: 0.1.7.5

$InstPath = Get-ChildItem -LiteralPath HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall |%{if($_.GetValue("DisplayName") -like "*ModusToolbox*"){$_.GetValue("InstallLocation")}}|Select-Object -Last 1
if ( -not $InstPath ){ $InstPath = Get-ChildItem -LiteralPath HKCU:\Software\Microsoft\Windows\CurrentVersion\Uninstall |%{if($_.GetValue("DisplayName") -like "*ModusToolbox*"){$_.GetValue("InstallLocation")}}|Select-Object -Last 1 }
Get-ChildItem -LiteralPath $instpath -Filter "tool*"|%{
    if (Test-Path -LiteralPath ($_.FullName + "\modus-shell\etc\gitconfig")) {
        Remove-Item -LiteralPath ($_.FullName + "\modus-shell\etc\gitconfig") -Force
    }
}
if ([System.Environment]::GetEnvironmentVariable('CyRemoteManifestOverride','User') -eq 'https://gitee.com/dreamscaperia/mtb-super-manifest/raw/master/mtb-super-manifest-fv2.xml') {
    [System.Environment]::SetEnvironmentVariable('CyRemoteManifestOverride', '', 'User')
}