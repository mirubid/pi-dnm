
if(!$pi_hostname){
    $pi_hostname = read-host -Prompt "Enter address of pi"
}

$keyfile = "$home/.ssh/pi-dnm-01"
$temp_dir="$home/AppData/Local/Temp/pi-dnm"