$ip = "(YOUR_URL)"

$response = & "C:\Windows\System32\curl.exe" -k $ip | Out-String

# regex para capturar as ocorrências
$regex = 'YOUR_REGEX'

# coletar as correspondências
$matches = [regex]::Matches($response, $regex)

# Verificar o que encontrou
if ($matches.Count -gt 0) {
    foreach ($match in $matches) {
        Write-Output "Valor encontrado: $($match.Groups[1].Value)"
    }
} else {
    Write-Output "Não foi possível encontrar a informação."
}