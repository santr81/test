@isTest
public class productbacklo_Test {
    
public static testMethod void SprintPlanView(){  
    
    
  
    Test.startTest();
        PageReference pageRef = Page.NewPB; 
        Test.setCurrentPage(pageRef);
        productbacklo controller = new productbacklo();
        TreeNodes compcontroller = new TreeNodes();
    
   controller.getMilesStones();
    controller.getReleases();
    controller.getSprints();
    controller.getPriority();
    controller.getStatus();
    controller.getStoryTeam();
  controller.getStoryReleaseTrain();    
    controller.getOwners();
    controller.getStoryTeam();
    Controller.saveFilter();
    Controller.searchWithFilter();
    Controller.dummyRender();
    
    Test.stopTest(); 
    
} 
    public static testMethod void SprintPlanView_WithId(){   
     Test.startTest();   
        list<AgileViewFilter__c> lavf =  new list<AgileViewFilter__c>(); 
        List<Agile_Release__c> lRelease = new List<Agile_Release__c>();
        List<Agile_Milestone__c> lMilestone = new List<Agile_Milestone__c>();
        List<Agile_Sprint__c> lSprint = new List<Agile_Sprint__c>();
        list<Agile_Feature__c> lfeature = new list<Agile_Feature__c>();
        list<Agile_Story__c> lstory = new list<Agile_Story__c>();
        list<user> luser = new list<user>();
        
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
        
         for(Integer i=0; i<10;i++){
            luser.add(Util_Test_Methods.createUser('System Administrator','Test'+i));
        }
        insert luser;
        
        
        for(integer i=0;i<10;i++){
            lavf.add(Util_Test_Methods.createagileviewfilter('Test'+i,lRelease[i].Id,lMilestone[i].Id,lSprint[i].Id,luser[i].Id));
        }
      insert lavf;  
       
    
        PageReference pageRef = Page.NewPB; 
       
        Test.setCurrentPage(pageRef);
        productbacklo controller = new productbacklo();

        
     ApexPages.CurrentPage().getParameters().put('Id',lavf[0].Id);
        
        
    controller = new productbacklo();
   controller.getMilesStones();
    controller.getReleases();
    controller.getSprints();
    controller.getPriority();
    controller.getStatus();
    controller.getStoryTeam();
  controller.getStoryReleaseTrain();    
    controller.getOwners();
    controller.getStoryTeam();
    Controller.saveFilter();
    Controller.searchWithFilter();
    Controller.dummyRender();

        TreeViewHandshake ths = new TreeViewHandshake();
        List<String> selectedMilesStonesList = new List<String>{lMilestone[0].Milestone_Name__c};
        
        ths.getSelectedMilesStones();
        ths.setSelectedMilesStones(selectedMilesStonesList);
         
        TreeNodes treenodecontroller = new TreeNodes(); 
        treenodecontroller.treeViewHandShkInst = ths;
        string[] releasename = new string[]{lRelease[0].Name};
        string[] milestonename = new string[]{lMilestone[0].Milestone_Name__c}; 
        string[] sprintname = new string[]{lSprint[0].Name}; 
        string[] ownername = new string[]{luser[0].Name};
        string[] priorityname = new string[]{'High'};
        string[] statusname = new string[]{'In Progress'};
        string[] trainname = new string[]{'ReleaseTrain1'};
        string[] teamname = new string[]{'ReleaseTrain1Team1'};
        treenodecontroller.treeViewHandShkInst.selectedReleases = releasename;
        treenodecontroller.treeViewHandShkInst.selectedMilesStones = milestonename;
        treenodecontroller.treeViewHandShkInst.selectedSprints = sprintname;
        treenodecontroller.treeViewHandShkInst.selectedOwners = ownername;
        treenodecontroller.treeViewHandShkInst.selectedPriority = priorityname;
        treenodecontroller.treeViewHandShkInst.selectedStatus = statusname;
        treenodecontroller.treeViewHandShkInst.selectedStoryReleaseTrain =trainname;
        treenodecontroller.treeViewHandShkInst.selectedStoryTeam = teamname;
        treenodecontroller.saveRec();
        treenodecontroller.getMainNodes();
        treenodecontroller.getDummyVariable();
        
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
        
        //asr.Points__c = '2';        
        //Update asr;
        
        productbacklo.updaterequest(asr.Id,asp.Id);
    
        
        //List<treenodecontroller.cNodes> wrap = hierarchy;
        //wrapperclass.cNodes();
        //controller1.initialize();
    
    Test.stopTest(); 
    
}
    
