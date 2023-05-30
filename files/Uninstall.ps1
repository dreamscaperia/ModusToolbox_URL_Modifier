# Auther: dreamscaperia @github.com
# Version: 0.1.5.0

$InstPath = Get-ChildItem -LiteralPath HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall |%{if($_.GetValue("DisplayName") -like "*ModusToolbox*"){$_.GetValue("InstallLocation")}}|Select-Object -Last 1
if ( -not $InstPath ){ $InstPath = Get-ChildItem -LiteralPath HKCU:\Software\Microsoft\Windows\CurrentVersion\Uninstall |%{if($_.GetValue("DisplayName") -like "*ModusToolbox*"){$_.GetValue("InstallLocation")}}|Select-Object -Last 1 }
Get-ChildItem -LiteralPath $instpath -Filter "tool*"|%{
    if (Test-Path -LiteralPath ($_.FullName + "\modus-shell\etc\gitconfig")) {
        Remove-Item -LiteralPath ($_.FullName + "\modus-shell\etc\gitconfig") -Force
        if (Test-Path -LiteralPath ($_.FullName + "\modus-shell\etc\gitconfig.old")) {
            Rename-Item -LiteralPath ($_.FullName + "\modus-shell\etc\gitconfig.old") -NewName "gitconfig" -Force
		}
    }
}
[System.Environment]::SetEnvironmentVariable('CyRemoteManifestOverride', '', 'User')
if (Test-Path env:CY_GETLIBS_OFFLINE1) {
    [System.Environment]::SetEnvironmentVariable('CY_GETLIBS_OFFLINE1', '', 'User')
    [System.Environment]::SetEnvironmentVariable('CY_GETLIBS_OFFLINE', 'true', 'User')
    echo "CY_GETLIBS_OFFLINE: restored"
}