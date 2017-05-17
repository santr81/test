Global class Cls_KanBanStoryBoard {
        
    public list<Agile_Story__c> lrequest{get;set;}
    public List<SelectOption> myList{get; set;}
    public Id Rid {get;set;}
    public string selectedrelease{get;set;}
    public string selectedMilestones{get;set;}
    public string selectedSprints{get;set;}
    public string selectedStories{get;set;}
    public string selectedOwner{get;set;}
    public boolean showresults{get;set;}
    public boolean showmessage{get;set;}
    public boolean showinfomessage{get;set;}
    public string selectedTrain{get;set;}
    public string selectedTeam{get;set;}
    public boolean selectedreleasemessage{get;set;}
    public boolean selectedmilestonemessage{get;set;}
    public boolean selectedsprintmessage{get;set;}
    public boolean selectedmessage{get;set;}
    
    String[] selectedcheckboxvaluess = new String[]{};

    public Cls_KanBanStoryBoard(ApexPages.StandardController controller) {
        selectedmessage = true;
        lrequest = new list<Agile_Story__c>();
        //Rid = controller.getId();
           //showresults = false; 
          Agile_Story__c us = new Agile_Story__c();  
          //lrequest = [select Id,Name,Status__c ,Owned_By_Story__r.Name,Sprint_Story__r.Name from Story__c];
           showmessage = false;
           //showinfomessage=true;
           showresults = false;

    }
    
    @RemoteAction
    Global static pageReference updaterequest(Id theData, String statusvalue) {
      
        Agile_Story__c updatedrequest = [ SELECT Id, Status__c
                                  FROM Agile_Story__c
                                  WHERE Id = :theData ];
    
        updatedrequest.Status__c = statusvalue;
        
        update updatedrequest;
        return null;
    }
    
     public PageReference pagereload(){
              
              selectedrelease ='';
              selectedMilestones='';
              selectedSprints=''; 
              showresults = false;
              showinfomessage =false;
              selectedmessage = true;
              //this.selectedcheckboxvaluess = null;
              //String[] selectedcheckboxvaluess = new String[]{};
              selectedcheckboxvaluess = new String[]{};
               setselectedcheckboxvaluess(null);
              
             
       return null;
     }
     
     
    public PageReference searchresults() {
        lrequest = new list<Agile_Story__c>();
        showresults = false;
        //showmessage = false;
        //showinfomessage = false;
        system.debug('search results' + selectedcheckboxvaluess);
        system.debug('search results 123' + selectedrelease);
        system.debug('search results 1234' + selectedOwner);
             //selectedrelease
            //selectedMilestones
            //selectedSprints
            //selectedOwner
            //selectedcheckboxvaluess
            
            system.debug('selectedrelease' + selectedrelease);
            system.debug('selectedMilestones' + selectedMilestones);
            system.debug('selectedSprints' + selectedSprints);
            system.debug('selectedOwner' + selectedOwner);
            system.debug('selectedcheckboxvaluess' + selectedcheckboxvaluess);
            system.debug('selectedcheckboxvaluess size' + selectedcheckboxvaluess.size());
            
           if(selectedrelease != '- None -' && selectedMilestones != '- None -' && selectedSprints != '- None -' && selectedTrain == '- None -' && selectedTeam == '- None -' && selectedcheckboxvaluess.size() == 0){
                 lrequest = [select iD,Name,Sprint_Story__c,Status__c,Owned_By_Story__r.Name,Sprint_Story__r.Name,Sprint_Story__r.Milestone_Sprint__c,
                             Sprint_Story__r.Milestone_Sprint__r.Release__r.Name,Points__c,Priority_Story__c,Rank__c from Agile_Story__c 
                             where Sprint_Story__r.Milestone_Sprint__r.Release__r.Name like :selectedrelease
                             and Sprint_Story__r.Milestone_Sprint__r.Milestone_Name__c like:selectedMilestones
                             and Sprint_Story__r.Name like:selectedSprints
                             ];
            } else if(selectedrelease != '- None -' && selectedMilestones != '- None -' && selectedSprints!= '- None -' && selectedTrain != '- None -' && selectedTeam == '- None -' && selectedcheckboxvaluess.size() == 0){
                 lrequest = [select iD,Name,Sprint_Story__c,Status__c,Owned_By_Story__r.Name,Sprint_Story__r.Name,Sprint_Story__r.Milestone_Sprint__c,
                             Sprint_Story__r.Milestone_Sprint__r.Release__r.Name,Points__c,Priority_Story__c,Rank__c from Agile_Story__c 
                             where Sprint_Story__r.Milestone_Sprint__r.Release__r.Name like :selectedrelease
                             and Sprint_Story__r.Milestone_Sprint__r.Milestone_Name__c like:selectedMilestones
                             and Sprint_Story__r.Name like:selectedSprints
                             and Release_Train__c like:selectedTrain];
            } else if(selectedrelease != '- None -' && selectedMilestones != '- None -' && selectedSprints != '- None -' && selectedTrain != '- None -' && selectedTeam != '- None -' && selectedcheckboxvaluess.size() == 0){
                 lrequest = [select iD,Name,Sprint_Story__c,Status__c,Owned_By_Story__r.Name,Sprint_Story__r.Name,Sprint_Story__r.Milestone_Sprint__c,
                             Sprint_Story__r.Milestone_Sprint__r.Release__r.Name,Points__c,Priority_Story__c,Rank__c from Agile_Story__c 
                             where Sprint_Story__r.Milestone_Sprint__r.Release__r.Name like :selectedrelease
                             and Sprint_Story__r.Milestone_Sprint__r.Milestone_Name__c like:selectedMilestones
                             and Sprint_Story__r.Name like:selectedSprints
                             and Release_Train__c like:selectedTrain
                             and Team_Story__c like:selectedTeam];
                             
            }  else if(selectedrelease != '- None -' && selectedMilestones != '- None -' && selectedSprints!= '- None -' && selectedTrain != '- None -' && selectedTeam != '- None -' && selectedcheckboxvaluess.size()>0){
                 lrequest = [select iD,Name,Sprint_Story__c,Status__c,Owned_By_Story__r.Name,Sprint_Story__r.Name,Sprint_Story__r.Milestone_Sprint__c,
                             Sprint_Story__r.Milestone_Sprint__r.Release__r.Name,Points__c,Priority_Story__c,Rank__c from Agile_Story__c 
                             where Sprint_Story__r.Milestone_Sprint__r.Release__r.Name like :selectedrelease
                             and Sprint_Story__r.Milestone_Sprint__r.Milestone_Name__c like:selectedMilestones
                             and Sprint_Story__r.Name like:selectedSprints
                             and Release_Train__c =:selectedTrain
                             and Team_Story__c =:selectedTeam
                             and Status__c IN :selectedcheckboxvaluess];
            } 
            
            /* if(!string.IsBLANK(selectedrelease) && !string.IsBLANK(selectedMilestones)){
                 lrequest = [select iD,Name,Sprint_Story__c,Status__c,Owned_By_Story__r.Name,Sprint_Story__r.Name,Sprint_Story__r.Milestone_Sprint__c,
                             Sprint_Story__r.Milestone_Sprint__r.Release__r.Name from Story__c 
                             where Sprint_Story__r.Milestone_Sprint__r.Release__r.Name like : selectedrelease and Sprint_Story__r.Milestone_Sprint__r.Milestone_Name__c like:selectedMilestones];
            }*/
            
           /* if(selectedrelease == '- None -' && selectedMilestones == '- None -' && selectedSprints == '- None -'){
                
                if(selectedrelease == '- None -'){
                    selectedreleasemessage = true;
                } else {
                    selectedreleasemessage = false;
                }
                
                if(selectedrelease != '- None -' && selectedMilestones == '- None -'){
                    selectedmilestonemessage =true;
                } else {
                    selectedmilestonemessage =false;
                }
                
                
               if(selectedrelease != '- None -' && selectedMilestones != '- None -' && selectedSprints == '- None -'){
                    selectedsprintmessage =true;
                } else {
                    selectedsprintmessage =false;

                }
                
            } */
            
            if(selectedrelease == '- None -' || selectedMilestones == '- None -' || selectedSprints == '- None -'){
                selectedmessage = true;
            } else {
                selectedmessage = false;
            }
            
            if(selectedrelease != '- None -' && selectedMilestones != '- None -' && selectedSprints != '- None -' && lrequest.size() == 0){
                showinfomessage = true;
            } else {
                showinfomessage = false;
            }
            
           
            if(lrequest.size()>0){
                showresults = true;
                //showinfomessage =false;
                showmessage=FALSE;
                //selectedmessage = true;
                 
            } else{
                showmessage=true;
                //showinfomessage =false; 
                //selectedmessage = false; 
                //selectedmessage = false;
            }
            
        return null;
    }
    
    
   
     public String[] getselectedcheckboxvaluess() {
         
        return selectedcheckboxvaluess;
    }
    
    public void setselectedcheckboxvaluess(String[] selectedcheckboxvaluess) {
        this.selectedcheckboxvaluess= selectedcheckboxvaluess;
    }
    
    public List<selectOption> getrelease() {
        
        List<selectOption> options = new List<selectOption>(); 
        
        map<Id,string> distinctLastnames = new map<Id,String>();
        //new list for holding all of the picklist options
        options.add(new selectOption('- None -', '- None -')); 
        //add the first option of '- None -' in case the user doesn't want to select a value or in case no values are returned from query below
        
        //uniquelist = [SELECT Id, Release__c,Release__r.Name FROM User_Story__c order by Release__r.Name ASC];
             
         for(Agile_Release__c u:[SELECT Id, Name FROM Agile_Release__c order by Name ASC]){
         
             distinctLastnames.put(u.Id,u.Name);
             //options.add(new selectOption(uniquelist[j].Release__c, uniquelist[j].Release__r.Name));
         }
         
         for(string s:distinctLastnames.values()){
             options.add(new selectOption(s,s));
         }
       
         
        return options; //return the picklist options
    }
    
     public List<selectOption> getMilestones() {
        List<selectOption> options = new List<selectOption>(); 
        map<Id,string> distinctLastnames = new map<Id,String>();
        //new list for holding all of the picklist options
        options.add(new selectOption('- None -', '- None -')); 
        //add the first option of '- None -' in case the user doesn't want to select a value or in case no values are returned from query below
         
         for (Agile_Milestone__c u: [SELECT Id, Milestone_Name__c FROM Agile_Milestone__c where Release__r.Name like:selectedrelease]) { 
        //query for user story records 
                     distinctLastnames.put(u.Id,u.Milestone_Name__c);
                    //options.add(new selectOption(release.OwnerId, release.Owner.Name)); 
        //for all records found - add them to the picklist options
        }
        
        for(string s:distinctLastnames.values()){
            if(s != null){
             options.add(new selectOption(s,s));
             }
         }
       
        return options; //return the picklist options
    }
    
    public List<selectOption> getSprints() {
        List<selectOption> options = new List<selectOption>(); 
        map<Id,string> distinctLastnames = new map<Id,String>();
        //new list for holding all of the picklist options
        options.add(new selectOption('- None -', '- None -')); 
        //add the first option of '- None -' in case the user doesn't want to select a value or in case no values are returned from query below
       
         for (Agile_Sprint__c u: [SELECT Id, Name FROM Agile_Sprint__c where Milestone_Sprint__r.Milestone_Name__c like:selectedMilestones]) { 
        //query for user story records 
                     distinctLastnames.put(u.Id,u.Name);
                    //options.add(new selectOption(release.OwnerId, release.Owner.Name)); 
        //for all records found - add them to the picklist options
        }
        
        for(string s:distinctLastnames.values()){
            if(s != null){
             options.add(new selectOption(s,s));
             }
         }
      
        return options; //return the picklist options
    }
    
    public List<selectOption> getStories() {
        List<selectOption> options = new List<selectOption>(); 
        map<Id,string> distinctLastnames = new map<Id,String>();
        //new list for holding all of the picklist options
        options.add(new selectOption('- None -', '- None -')); 
        //add the first option of '- None -' in case the user doesn't want to select a value or in case no values are returned from query below
         
         for (Agile_Story__c u: [SELECT Id, Name FROM Agile_Story__c where Sprint_Story__r.Name like:selectedSprints]) { 
        //query for user story records 
                     distinctLastnames.put(u.Id,u.Name);
                    //options.add(new selectOption(release.OwnerId, release.Owner.Name)); 
        //for all records found - add them to the picklist options
        }
        
        for(string s:distinctLastnames.values()){
            if(s != null){
             options.add(new selectOption(s,s));
             }
         }
       
        return options; //return the picklist options
    }
    
    public List<selectOption> getStoryowner() {
        List<selectOption> options = new List<selectOption>(); 
       // map<string,list<string>> distinct = new map<string,list<string>>();
        map<string,string> distinctLastnames = new map<string,string>();
        //new list for holding all of the picklist options
        options.add(new selectOption('- None -', '- None -')); 
        //add the first option of '- None -' in case the user doesn't want to select a value or in case no values are returned from query below
         
         for (Agile_Story__c u: [SELECT Id, Owned_By_Story__c,Name,Owned_By_Story__r.Name FROM Agile_Story__c where Sprint_Story__r.Name like:selectedSprints]) { 
        //query for user story records 
                
                     distinctLastnames.put(u.Owned_By_Story__r.Name,u.Owned_By_Story__r.Name);
                 
                    //options.add(new selectOption(release.OwnerId, release.Owner.Name)); 
        //for all records found - add them to the picklist options
        }
        
        for(string s:distinctLastnames.values()){
            if(s != null){
             options.add(new selectOption(s,s));
             }
         }
       
        return options; //return the picklist options
    }
    
    public List<SelectOption> getTrainValues(){
        List<selectOption> options = new List<selectOption>(); 
       // map<string,list<string>> distinct = new map<string,list<string>>();
        map<string,string> distinctLastnames = new map<string,string>();
        //new list for holding all of the picklist options
        options.add(new selectOption('- None -', '- None -')); 
        //add the first option of '- None -' in case the user doesn't want to select a value or in case no values are returned from query below
         
         for (Agile_Story__c u: [SELECT Id, Owned_By_Story__c,Release_Train__c,Name,Owned_By_Story__r.Name FROM Agile_Story__c where Sprint_Story__r.Name like:selectedSprints]) { 
        //query for user story records 
               
                     distinctLastnames.put(u.Release_Train__c,u.Release_Train__c);
                    
                 
                    //options.add(new selectOption(release.OwnerId, release.Owner.Name)); 
        //for all records found - add them to the picklist options
        }
        
        for(string s:distinctLastnames.values()){
            if(s != null){
             options.add(new selectOption(s,s));
             }
         }
       
        return options; //return the picklist options
    }
    
    public List<SelectOption> getTeamValues(){
       List<selectOption> options = new List<selectOption>(); 
       // map<string,list<string>> distinct = new map<string,list<string>>();
        map<string,string> distinctLastnames = new map<string,string>();
        //new list for holding all of the picklist options
        options.add(new selectOption('- None -', '- None -')); 
        //add the first option of '- None -' in case the user doesn't want to select a value or in case no values are returned from query below
        if(selectedTrain != '- None -'){  
         for (Agile_Story__c u: [SELECT Id, Owned_By_Story__c,Team_Story__c,Release_Train__c,Name,Owned_By_Story__r.Name FROM Agile_Story__c where Sprint_Story__r.Name like:selectedSprints and Release_Train__c like:selectedTrain]) { 
        //query for user story records 
                
                     distinctLastnames.put(u.Team_Story__c,u.Team_Story__c);
                 
                    //options.add(new selectOption(release.OwnerId, release.Owner.Name)); 
        //for all records found - add them to the picklist options
        }
        
        for(string s:distinctLastnames.values()){
           if(s != null){
             options.add(new selectOption(s,s));
             }
         }
       }
        return options; //return the picklist options
    }
    
    
     public List<SelectOption> getStatusValues(){
        myList =new List<SelectOption>();
      
        Schema.DescribeFieldResult f = Agile_Story__c.Status__c.getDescribe();
            List<Schema.PicklistEntry> p = f.getPicklistValues();
               for(Schema.PicklistEntry e:p){
                    myList.add(new SelectOption(e.getLabel(),e.getValue()));
            }
            return myList;
    }

}