    public static testMethod void SprintPlanView_NegativeTest(){   
     Test.startTest();   
        list<AgileViewFilter__c> lavf =  new list<AgileViewFilter__c>(); 
        List<Agile_Release__c> lRelease = new List<Agile_Release__c>();
        List<Agile_Milestone__c> lMilestone = new List<Agile_Milestone__c>();
        List<Agile_Sprint__c> lSprint = new List<Agile_Sprint__c>();
        list<Agile_Feature__c> lfeature = new list<Agile_Feature__c>();
        list<Agile_Story__c> lstory = new list<Agile_Story__c>();
        list<user> luser = new list<user>();
        
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
        
         for(Integer i=0; i<10;i++){
            luser.add(Util_Test_Methods.createUser('System Administrator','Test'+i));
        }
        insert luser;
        
        
        for(integer i=0;i<10;i++){
            lavf.add(Util_Test_Methods.createagileviewfilter('Test'+i,lRelease[i].Id,lMilestone[i].Id,lSprint[i].Id,luser[i].Id));
        }
      insert lavf;  
       
    
        PageReference pageRef = Page.NewPB; 
       
        Test.setCurrentPage(pageRef);
        productbacklo controller = new productbacklo();

        
     ApexPages.CurrentPage().getParameters().put('Id',lavf[0].Id);
        
        
    controller = new productbacklo();
   controller.getMilesStones();
    controller.getReleases();
    controller.getSprints();
    controller.getPriority();
    controller.getStatus();
    controller.getStoryTeam();
  controller.getStoryReleaseTrain();    
    controller.getOwners();
    controller.getStoryTeam();
    Controller.saveFilter();
    Controller.searchWithFilter();
    Controller.dummyRender();

        TreeViewHandshake ths = new TreeViewHandshake();
        List<String> selectedMilesStonesList = new List<String>{lMilestone[0].Milestone_Name__c};
        
        ths.getSelectedMilesStones();
        ths.setSelectedMilesStones(selectedMilesStonesList);
         
        TreeNodes treenodecontroller = new TreeNodes(); 
        treenodecontroller.treeViewHandShkInst = ths;
       
        string[] releasename = new string[]{lRelease[0].Name};
        string[] milestonename = new string[]{}; 
        string[] sprintname = new string[]{lSprint[0].Name}; 
        string[] ownername = new string[]{luser[0].Name};
        string[] priorityname = new string[]{'High'};
        string[] statusname = new string[]{'In Progress','Not Started'};
        string[] trainname = new string[]{'ReleaseTrain1'};
        string[] teamname = new string[]{'ReleaseTrain1Team1'};
        treenodecontroller.hierarchy = new list<TreeNodes.cNodes>(); 
        treenodecontroller.setMainNodes(treenodecontroller.hierarchy);
        //TreeNodes.cNodes wrapper = new TreeNodes.cNodes();
        treenodecontroller.treeViewHandShkInst.selectedReleases = releasename;
        treenodecontroller.treeViewHandShkInst.selectedMilesStones = milestonename;
        treenodecontroller.treeViewHandShkInst.selectedSprints = sprintname;
        treenodecontroller.treeViewHandShkInst.selectedOwners = ownername;
        treenodecontroller.treeViewHandShkInst.selectedPriority = priorityname;
        treenodecontroller.treeViewHandShkInst.selectedStatus = statusname;
        treenodecontroller.treeViewHandShkInst.selectedStoryReleaseTrain =trainname;
        treenodecontroller.treeViewHandShkInst.selectedStoryTeam = teamname;
        treenodecontroller.saveRec();
        treenodecontroller.getMainNodes();
        treenodecontroller.getDummyVariable();
    
        
        //List<treenodecontroller.cNodes> wrap = hierarchy;
        //wrapperclass.cNodes();
        //controller1.initialize();
    
    Test.stopTest(); 
    
}
}