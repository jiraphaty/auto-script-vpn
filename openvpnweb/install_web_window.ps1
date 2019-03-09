if( Test-Path htdocs ){
	Remove-Item "htdocs" -Force -Recurse
}

$AllProtocols = [System.Net.SecurityProtocolType]'Ssl3,Tls,Tls11,Tls12'
[System.Net.ServicePointManager]::SecurityProtocol = $AllProtocols

Invoke-WebRequest -Uri https://github.com/jiraphaty/auto-script-vpn/raw/master/openvpnweb/htdocs_openvpn_final.zip -OutFile htdocs.zip

Add-Type -AssemblyName System.IO.Compression.FileSystem
function Unzip
{
    param([string]$zipfile, [string]$outpath)

    [System.IO.Compression.ZipFile]::ExtractToDirectory($zipfile, $outpath)
}

Unzip "htdocs.zip" "htdocs"

Remove-Item "htdocs.zip"



if( Test-Path C:\xampp\htdocs ){
	$i=0
	while(Test-Path "C:\xampp\htdocs_default_$i"){
		$i++
	}
	Rename-Item C:\xampp\htdocs "C:\xampp\htdocs_default_$i" -Force
}

copy-item "htdocs" C:\xampp\ -Recurse -Force

Remove-Item "htdocs" -Force -Recurse

$ipV4 = Test-Connection -ComputerName (hostname) -Count 1  | Select -ExpandProperty IPV4Address 

$ip = $ipV4.IPAddressToString

start "http://$ip/install"