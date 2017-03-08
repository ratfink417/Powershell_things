#Determines connected network devices and changes the DNS server setting

$config = Get-DnsClient
foreach($interface in $config.InterfaceAlias){
    Try{$adapter = Get-NetAdapter $interface -ErrorAction Stop}
    Catch{"Not a physical adapter"}
    if($adapter.Status -eq 'Up') {Set-DnsClientServerAddress -InterfaceAlias $interface -ServerAddresses '4.2.2.2'}
}
