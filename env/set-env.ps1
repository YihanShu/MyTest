param(
    [switch]$Persist
)


# 读取配置
$configPath = Join-Path $PSScriptRoot "env_config.json"
$config = Get-Content $configPath | ConvertFrom-Json


# 处理每个变量
foreach ($item in $config) {
    $name = $item.Name
    $value = $item.Value
    
    if ($name -eq "PATH") {
        # 特殊处理：追加
        $current = [Environment]::GetEnvironmentVariable("PATH", "User")
        if ($current -notlike "*$value*") {
            $newValue = $current + ";" + $value
            [Environment]::SetEnvironmentVariable("PATH", $newValue, "User")
            Write-Host "[$name][$Value] already add"
        } else {
            Write-Host "[$name][$Value]path is existed,Pass..."
        }
    } else {
        # 普通变量：直接设置
        [Environment]::SetEnvironmentVariable($name, $value, "User")
        Write-Host "[$name] = $value"
    }
}