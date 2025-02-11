function Get-PackageList {
    param(
        [Parameter(Mandatory)]
        [string]$FilePath
    )

    if (-Not (Test-Path $FilePath)) {
        Write-Host "File '$FilePath' not found. Skipping this list."
        return @()
    }

    $packages = @()
    Get-Content $FilePath | ForEach-Object {
        $line = $_.Trim()
        if ($line -and -not $line.StartsWith("#")) {
            $packages += $line
        }
    }
    return $packages
}

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Definition

$wingetFile = Join-Path $scriptDir "programs.txt"
$wingetPackages = Get-PackageList -FilePath $wingetFile

Write-Host "==== Installing winget packages ====" -ForegroundColor Cyan

foreach ($pkg in $wingetPackages) {
    Write-Host "-------------------------------------"
    Write-Host "Processing winget package: $pkg"
    
        Write-Host "Installing $pkg via winget..."
        winget install $pkg --accept-source-agreements --accept-package-agreements
        if ($LASTEXITCODE -eq 0) {
            Write-Host "$pkg installed successfully."
        }
        else {
            Write-Host "Error installing $pkg. Please review the output."
        }
    }
    
Write-Host "==== Winget installation complete ====`n" -ForegroundColor Cyan

if (-not (Get-Command choco -ErrorAction SilentlyContinue)) {
    Write-Host "Chocolatey not found. Installing Chocolatey..." -ForegroundColor Yellow
    Set-ExecutionPolicy Bypass -Scope Process -Force
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
    try {
        iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
        if ($LASTEXITCODE -eq 0) {
            Write-Host "Chocolatey installed successfully."
        }
        else {
            Write-Host "Error installing Chocolatey. Exiting script."
            exit 1
        }
    }
    catch {
        Write-Host "Exception occurred while installing Chocolatey: $_"
        exit 1
    }
}
else {
    Write-Host "Chocolatey is already installed." -ForegroundColor Green
}
Write-Host ""

$chocoFile = Join-Path $scriptDir "programs-choco.txt"
$chocoPackages = Get-PackageList -FilePath $chocoFile

Write-Host "==== Installing Chocolatey packages ====" -ForegroundColor Cyan

foreach ($pkg in $chocoPackages) {
    Write-Host "-------------------------------------"
    Write-Host "Processing Chocolatey package: $pkg"
    
    $checkResult = choco list --lo --limit-output -e $pkg | Out-String
    $escapedPkg = [regex]::Escape($pkg)
    if ($checkResult -match ("^" + $escapedPkg + "\|")) {
        Write-Host "$pkg appears to be already installed. Skipping..."
    }
    else {
        Write-Host "Installing $pkg via Chocolatey..."
        choco install $pkg --yes
        if ($LASTEXITCODE -eq 0) {
            Write-Host "$pkg installed successfully."
        }
        else {
            Write-Host "Error installing $pkg. Please review the output."
        }
    }
}
Write-Host "==== Chocolatey installation complete ====" -ForegroundColor Cyan
Write-Host "All installations completed."
