# Get all SVG files in the specified directory
$iconDir = "icons"
$files = Get-ChildItem -Path $iconDir -Filter *.svg

foreach ($file in $files) {
    # Read the SVG content as a single string
    $svgContent = Get-Content -Path $file.FullName -Raw

    # Convert to base64
    $base64String = [Convert]::ToBase64String([Text.Encoding]::UTF8.GetBytes($svgContent))

    # Output the filename in green and the base64 string in white
    Write-Host $file.Name -ForegroundColor Green -NoNewline
    Write-Host " data:image/svg%2bxml;base64,$base64String" -ForegroundColor White
}
