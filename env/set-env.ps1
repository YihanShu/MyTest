param(
    [Parmeter(Mandatory = $true)]
    [string]$Name #destination
)



$binPath = (Get-Location).Path
Write-Host "current PATH:$binPath"
Write-Host "Destination PATH:$Name"

if($Name -eq "PATH"){
    $currentPath = [Environment]::GetEnvironmentVariable("PATH","User")

    if ($currentPath -notlike "*$binPath*") {
        $newPath = "$currentPath;$binPath"
        [Environment]::SetEnvironmentVariable("PATH", $newPath, "User")
        Write-Host "Success add..."
    } else {
        Write-Host "Path already exist!!!"
    }

}else{
        [Environment]::SetEnvironmentVariable($Name, $binPath, "User")
        Write-Host "Have success add $Name = $binPath"
}   