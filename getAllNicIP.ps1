Login-AzureRmAccount

$SubArray = Get-AzureRmSubscription 

$NicPair = @()

foreach($subscription in $SubArray){
    Set-AzureRmContext -SubscriptionName $subscription.Name
    
    $NICArray = Get-AzureRmNetworkInterface 

    foreach($nic in $NICArray){
    
       $NicPair += $nic.Name + ', ' + $nic.IpConfigurations.PrivateIpAddress 
    }
}

echo $NicPair > .\svrip.csv
