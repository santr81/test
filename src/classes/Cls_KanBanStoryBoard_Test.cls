@isTest
public class Cls_KanBanStoryBoard_Test {

public static testMethod void Cls_KanBanStoryBoard_Positivetest(){   
    //string statusvalue = 'In Progress';

    List<Agile_Release__c> lRelease = new List<Agile_Release__c>();
    List<Agile_Milestone__c> lMilestone = new List<Agile_Milestone__c>();
    List<Agile_Sprint__c> lSprint = new List<Agile_Sprint__c>();
    list<Agile_Feature__c> lfeature = new list<Agile_Feature__c>();
    list<Agile_Story__c> lstory = new list<Agile_Story__c>();
  
    for(Integer i=0; i<10;i++){
            lRelease.add(Util_Test_Methods.createRelease('SAFeRelease'+i));
        }
        insert lRelease;
    
    for(Integer i=0; i<10;i++){
            lMilestone.add(Util_Test_Methods.createMilesStone('SAFeMileStone'+i, lRelease.get(i).Id));
        }
        insert lMilestone;
    
     for(Integer i=0; i<10;i++){
            lSprint.add(Util_Test_Methods.createSprint('SAFeSprint'+i, lMilestone.get(i).Id));
        }
        insert lSprint;
    
    for(Integer i=0; i<10;i++){
            lfeature.add(Util_Test_Methods.createFeature('SAFefeature'+i, lMilestone.get(i).Id,'SFEefeaturedesc'));
        }
        insert lfeature;
                          
     for(Integer i=0; i<10;i++){
            lstory.add(Util_Test_Methods.createstory('SAFestory'+i, lSprint.get(i).Id,lfeature.get(i).Id));
        }
        insert lstory;        
    
     
                
     Test.startTest();
    
  ApexPAges.StandardController sc = new ApexPages.StandardController(lstory[0]);
  ApexPages.CurrentPage().getparameters().put('id', lRelease[0].id);
    //Util_Test_Methods testHandler = new Util_Test_Methods();  
    //Agile_Release__c res= testHandler.createRelease('SAFeRelease');
    id theData = lstory[0].Id;
   //Agile_Story__c story = testHandler.createstory('SAFestory', lSprint.get(0).Id,lfeature.get(0).Id);
    string statusvalue = 'In Progress';  

    Cls_KanBanStoryBoard testController = new Cls_KanBanStoryBoard(sc);
    testController.selectedrelease = lRelease[0].Name;
    testController.selectedMilestones = lMilestone[0].Milestone_Name__c;
    testController.selectedSprints =  lSprint[0].Name;
    testController.searchresults();
    testController.getrelease();
    testController.getMilestones();
    testController.getSprints();
    testController.getStories();
    testController.getTrainValues();
    testController.getTeamValues();
    testController.getStatusValues();
    testController.getselectedcheckboxvaluess();
    testController.pagereload();
    Cls_KanBanStoryBoard.updaterequest(theData, statusvalue);
    Test.stopTest(); 
}
    
