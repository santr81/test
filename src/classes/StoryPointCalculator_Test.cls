@isTest
private class StoryPointCalculator_Test{ 
   
  static testMethod void myTestMethod() { 
      Test.startTest();
      Agile_Release__c res = new Agile_Release__c();
        res.Name='Test';
        
        insert res;
            
            Agile_Milestone__c objMile = new Agile_Milestone__c();
           objMile.Milestone_Name__c = 'TestMilestone';
           objMile.Release__c = res.Id;
           objMile.Progress__c ='In Progress'; 
           objMile.Milestones__c = 'Requirements Definition'; 
           objMile.Actual_Start_Date__c =system.now().adddays(-4).date();
           objMile.Actual_End_Date__c = system.now().adddays(-2).date();
            
           objMile.Planned_Start_Date__c = system.now().adddays(-4).date();
           objMile.Planned_End_Date__c = system.today()+7;
           
           insert objMile;  
     
      Agile_Feature__c agf = new Agile_Feature__c();
            agf.Cost_of_Delay__c = 'cost of delay';
            agf.Milestone_Feature__c = objMile.id;
            agf.Team__c = 'team 1';
            agf.Description__c = 'Text Area';
            agf.Name = 'name1';
      insert agf;
       
      Agile_Sprint__c oag = new Agile_Sprint__c();
        oag.Name = 'name1';
      oag.Milestone_Sprint__c = objMile.id;
      oag.Start_Date__c = system.now().adddays(-4).date();
       oag.End_Date__c =  system.now().adddays(-2).date();
        
      insert oag;  
      
      Agile_Story__c Ags = new Agile_Story__c();
        Ags.Name = 'New Story';
        Ags.Feature_Story__c = agf.Id ;
      Ags.Sprint_Story__c = oag.id;
     Ags.Planned_Sprint__c = oag.Id;
     Ags.Points__c = '1';   
      Ags.Priority_Story__c = 'high';
      Ags.Rank__c = 2;
    Ags.Release_Train__c = 'ReleaseTrain1';
      Ags.Team_Story__c = 'ReleaseTrain1Team1';
      Ags.Status__c = 'Blocked';
      Ags.Progress__c = 2;
      Ags.Team_Story__c = 'Business';
      
      try{
          insert Ags;
          
      }catch (Exception e) {
          system.debug('1e.getMessage();' +e.getMessage());
        String message = e.getMessage();
        System.assert(message.contains('Insert failed. First exception on row 0; first error: CANNOT_INSERT_UPDATE_ACTIVATE_ENTITY'), + message);
    }
     
      Agile_Story__c Ags1 = new Agile_Story__c();
      Ags1.Name = 'New Story';
      Ags1.Feature_Story__c = agf.Id ;
     Ags1.Sprint_Story__c = oag.id; 
     Ags1.Planned_Sprint__c = oag.Id;
     Ags1.Points__c = '1';   
      Ags1.Priority_Story__c = 'high'; 
      Ags1.Rank__c = 1;
    Ags1.Release_Train__c = 'ReleaseTrain1';
      Ags1.Team_Story__c = 'ReleaseTrain1Team1';
      Ags1.Status__c = 'Blocked';
      Ags1.Progress__c = 2;
      Ags1.Team_Story__c = 'Business';
   
    insert Ags1;
         
     Agile_Story__c Ags2 = new Agile_Story__c();
      Ags2.Name = 'New Story';
      Ags2.Feature_Story__c = agf.Id ;
     Ags2.Sprint_Story__c = oag.id; 
     Ags2.Planned_Sprint__c = oag.Id;
     Ags2.Points__c = '1';   
      Ags2.Priority_Story__c = 'high'; 
      Ags2.Rank__c = 3;
    Ags2.Release_Train__c = 'ReleaseTrain1';
      Ags2.Team_Story__c = 'ReleaseTrain1Team1';
      Ags2.Status__c = 'Blocked';
      Ags2.Progress__c = 2;
      Ags2.Team_Story__c = 'Business';
   
    insert Ags2;
             
       
      
     test.stopTest();
  }     
    
    
    static testMethod void myupdateTestMethod() { 
           Agile_Release__c ar = new Agile_Release__c(Name = 'TestRelease');
        Insert ar;
        
        Agile_Milestone__c am = new Agile_Milestone__c(Milestone_Name__c='TestMilestone',Release__c = ar.Id,Progress__c = 'Complete',Planned_Start_Date__c = System.Today(),Planned_End_Date__c = System.Today().addDays(14));
        Insert am;
        
        Agile_Sprint__c asp = new Agile_Sprint__c(Name = 'TestSprint',Actual_Story_Points__c = 50, Milestone_Sprint__c = am.Id,Start_Date__c=System.Today(),End_Date__c = System.Today().addDays(14));
        Insert asp;
        
        Agile_Sprint__c asp1 = new Agile_Sprint__c(Name = 'TestSprint',Actual_Story_Points__c = 60, Milestone_Sprint__c = am.Id,Start_Date__c=System.Today(),End_Date__c = System.Today().addDays(14));
        Insert asp1;
        
        Agile_Feature__c af = new Agile_Feature__c(Name = 'TestFeature',Milestone_Feature__c = am.Id,Description__c = 'Text Area');
        Insert af;
        
        Agile_Story__c asr = new Agile_Story__c(Name = 'TestStory',Feature_Story__c = af.Id,Sprint_Story__c = asp.id, Planned_Sprint__c = asp.Id,Points__c = '1' );
        Insert asr;
        
        asr.Points__c = '2';        
        Update asr;
  }
    
