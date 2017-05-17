@isTest
Private class createupdateBurnDownRecord_Test{
    private static testMethod void createupdateBurnDownRecord_Test(){
        Agile_Release__c ar = new Agile_Release__c(Name = 'TestRelease');
        Insert ar;
        
        Agile_Milestone__c am = new Agile_Milestone__c(Milestone_Name__c='TestMilestone',Release__c = ar.Id,Progress__c = 'Complete',Planned_Start_Date__c = System.Today(),Planned_End_Date__c = System.Today().addDays(14));
        Insert am;
        
        Agile_Sprint__c asp = new Agile_Sprint__c(Name = 'TestSprint',Actual_Story_Points__c = 50, Milestone_Sprint__c = am.Id,Start_Date__c=System.Today(),End_Date__c = System.Today().addDays(14));
        Insert asp;
        
        Agile_Story__c asr = new Agile_Story__c(Name='TestStory',Planned_Sprint__c= asp.id,Sprint_Story__c=asp.Id,Point_Hidden__c = 10);
        Insert asr;
        
        asr.Point_Hidden__c =12;
        Update asr;
    
    }

}