function ad {
    param([string]$prompt)

    $basePaths = "C:\base\path", "D:\base\path"

    filter Open-And-Pull {
        param($folder)
        if ($folder) {
            # Callback msg
            # Write-Host "Opening:  $($folder.FullName)" -ForegroundColor Cyan
            code $folder.FullName
            Push-Location $folder.FullName
            if (Test-Path ".git") {
                git pull
            }
            Pop-Location
            return $true
        }
        return $false
    }

    $folderFullPaths = foreach ($path in $basePaths) {
        if (Test-Path $path) { Get-ChildItem -Path $path -Directory }
    }

    $target = $folderFullPaths | Where-Object {
        $_.Name -eq $prompt -or $_.Name -like "$prompt*"
    } | Select-Object -First 1

    if ($target) {
        Open-And-Pull $target
    } else {
        #  error msg
        Write-Host "Folder '$prompt' not found." -ForegroundColor Yellow
        # if want see the folders avaible
        Write-Host "Options: $($folderFullPaths.Name -join ', ')" -ForegroundColor Gray
    }
}
