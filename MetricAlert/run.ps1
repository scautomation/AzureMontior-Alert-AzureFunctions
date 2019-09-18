using namespace System.Net

# Input bindings are passed in via param block.
param($Request, $TriggerMetadata)

# Write to the Azure Functions log stream.
Write-Host "PowerShell HTTP trigger function processed a request."

# Interact with query parameters or the body of the request.
$alert = $request.body

# get alert rull, severity and time
$alertrule = $alert.body.data.essentials.alertRule
$severity = $alert.body.data.essentials.severity
$firedDateTime = $alert.body.data.essentials.firedDateTime

#get metric type and value
$metric = $alert.body.data.alertContext.condition.allOf.metricName
$metricValue = $alert.body.data.alertContext.condition.allOf.metricValue

#get affected CI
$affectedCI = $alert.body.data.alertContext.condition.allOf.dimensions.value[1]

write-host "Rule" $alertRule "Severity" $severity "Time" $fireddateTime "metric" $metric "value" $metricvalue "Affected CI" $affectedCI
