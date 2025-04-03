Add-Type -AssemblyName System.Web


$ip = "(YOUR_URL)"

$response = & "C:\Windows\System32\curl.exe" -k $ip | Out-String

# regex para capturar as ocorrências
$regex = 'YOUR_REGEX'

# coletar as correspondências
$matches = [regex]::Matches($response, $regex)

# Verificar o que encontrou
if ($matches.Count -gt 0) {
    foreach ($match in $matches) {
        $conteudo_decodificado = [System.Web.HttpUtility]::HtmlDecode($match.Groups[1].Value)
        if ($conteudo_decodificado -ne "Número total de páginas de impressão em 2 faces :") {
            Write-Host $conteudo_decodificado
        } else {
            break
        }
        
    }
} else {
    Write-Output "Não foi possível encontrar a informação."
}