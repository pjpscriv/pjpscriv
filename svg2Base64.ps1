$iconDir = "icons"
$files = Get-ChildItem -Path $iconDir -Filter *.svg

foreach ($file in $files) {
    $svgContent = Get-Content -Path $file.FullName -Raw
    $base64String = [Convert]::ToBase64String([Text.Encoding]::UTF8.GetBytes($svgContent))

    Write-Host $file.Name -ForegroundColor Green -NoNewline
    Write-Host " data:image/svg%2bxml;base64,$base64String" -ForegroundColor White
}
