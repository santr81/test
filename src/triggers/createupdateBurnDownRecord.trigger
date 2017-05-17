trigger createupdateBurnDownRecord on Agile_Sprint__c (after update) {

    List<Sprint_Burn_Down__c> sBurnDownList = new List<Sprint_Burn_Down__c>(); 
    for(Agile_Sprint__c sprint : Trigger.New) {
        system.debug('@@@@New'+sprint.Remaining_Story_Points__c);
        system.debug('@@@@OLD'+trigger.oldMap.get(sprint.id).Remaining_Story_Points__c);
        
        if((sprint.Total_Remaining_story_Points__c!=trigger.oldMap.get(sprint.id).Total_Remaining_story_Points__c) || (sprint.Total_Remaining_Effort__c!=trigger.oldMap.get(sprint.id).Total_Remaining_Effort__c))
           {   
                Sprint_Burn_Down__c sBurnDown = new Sprint_Burn_Down__c();
                sBurnDown.agile_sprint__c = sprint.Id;
                sBurnDown.Remaining_Effort__c = sprint.Total_Remaining_Effort__c;
                sBurnDown.Remaining_Story_Points__c = sprint.Total_Remaining_story_Points__c;
                sBurnDown.Date__c = Date.today();
                sBurndown.SystemID__c = sprint.Id + string.valueOfGmt(Date.today());
                sBurnDownList.add(sBurnDown);    
           }
    }
    
    if(sBurnDownList.size()>0)
        upsert sBurnDownList SystemID__c;
}