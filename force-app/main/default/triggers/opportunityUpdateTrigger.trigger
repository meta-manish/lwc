trigger opportunityUpdateTrigger on Opportunity (before update) {
    for(Opportunity opp : Trigger.New){
        if((opp.StageName == 'Closed Won' || opp.StageName == 'Closed Lost') && 
           (Trigger.OldMap.get(opp.id).StageName != 'Closed Won' || Trigger.OldMap.get(opp.id).StageName != 'Closed Lost')){
               opp.CloseDate = Date.Today();
           }
    }
}