    static testMethod void myTestMethod1() { 
      Test.startTest();
      Agile_Release__c res = new Agile_Release__c();
        res.Name='Test';
        
        insert res;
            
            Agile_Milestone__c objMile = new Agile_Milestone__c();
           objMile.Milestone_Name__c = 'TestMilestone';
           objMile.Release__c = res.Id;
           objMile.Progress__c ='In Progress'; 
           objMile.Milestones__c = 'Requirements Definition'; 
           objMile.Actual_Start_Date__c =system.now().adddays(-4).date();
           objMile.Actual_End_Date__c = system.now().adddays(-2).date();
            
           objMile.Planned_Start_Date__c = system.now().adddays(-4).date();
           objMile.Planned_End_Date__c = system.today()+7;
           
           insert objMile;  
     
      Agile_Feature__c agf = new Agile_Feature__c();
            agf.Cost_of_Delay__c = 'cost of delay';
            agf.Milestone_Feature__c = objMile.id;
            agf.Team__c = 'team 1';
            agf.Description__c = 'Text Area';
            agf.Name = 'name1';
      insert agf;
       
      Agile_Sprint__c oag = new Agile_Sprint__c();
        oag.Name = 'name1';
      oag.Milestone_Sprint__c = objMile.id;
      oag.Start_Date__c = system.now().adddays(-4).date();
       oag.End_Date__c =  system.now().adddays(-2).date();
        
      insert oag;  
      
      Agile_Story__c Ags = new Agile_Story__c();
        Ags.Name = 'New Story';
        Ags.Feature_Story__c = agf.Id ;
      //Ags.Sprint_Story__c = oag.id;
     //Ags.Planned_Sprint__c = oag.Id;
     //Ags.Points__c = '1';   
      Ags.Priority_Story__c = 'high';
      Ags.Rank__c = 2;
    Ags.Release_Train__c = 'ReleaseTrain1';
      Ags.Team_Story__c = 'ReleaseTrain1Team1';
      Ags.Status__c = 'Blocked';
      Ags.Progress__c = 2;
      Ags.Team_Story__c = 'Business';
      
      try{
          insert Ags;
          Ags.Rank__c = 3;
          update Ags;
          
      }catch (Exception e) {
          system.debug('123e.getMessage();' +e.getMessage());
        String message = e.getMessage();
          
        System.assert(message.contains('Insert failed. First exception on row 0; first error: CANNOT_INSERT_UPDATE_ACTIVATE_ENTITY'), + message);
    }
        
         Agile_Story__c Ags1 = new Agile_Story__c();
        Ags1.Name = 'New Story';
        Ags1.Feature_Story__c = agf.Id ;
      Ags1.Sprint_Story__c = oag.id;
     Ags1.Planned_Sprint__c = oag.Id;
     //Ags.Points__c = '1';   
      Ags1.Priority_Story__c = 'high';
      Ags1.Rank__c = 2;
      Ags1.Release_Train__c = 'ReleaseTrain1';
      Ags1.Team_Story__c = 'ReleaseTrain1Team1';
      Ags1.Status__c = 'Blocked';
      Ags1.Progress__c = 2;
      Ags1.Team_Story__c = 'Business';
      
      try{
          insert Ags1;
          Ags1.Rank__c = 5;
          update Ags1;
          
      }catch (Exception e) {
          system.debug('1234e.getMessage();' +e.getMessage());
        String message = e.getMessage();
        System.assert(message.contains('Insert failed. First exception on row 0; first error: CANNOT_INSERT_UPDATE_ACTIVATE_ENTITY'), + message);
    }
   test.stopTest();      
  } 
    
