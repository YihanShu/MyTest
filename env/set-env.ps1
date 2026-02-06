param(
    [Parameter(Mandatory = $true)]
    [string]$to #destination
)


$flag = $false
$binPath = (Get-Location).Path
Write-Host "current PATH:$binPath"
Write-Host "Destination PATH:$to"

$users = [System.Environment]::GetEnvironmentVariables("User").Keys

foreach($item in $users)
{
    if($to -eq $item){
    $currentPath = [Environment]::GetEnvironmentVariable($item,"User")

    if ($currentPath -notlike "*$binPath*") {
        $newPath = "$currentPath;$binPath"
        [Environment]::SetEnvironmentVariable($to, $newPath, "User")
        Write-Host "Success add PATH in already enviroment..."
    } else {
        Write-Host "Path already exist!!!"
    }

    $flag = $true
    }
}

if($flag -eq $false)
{
    [Environment]::SetEnvironmentVariable($to,$binPath,"User")
    Write-Host "Success add PATH in new enviroment..."
}

Read-Host