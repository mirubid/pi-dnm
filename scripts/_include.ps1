
if(!$env:pi_hostname){
	#set environment variable if not yet set
    $env:pi_hostname = read-host -Prompt "Enter address of pi"
}
$pi_hostname=$env:pi_hostname

#keyfile used for ssh / scp
$keyfile = "$home/.ssh/pi-dnm-01"
$temp_dir="$home/AppData/Local/Temp/pi-dnm"