    public static testMethod void Cls_KanBanStoryBoard_positivetestwithallselectedvalues(){   
    //string statusvalue = 'In Progress';

    List<Agile_Release__c> lRelease = new List<Agile_Release__c>();
    List<Agile_Milestone__c> lMilestone = new List<Agile_Milestone__c>();
    List<Agile_Sprint__c> lSprint = new List<Agile_Sprint__c>();
    list<Agile_Feature__c> lfeature = new list<Agile_Feature__c>();
    list<Agile_Story__c> lstory = new list<Agile_Story__c>();
  
    for(Integer i=0; i<10;i++){
            lRelease.add(Util_Test_Methods.createRelease('SAFeRelease'+i));
        }
        insert lRelease;
    
    for(Integer i=0; i<10;i++){
            lMilestone.add(Util_Test_Methods.createMilesStone('SAFeMileStone'+i, lRelease.get(i).Id));
        }
        insert lMilestone;
    
     for(Integer i=0; i<10;i++){
            lSprint.add(Util_Test_Methods.createSprint('SAFeSprint'+i, lMilestone.get(i).Id));
        }
        insert lSprint;
    
    for(Integer i=0; i<10;i++){
            lfeature.add(Util_Test_Methods.createFeature('SAFefeature'+i, lMilestone.get(i).Id,'SFEefeaturedesc'));
        }
        insert lfeature;
                          
     for(Integer i=0; i<10;i++){
            lstory.add(Util_Test_Methods.createstory('SAFestory'+i, lSprint.get(i).Id,lfeature.get(i).Id));
        }
        insert lstory;        
    
     
                
     Test.startTest();
    
  ApexPAges.StandardController sc = new ApexPages.StandardController(lstory[0]);
  ApexPages.CurrentPage().getparameters().put('id', lRelease[0].id);
    //Util_Test_Methods testHandler = new Util_Test_Methods();  
    //Agile_Release__c res= testHandler.createRelease('SAFeRelease');
    id theData = lstory[0].Id;
    Agile_Story__c story = Util_Test_Methods.createstory('SAFestory', lSprint.get(0).Id,lfeature.get(0).Id);
    string statusvalue = 'In Progress';  
   
        
    string selectedcheckboxvaluess = null;
    string[] str = new string[] {'In Progress'};

    Cls_KanBanStoryBoard testController = new Cls_KanBanStoryBoard(sc);
    testController.selectedrelease = lRelease[0].Name;
    testController.selectedMilestones = lMilestone[0].Milestone_Name__c;
    testController.selectedSprints =  lSprint[0].Name;
    testController.selectedTrain = lstory[0].Release_Train__c;
    testController.selectedTeam = lstory[0].Team_Story__c;
    testController.setselectedcheckboxvaluess(str);
    testController.getselectedcheckboxvaluess();
    testController.searchresults();
    testController.getrelease();
    testController.getMilestones();
    testController.getSprints();
    testController.getStories();
    testController.getTrainValues();
    testController.getTeamValues();
    testController.getStatusValues();
    testController.getselectedcheckboxvaluess();
    testController.pagereload();
    Cls_KanBanStoryBoard.updaterequest(theData, statusvalue);
    Test.stopTest(); 
}
    
public static testMethod void Cls_KanBanStoryBoard_positivetestwithselectedvalues(){   
    //string statusvalue = 'In Progress';

    List<Agile_Release__c> lRelease = new List<Agile_Release__c>();
    List<Agile_Milestone__c> lMilestone = new List<Agile_Milestone__c>();
    List<Agile_Sprint__c> lSprint = new List<Agile_Sprint__c>();
    list<Agile_Feature__c> lfeature = new list<Agile_Feature__c>();
    list<Agile_Story__c> lstory = new list<Agile_Story__c>();
  
    for(Integer i=0; i<10;i++){
            lRelease.add(Util_Test_Methods.createRelease('SAFeRelease'+i));
        }
        insert lRelease;
    
    for(Integer i=0; i<10;i++){
            lMilestone.add(Util_Test_Methods.createMilesStone('SAFeMileStone'+i, lRelease.get(i).Id));
        }
        insert lMilestone;
    
     for(Integer i=0; i<10;i++){
            lSprint.add(Util_Test_Methods.createSprint('SAFeSprint'+i, lMilestone.get(i).Id));
        }
        insert lSprint;
    
    for(Integer i=0; i<10;i++){
            lfeature.add(Util_Test_Methods.createFeature('SAFefeature'+i, lMilestone.get(i).Id,'SFEefeaturedesc'));
        }
        insert lfeature;
                          
     for(Integer i=0; i<10;i++){
            lstory.add(Util_Test_Methods.createstory('SAFestory'+i, lSprint.get(i).Id,lfeature.get(i).Id));
        }
        insert lstory;        
    
     
                
     Test.startTest();
    
  ApexPAges.StandardController sc = new ApexPages.StandardController(lstory[0]);
  ApexPages.CurrentPage().getparameters().put('id', lRelease[0].id);
    //Util_Test_Methods testHandler = new Util_Test_Methods();  
    //Agile_Release__c res= testHandler.createRelease('SAFeRelease');
    id theData = lstory[0].Id;
    Agile_Story__c story = Util_Test_Methods.createstory('SAFestory', lSprint.get(0).Id,lfeature.get(0).Id);
    string statusvalue = 'In Progress';  
   
        
    string selectedcheckboxvaluess = null;
    string[] str = new string[] {};

    Cls_KanBanStoryBoard testController = new Cls_KanBanStoryBoard(sc);
    testController.selectedrelease = lRelease[0].Name;
    testController.selectedMilestones = lMilestone[0].Milestone_Name__c;
    testController.selectedSprints =  lSprint[0].Name;
    testController.selectedTrain = lstory[0].Release_Train__c;
    testController.selectedTeam = '- None -';
    testController.setselectedcheckboxvaluess(str);
    testController.getselectedcheckboxvaluess();
    testController.searchresults();
    testController.getrelease();
    testController.getMilestones();
    testController.getSprints();
    testController.getStories();
    testController.getTrainValues();
    testController.getTeamValues();
    testController.getStatusValues();
    testController.getselectedcheckboxvaluess();
    testController.pagereload();
    Cls_KanBanStoryBoard.updaterequest(theData, statusvalue);
    Test.stopTest(); 
}

public static testMethod void Cls_KanBanStoryBoard_selectedvalues(){   
    //string statusvalue = 'In Progress';

    List<Agile_Release__c> lRelease = new List<Agile_Release__c>();
    List<Agile_Milestone__c> lMilestone = new List<Agile_Milestone__c>();
    List<Agile_Sprint__c> lSprint = new List<Agile_Sprint__c>();
    list<Agile_Feature__c> lfeature = new list<Agile_Feature__c>();
    list<Agile_Story__c> lstory = new list<Agile_Story__c>();
  
    for(Integer i=0; i<10;i++){
            lRelease.add(Util_Test_Methods.createRelease('SAFeRelease'+i));
        }
        insert lRelease;
    
    for(Integer i=0; i<10;i++){
            lMilestone.add(Util_Test_Methods.createMilesStone('SAFeMileStone'+i, lRelease.get(i).Id));
        }
        insert lMilestone;
    
     for(Integer i=0; i<10;i++){
            lSprint.add(Util_Test_Methods.createSprint('SAFeSprint'+i, lMilestone.get(i).Id));
        }
        insert lSprint;
    
    for(Integer i=0; i<10;i++){
            lfeature.add(Util_Test_Methods.createFeature('SAFefeature'+i, lMilestone.get(i).Id,'SFEefeaturedesc'));
        }
        insert lfeature;
                          
     for(Integer i=0; i<10;i++){
            lstory.add(Util_Test_Methods.createstory('SAFestory'+i, lSprint.get(i).Id,lfeature.get(i).Id));
        }
        insert lstory;        
    
     
                
     Test.startTest();
    
  ApexPAges.StandardController sc = new ApexPages.StandardController(lstory[0]);
  ApexPages.CurrentPage().getparameters().put('id', lRelease[0].id);
    //Util_Test_Methods testHandler = new Util_Test_Methods();  
    //Agile_Release__c res= testHandler.createRelease('SAFeRelease');
    id theData = lstory[0].Id;
    Agile_Story__c story = Util_Test_Methods.createstory('SAFestory', lSprint.get(0).Id,lfeature.get(0).Id);
    string statusvalue = 'In Progress';  
   
        
    string selectedcheckboxvaluess = null;
    string[] str = new string[] {};

    Cls_KanBanStoryBoard testController = new Cls_KanBanStoryBoard(sc);
    testController.selectedrelease = lRelease[0].Name;
    testController.selectedMilestones = lMilestone[0].Milestone_Name__c;
    testController.selectedSprints =  lSprint[0].Name;
    testController.selectedTrain = '- None -';
    testController.selectedTeam = '- None -';
    testController.setselectedcheckboxvaluess(str);
    testController.getselectedcheckboxvaluess();
    testController.searchresults();
    testController.getrelease();
    testController.getMilestones();
    testController.getSprints();
    testController.getStories();
    testController.getTrainValues();
    testController.getTeamValues();
    testController.getStatusValues();
    testController.getselectedcheckboxvaluess();
    testController.pagereload();
    Cls_KanBanStoryBoard.updaterequest(theData, statusvalue);
     //system.assertEquals(testController.showresults, true);
    Test.stopTest(); 
} 
    
public static testMethod void Cls_KanBanStoryBoard_Negativetest(){   
    //string statusvalue = 'In Progress';

    List<Agile_Release__c> lRelease = new List<Agile_Release__c>();
    List<Agile_Milestone__c> lMilestone = new List<Agile_Milestone__c>();
    List<Agile_Sprint__c> lSprint = new List<Agile_Sprint__c>();
    list<Agile_Feature__c> lfeature = new list<Agile_Feature__c>();
    list<Agile_Story__c> lstory = new list<Agile_Story__c>();
  
    for(Integer i=0; i<10;i++){
            lRelease.add(Util_Test_Methods.createRelease('SAFeRelease'+i));
        }
        insert lRelease;
    
    for(Integer i=0; i<10;i++){
            lMilestone.add(Util_Test_Methods.createMilesStone('SAFeMileStone'+i, lRelease.get(i).Id));
        }
        insert lMilestone;
    
     for(Integer i=0; i<10;i++){
            lSprint.add(Util_Test_Methods.createSprint('SAFeSprint'+i, lMilestone.get(i).Id));
        }
        insert lSprint;
    
    for(Integer i=0; i<10;i++){
            lfeature.add(Util_Test_Methods.createFeature('SAFefeature'+i, lMilestone.get(i).Id,'SFEefeaturedesc'));
        }
        insert lfeature;
                          
     for(Integer i=0; i<10;i++){
            lstory.add(Util_Test_Methods.createstory('SAFestory'+i, lSprint.get(i).Id,lfeature.get(i).Id));
        }
        insert lstory;        
    
     
                
     Test.startTest();
    
  ApexPAges.StandardController sc = new ApexPages.StandardController(lstory[0]);
  ApexPages.CurrentPage().getparameters().put('id', lRelease[0].id);
    //Util_Test_Methods testHandler = new Util_Test_Methods();  
    //Agile_Release__c res= testHandler.createRelease('SAFeRelease');
    id theData = lstory[0].Id;
    Agile_Story__c story = Util_Test_Methods.createstory('SAFestory', lSprint.get(0).Id,lfeature.get(0).Id);
    string statusvalue = 'In Progress';  
   
        
    string selectedcheckboxvaluess = null;
    string[] str = new string[] {};

    Cls_KanBanStoryBoard testController = new Cls_KanBanStoryBoard(sc);
    testController.selectedrelease = lRelease[0].Name;
    testController.selectedMilestones = lMilestone[0].Milestone_Name__c;
    testController.selectedSprints =  '- None -';
    testController.selectedTrain = '- None -';
    testController.selectedTeam = '- None -';
    testController.setselectedcheckboxvaluess(str);
    testController.getselectedcheckboxvaluess();
    testController.searchresults();
    testController.getrelease();
    testController.getMilestones();
    testController.getSprints();
    testController.getStories();
    testController.getTrainValues();
    testController.getTeamValues();
    testController.getStatusValues();
    testController.getselectedcheckboxvaluess();
    testController.pagereload();
    Cls_KanBanStoryBoard.updaterequest(theData, statusvalue);
    system.assertEquals(testController.showresults, false);
    Test.stopTest(); 
    
}    

    
}