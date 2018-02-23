#This script is to collect all the Nic resources as well as their ip addresses
#in all the Azure subscriptions you can see under your Azure account, and save to local .csv file.

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