    static testMethod void myTestMethod2() { 
      Test.startTest();
      Agile_Release__c res = new Agile_Release__c();
        res.Name='Test';
        
        insert res;
            
            Agile_Milestone__c objMile = new Agile_Milestone__c();
           objMile.Milestone_Name__c = 'TestMilestone';
           objMile.Release__c = res.Id;
           objMile.Progress__c ='In Progress'; 
           objMile.Milestones__c = 'Requirements Definition'; 
           objMile.Actual_Start_Date__c =system.now().adddays(-4).date();
           objMile.Actual_End_Date__c = system.now().adddays(-2).date();
            
           objMile.Planned_Start_Date__c = system.now().adddays(-4).date();
           objMile.Planned_End_Date__c = system.today()+7;
           
           insert objMile;  
     
      Agile_Feature__c agf = new Agile_Feature__c();
            agf.Cost_of_Delay__c = 'cost of delay';
            agf.Milestone_Feature__c = objMile.id;
            agf.Team__c = 'team 1';
            agf.Description__c = 'Text Area';
            agf.Name = 'name1';
      insert agf;
       
      Agile_Sprint__c oag = new Agile_Sprint__c();
        oag.Name = 'name1';
      oag.Milestone_Sprint__c = objMile.id;
      oag.Start_Date__c = system.now().adddays(-4).date();
       oag.End_Date__c =  system.now().adddays(-2).date();
        
      insert oag;  
      
      Agile_Story__c Ags = new Agile_Story__c();
        Ags.Name = 'New Story';
        Ags.Feature_Story__c = agf.Id ;
        Ags.Sprint_Story__c = oag.id;
        Ags.Planned_Sprint__c = oag.Id;
        Ags.Points__c = '1';   
        Ags.Priority_Story__c = 'high';
        Ags.Rank__c = 2;
        Ags.Release_Train__c = 'ReleaseTrain1';
        Ags.Team_Story__c = 'ReleaseTrain1Team1';
        Ags.Status__c = 'Blocked';
        Ags.Progress__c = 2;
        Ags.Team_Story__c = 'Business';
     insert Ags;
        
    Agile_Story__c Ags1 = new Agile_Story__c();
        Ags1.Name = 'New Story';
        Ags1.Feature_Story__c = agf.Id ;
        Ags1.Sprint_Story__c = oag.id;
        Ags1.Planned_Sprint__c = oag.Id;
        Ags1.Points__c = '1';   
        Ags1.Priority_Story__c = 'high';
        Ags1.Rank__c = 2;
        Ags1.Release_Train__c = 'ReleaseTrain1';
        Ags1.Team_Story__c = 'ReleaseTrain1Team1';
        Ags1.Status__c = 'Blocked';
        Ags1.Progress__c = 2;
        Ags1.Team_Story__c = 'Business';
        try{
            insert Ags1;
            update Ags1;
        } catch (Exception e) {
           system.debug('123421e.getMessage();' +e.getMessage());
            String message = e.getMessage();
            //System.assert(message.contains('Update failed. First exception on row 0 with id'), + message);
        }
   test.stopTest();      
  } 
}