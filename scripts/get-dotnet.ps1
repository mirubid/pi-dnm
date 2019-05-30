#import-module Posh-SSH
# see https://www.hanselman.com/blog/InstallingTheNETCore2xSDKOnARaspberryPiAndBlinkingAnLEDWithSystemDeviceGpio.aspx

. "$PSScriptRoot/_include.ps1"
$dn_runtime="https://download.visualstudio.microsoft.com/download/pr/87521bd8-1522-4141-9532-91d580292c42/59116d9f6ebced4fdc8b76b9e3bbabbf/dotnet-runtime-2.2.5-linux-arm.tar.gz"
$local_file= "$temp_dir/dotnet-runtime-2.2.5-linux-arm.tar.gz"

if(!(test-path $temp_dir)){
    mkdir $temp_dir
}
if(!(test-path $local_file)){
    Invoke-WebRequest -Uri $dn_runtime -OutFile $local_file
}
#set-scpfile -ComputerName $server -Credential $cred -LocalFile $local_file -RemotePath ~
if(!$pi_hostname){
	write-host "pi_hostname not set" -BackgroundColor Yellow
}else{
	scp -i $keyfile "$local_file" "pi@${pi_hostname}:~"
}