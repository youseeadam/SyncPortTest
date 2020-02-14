$Ports = @("sync.logitech.com",
"cognito-idp.us-west-2.amazonaws.com",
"cognito-idp.us-east-1.amazonaws.com",
"d1hy6rfccmvxt8.cloudfront.net",
"a3fejkt9utwjk2-ats.iot.us-west-2.amazonaws.com",
"a3fejkt9utwjk2-ats.iot.us-east-1.amazonaws.com",
"e937fa0aeeab484884e6be905b6106bb.us-west-2.aws.found.io",
"cdn.lr-ingest.io",
"r.lr-ingest.io",
"22ulqg35c4-dsn.algolia.net")

foreach ($synchost in $ports) {
    write-Output "Checking IPs for $SyncHost"
    $IPsForHost = (Test-NetConnection -Port 443 -ComputerName $synchost).ResolvedAddresses.IPAddressToString
    foreach ($IP in $IPsForHost) {
        Test-NetConnection -Port 443 -ComputerName $IP | Select-object RemoteAddress,TcpTestSucceeded
    }
}
