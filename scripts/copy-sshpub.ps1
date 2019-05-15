
import-module Posh-SSH
. "$PSScriptRoot/_include.ps1"

if(!$cred){
    $cred=get-credential
}

("$home/pi-dnm-01.pub","$home/.ssh/id_rsa.pub") | % {
    #copy pub key to pi
    $local_sshpub=$_
    set-scpfile -ComputerName $pi_hostname -Credential $cred -LocalFile $local_sshpub -RemotePath .ssh
}