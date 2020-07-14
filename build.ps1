Function Get-MSBuild {
    Param (
        [Parameter(Mandatory=$true)]
        [string] $version
    )

    # TODO: Check version validity.
    # Valid versions are [2.0, 3.5, 4.0]

    $dotNetVersion = $version
    $regKey = "HKLM:\software\Microsoft\MSBuild\ToolsVersions\$dotNetVersion"
    $regProperty = "MSBuildToolsPath"

    $msbuild = Join-Path -path (Get-ItemPropertyweb.tw $regKey).$regProperty -childpath "msbuild.exe"

    return $msbuild
}


$msbuild = Get-MSBuild "4.0"
Start-Process -FilePath $msbuild -ArgumentList "tray-button.vcxproj /p:Configuration=Release" -PassThru -NoNewWindow
