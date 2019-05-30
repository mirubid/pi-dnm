. "$PSScriptRoot/_include.ps1"
$configuration='Release'
$runtime='linux-arm'

#dotnet publish ./src/pi-con -r $runtime -o "../../bin/pi-con/$configuration/$runtime/publish" --configuration $configuration

#scp -i ./bin/ "$local_file" "pi@${pi_hostname}:~"

ssh -i $keyfile "pi@${pi_hostname}" mkdir --parents ~/drop/dnm

scp -i $keyfile -r ./pi-scripts/deploy-pi-con "pi@${pi_hostname}:~/drop/dnm/deploy-pi-con"
ssh -i $keyfile "pi@${pi_hostname}" chmod u+x ~/drop/dnm/deploy-pi-con

scp -i $keyfile -r "./bin/pi-con/$configuration/$runtime/publish" "pi@${pi_hostname}:~/drop/dnm"

ssh -i $keyfile "pi@${pi_hostname}" ~/drop/dnm/deploy-pi-con