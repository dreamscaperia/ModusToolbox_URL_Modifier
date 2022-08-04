$InstPath = Get-ChildItem -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall |%{if($_.GetValue("DisplayName") -like "*ModusToolbox*"){$_.GetValue("InstallLocation")}}|Select-Object -Last 1
if ( -not $InstPath ){ $InstPath = Get-ChildItem -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Uninstall |%{if($_.GetValue("DisplayName") -like "*ModusToolbox*"){$_.GetValue("InstallLocation")}}|Select-Object -Last 1 }
Get-ChildItem -Path $instpath -Filter "tool*"|%{
    if (Test-Path -Path ($_.FullName + "\modus-shell\etc\gitconfig.old")) {
        Remove-Item -Path ($_.FullName + "\modus-shell\etc\gitconfig") -Force
        Rename-Item -Path ($_.FullName + "\modus-shell\etc\gitconfig.old") -NewName "gitconfig" -Force
		} else {
        Remove-Item -Path ($_.FullName + "\modus-shell\etc\gitconfig") -Force
		}
}
[System.Environment]::SetEnvironmentVariable('CyRemoteManifestOverride', '', 'User')
if (Test-Path env:CY_GETLIBS_OFFLINE1) {
    [System.Environment]::SetEnvironmentVariable('CY_GETLIBS_OFFLINE1', '', 'User')
    [System.Environment]::SetEnvironmentVariable('CY_GETLIBS_OFFLINE', 'true', 'User')
    echo "CY_GETLIBS_OFFLINE: restored"
}