using namespace System.Net

# Input bindings are passed in via param block.
param($Request, $TriggerMetadata)

# Write to the Azure Functions log stream.
Write-Host "PowerShell HTTP trigger function processed a request."


$alert = $request.body

#extract Affected cI
$affectedCI = $alert.body.data.alertContext.AffectedConfigurationItems
write-host "Affected CI" $affectedCI


#Extract projected fields from Log Search Alert
$computer = $alert.body.data.alertContext.SearchResults.tables.rows[0]
$svcname = $alert.body.data.alertContext.SearchResults.tables.rows[1]
$svcstate = $alert.body.data.alertContext.SearchResults.tables.rows[2]
$svcdisplayname = $alert.body.data.alertContext.SearchResults.tables.rows[3]
$TimeGenerated = $alert.body.data.alertContext.SearchResults.tables.rows[4]

write-host "Computer" $computer "svc name" $svcname "svcstate" $svcstate "svc displayname" $svcdisplayname "TimeGenerated" $timegenerated
        

