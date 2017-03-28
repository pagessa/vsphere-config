#set and echo entities

$dc = get-datacenter

$cl = get-cluster

$vmhosts = get-vmhost

$allvm = get-vm

 

#desired state table

####   Cluster config check ####

$desiredclusterstate = @{
  "CLHAdesiredstate" = "True";
  "CLHAadmissioncontrolenableddesiredstate" = "True";
  "CLHAisolationresponsedesiredstate" = "DoNothing";
  "CLDRSdesiredstate" = "True";
  "CLDRSautomationdesiredstate" = "FullyAutomated"
}

foreach ($c in $cl) {
  $cname = $c.name
  if ($c.HAEnabled -ne $desiredclusterstate.CLHAdesiredstate){
    #out an error
    write-host "$cname should be HA"$desiredclusterstate.CLHAdesiredstate" but is"$c.HAEnabled}
  }
   if ($c.HAAdmissionControl -ne $desiredclusterstate.CLHAadmissioncontrolenableddesiredstate){
    #out an error
    write-host "$cname AdmissionControl should be HA"$desiredclusterstate.CLHAadmissioncontrolenableddesiredstate" but is"$c.HAAdmissionControl}
  }
   if ($c.CLHAisolationresponse -ne $desiredclusterstate.CLHAisolationresponsedesiredstate){
    #out an error
    write-host "$cname should be HA"$desiredclusterstate.CLHAisolationresponsedesiredstate" but is"$c.HAIsolationResponse}
  }
   if ($c.DRS -ne $desiredclusterstate.CLDRSdesiredstate){
    #out an error
    write-host "$cname should be HA"$desiredclusterstate.CLDRSdesiredstate" but is"$c.DRS}
  }
     if ($c.DRSAutomation -ne $desiredclusterstate.CLDRSautomationdesiredstate){
    #out an error
    write-host "$cname should be HA"$desiredclusterstate.CLDRSautomationdesiredstate" but is"$c.DRSAutomation}
  }
}
