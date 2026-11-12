# Cria as issues do diretório review/issues no repositório indicado.
# Formato de cada arquivo: linha 1 = título, linha 2 = labels (separadas por vírgula), resto = corpo.
# Uso: .\scripts\criar-issues.ps1 -Repo usuario/nome-do-repo [-DryRun]
param(
  [Parameter(Mandatory)][string]$Repo,
  [switch]$DryRun
)
$dir = Join-Path $PSScriptRoot "..\review\issues"
foreach ($f in Get-ChildItem $dir -Filter *.md | Sort-Object Name) {
  $lines  = Get-Content $f.FullName -Encoding UTF8
  $title  = $lines[0]
  $labels = $lines[1].Split(",") | ForEach-Object { $_.Trim() }
  $body   = ($lines | Select-Object -Skip 2) -join "`n"
  if ($DryRun) { Write-Host "[dry-run] $title  ($($labels -join ', '))"; continue }
  foreach ($l in $labels) { gh label create $l --repo $Repo --force 2>$null | Out-Null }
  $tmp = New-TemporaryFile
  Set-Content $tmp $body -Encoding UTF8
  gh issue create --repo $Repo --title $title --body-file $tmp --label ($labels -join ",")
  Remove-Item $tmp
}
