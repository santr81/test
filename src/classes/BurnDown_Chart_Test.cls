@isTest
Private class BurnDown_Chart_Test{
    private static testMethod Void BurnDown_Chart_Test(){
    
        Agile_Release__c ar = new Agile_Release__c(Name = 'TestRelease');
        Insert ar;
        
        Agile_Milestone__c am = new Agile_Milestone__c(Milestone_Name__c='TestMilestone',Release__c = ar.Id,Progress__c = 'Complete',Planned_Start_Date__c = System.Today(),Planned_End_Date__c = System.Today().addDays(14));
        Insert am;
        
        Agile_Sprint__c asp = new Agile_Sprint__c(Name = 'TestSprint',Actual_Story_Points__c = 50, Milestone_Sprint__c = am.Id,Start_Date__c=System.Today(),End_Date__c = System.Today().addDays(14));
        Insert asp;
        
        Integer sday = asp.Start_Date__c.day();
        Integer eday = asp.End_Date__c.day();
        
        System.assertNotEquals(sday,eday);
        
        Sprint_Burn_Down__c sbd = new Sprint_Burn_Down__c(Date__c = System.Today(),Agile_Sprint__c=asp.id,Remaining_Story_Points__c=40);
        Insert sbd;
        
        ApexPages.StandardController stdc = new ApexPages.StandardController(asp);
        BurnDown_Chart bc = new BurnDown_Chart(stdc);
        bc.accountName  = 'TestAccount';
        
    }
}