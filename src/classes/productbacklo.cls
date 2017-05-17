public class productbacklo{
    public TreeViewHandshake treeViewHandshakeInstanceet{get;set;}
    public AgileViewFilter__c filterInst {get;set;}
    public Boolean showTreeView {get;set;}
    public Boolean showErrortreeview{get;set;}
    public List<String> selectedMilesStones {get;set;}
    public boolean showmessage{get;set;}
    public List<String> selectedSprints {get;set;}
    public List<String> selectedReleases {get;set;}
    public List<String> selectedOwners {get;set;}
 
    public Agile_Story__c lreques {get;set;}
    public boolean selectedmessage{get;set;} 
    public boolean showinfomessage{get;set;}

    public Agile_Story__c storyObj {get;set;}
   
    public String searchName {get;set;}
    public String hiddenSearchName {get;set;}
    public String hiddenTeamName {get;set;}
    public string hiddenTrainName{get;set;}
    public Agile_Story__c updatedrequest{get;set;}
    
    
  //  public String p1{get; set;}
    

   
    
    
    public List<Agile_Milestone__c> lmilesStones{get;set;}
    public List<Agile_Release__c> lReleases{get;set;}
    public List<Agile_Sprint__c> lSprints{get;set;}
    public list<Agile_Story__c> lrequest{get;set;}
  


    public List<SelectOption> releases = new List<SelectOption>();
    public List<SelectOption> getReleases(){
        releases = new List<SelectOption>();
        for (Agile_Release__c tempRel : lReleases ){
            releases.add(new SelectOption(tempRel.Name, tempRel.Name));  
        }
        return releases;
    }
    
    private List<SelectOption> status = new List<SelectOption>();
    public List<SelectOption> getStatus(){
        return status;
    }
    
    private List<SelectOption> storyTeam = new List<SelectOption>();
    public List<SelectOption> getStoryTeam(){
        return storyTeam;
    }
    
    private List<SelectOption> storyReleaseTrain = new List<SelectOption>();
    public List<SelectOption> getStoryReleaseTrain(){
        return storyReleaseTrain;
    }
    
    private List<SelectOption> priority = new List<SelectOption>();
    public List<SelectOption> getPriority(){
        return priority;
    }
    
    public List<SelectOption> milesStones = new List<SelectOption>();
    public List<SelectOption> getMilesStones(){
        milesStones = new List<SelectOption>();
        Set<String> tempStrinsToCompare = new Set<String>(treeViewHandshakeInstanceet.selectedReleases);
         system.debug('selectedReleases' + selectedReleases);
        for (Agile_Milestone__c tempMile : lmilesStones){
            if(!tempStrinsToCompare.isEmpty()){
                if(tempStrinsToCompare.contains(tempMile.Release__r.Name)){
                    milesStones.add(new SelectOption(tempMile.Milestone_Name__c, tempMile.Milestone_Name__c));  
                }  
            }else{
                milesStones.add(new SelectOption(tempMile.Milestone_Name__c, tempMile.Milestone_Name__c));  
            }
        }
        return milesStones;
    }
    
    
    public List<SelectOption> sprints = new List<SelectOption>();
    public List<SelectOption> getSprints(){
        sprints = new List<SelectOption>();
        Set<String> tempStrinsToCompare = new Set<String>(treeViewHandshakeInstanceet.selectedMilesStones);
        system.debug('selectedMilestones' + tempStrinsToCompare );
        for (Agile_Sprint__c tempStr : [SELECT Id, Name,Milestone_Sprint__r.Milestone_Name__c FROM Agile_Sprint__c where Milestone_Sprint__r.Milestone_Name__c like:tempStrinsToCompare ORDER BY Start_Date__c ASC]){
            if(!tempStrinsToCompare.isEmpty()){
                if(tempStrinsToCompare.contains(tempStr.Milestone_Sprint__r.Milestone_Name__c)){
                    sprints.add(new SelectOption(tempStr.Name, tempStr.Name));  
                }  
            }else{
                sprints.add(new SelectOption(tempStr.Name, tempStr.Name));  
            }
        }
        return sprints;
    }
    
 
  
    
    public List<SelectOption> owners = new List<SelectOption>();
    public List<SelectOption> getOwners(){
        return owners;
    }
    
     @RemoteAction
    public static PageReference updaterequest(Id theData, String statusvalue) {
    
        
        
        system.debug('theData -->'+ theData);
        system.debug('statusvalue -->'+ statusvalue);
      
         Agile_Story__c updatedrequest = [ SELECT Id,Sprint_Story__c, Status__c,Points__c,Priority_Story__c
                                  FROM Agile_Story__c
                                  WHERE Id = :theData ];
                                  
        list<Agile_Sprint__c> updatedsprint = [select Id,Name from Agile_Sprint__c where id=:statusvalue limit 1];                          
        system.debug('updatedsprint[0].Id' + updatedsprint[0].Id);
        
        updatedrequest.Sprint_Story__c = updatedsprint[0].Id;
        
    try{
        update updatedrequest;
        }
        catch(Exception e) {
         {
            String error = e.getMessage();
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,error));
        }
        
    System.debug('The following exception has occurred: ' + e.getMessage());
}
        
         
        return null;
    }

    
    public productbacklo(){
        showTreeView = true;
        showErrortreeview = false;
        treeViewHandshakeInstanceet = new TreeViewHandshake();
        hiddenSearchName = '';
        hiddenTeamName = '';
        lmilesStones = new List<Agile_Milestone__c>();
        lReleases = new List<Agile_Release__c>();
        
        
        
        
        lSprints = new List<Agile_Sprint__c>();
        selectedMilesStones= new List<String>();
        selectedSprints = new List<String>();
       
        selectedReleases = new List<String>();
        filterInst = new AgileViewFilter__c();
        status = getPicklistValues(new Agile_Story__c(), 'Status__c');
        priority = getPicklistValues(new Agile_Story__c(), 'Priority_Story__c');
        storyTeam = getPicklistValues(new Agile_Story__c(), 'Team_Story__c');
        storyReleaseTrain = getPicklistValues(new Agile_Story__c(), 'Release_Train__c');
        String filterId  = ApexPages.currentPage().getParameters().get('Id');
       
        
           
           
       
        
        if(filterId!=null){
         
            filterInst = [SELECT Id,Name,MilesStone__c,StoryTeam__c,StoryReleaseTrain__c,Release_Train__c,Team_ViewFilter__c,Sprint__c,Release__c,Owner__c,Priority__c,Status__c FROM AgileViewFilter__c WHERE Id = :filterId];
             
             
            
            if(filterInst!=null){
                if(filterInst.MilesStone__c!=null){
                    for(String tempStr : filterInst.MilesStone__c.Split(';')){
                        treeViewHandshakeInstanceet.selectedMilesStones.add(tempStr);
                    } 
                }
                if(filterInst.Release__c!=null){
                    for(String tempStr : filterInst.Release__c.Split(';')){
                        treeViewHandshakeInstanceet.selectedReleases.add(tempStr);
                    } 
                }
                if(filterInst.Sprint__c!=null){
                    for(String tempStr : filterInst.Sprint__c.Split(';')){
                        treeViewHandshakeInstanceet.selectedSprints.add(tempStr);
                    } 
                }
                if(filterInst.Status__c!=null){
                    for(String tempStr : filterInst.Status__c.Split(';')){
                        treeViewHandshakeInstanceet.selectedStatus.add(tempStr);
                    } 
                }
                if(filterInst.Priority__c!=null){
                    for(String tempStr : filterInst.Priority__c.Split(';')){
                        treeViewHandshakeInstanceet.selectedPriority.add(tempStr);
                    } 
                }
                if(filterInst.Owner__c!=null){
                    for(String tempStr : filterInst.Owner__c.Split(';')){
                        treeViewHandshakeInstanceet.selectedOwners.add(tempStr);
                    } 
                }
                if(filterInst.StoryReleaseTrain__c!=null){
                    for(String tempStr : filterInst.StoryReleaseTrain__c.Split(';')){
                        treeViewHandshakeInstanceet.selectedStoryReleaseTrain.add(tempStr);
                    } 
                }
                if(filterInst.StoryTeam__c!=null){
                    for(String tempStr : filterInst.StoryTeam__c.Split(';')){
                        treeViewHandshakeInstanceet.selectedStoryTeam.add(tempStr);
                    } 
                }
                
            }
        }else{
            showTreeView = false;
        }
        constructMap();
    }
    
    private void constructMap(){
    
        lReleases = [SELECT Id,Name FROM Agile_Release__c];
        lmilesStones = [SELECT Id,Name,Release__r.Name,Milestone_Name__c,Release__c FROM Agile_Milestone__c];
       // lrequest =  [SELECT Id,Name,Owned_By_Story__c,As_A__c,Team_Story__c,Progress__c,Status__c,Rank__c,Criteria_for_Current_Future_Sprints__c,Priority_Story__c,Points__c, Sprint_Story__c,Release_Train__c,Sprint_Story__r.Milestone_Sprint__c,Owned_By_Story__r.Name,Sprint_Story__r.Name FROM Agile_Story__c ];
        
        system.debug('lMileStones' + lmilesStones);
        system.debug('lrequest ' + lrequest );
        lSprints = [SELECT Id,Name,Sprint_Progress__c,Milestone_Sprint__c,Milestone_Sprint__r.Milestone_Name__c FROM Agile_Sprint__c];
        for (User tempUser : [SELECT Id,Name FROM User WHERE Profile.Name = 'System Administrator']){
                owners.add(new SelectOption(tempUser.Name , tempUser.Name));  
        }
    } 
    
   
    
    public PageReference saveFilter(){
        String tempStrToBeUpdated = '';
        filterInst.Team_ViewFilter__c = hiddenTeamName;
        filterInst.Release_Train__c = hiddenTrainName;
        
        Boolean firstIteration = true;
        for(String Str : treeViewHandshakeInstanceet.selectedReleases ){
            if(firstIteration) {
                tempStrToBeUpdated = Str;
                firstIteration = false;
            } else {              
                tempStrToBeUpdated = tempStrToBeUpdated + ';' + Str;
            }
        }
       filterInst.Release__c = tempStrToBeUpdated;
       tempStrToBeUpdated = '';
       firstIteration = true;
       for(String Str : treeViewHandshakeInstanceet.selectedMilesStones) {
            if(firstIteration) {
                tempStrToBeUpdated = Str;
                firstIteration = false;
            } else {              
                tempStrToBeUpdated = tempStrToBeUpdated + ';' + Str;
            }
        }
        filterInst.MilesStone__c = tempStrToBeUpdated;
        firstIteration = true;
        tempStrToBeUpdated = '';
        for(String Str : treeViewHandshakeInstanceet.selectedSprints) {
            if(firstIteration) {
                tempStrToBeUpdated = Str;
                firstIteration = false;
            } else {              
                tempStrToBeUpdated = tempStrToBeUpdated + ';' + Str;
            }
        }
        filterInst.Sprint__c = tempStrToBeUpdated;
        firstIteration = true;
        tempStrToBeUpdated = '';
        
        for(String Str : treeViewHandshakeInstanceet.selectedStatus) {
            if(firstIteration) {
                tempStrToBeUpdated = Str;
                firstIteration = false;
            } else {              
                tempStrToBeUpdated = tempStrToBeUpdated + ';' + Str;
            }
        }
        filterInst.Status__c = tempStrToBeUpdated;
        firstIteration = true;
        tempStrToBeUpdated = '';
        for(String Str : treeViewHandshakeInstanceet.selectedPriority) {
            if(firstIteration) {
                tempStrToBeUpdated = Str;
                firstIteration = false;
            } else {              
                tempStrToBeUpdated = tempStrToBeUpdated + ';' + Str;
            }
        }
        filterInst.Priority__c = tempStrToBeUpdated;
        firstIteration = true;
        tempStrToBeUpdated = '';
        for(String Str : treeViewHandshakeInstanceet.selectedOwners) {
            if(firstIteration) {
                tempStrToBeUpdated = Str;
                firstIteration = false;
            } else {              
                tempStrToBeUpdated = tempStrToBeUpdated + ';' + Str;
            }
        }
        filterInst.Owner__c = tempStrToBeUpdated;
        firstIteration = true;
        tempStrToBeUpdated = '';
        for(String Str : treeViewHandshakeInstanceet.selectedStoryTeam) {
            if(firstIteration) {
                tempStrToBeUpdated = Str;
                firstIteration = false;
            } else {              
                tempStrToBeUpdated = tempStrToBeUpdated + ';' + Str;
            }
        }
        filterInst.StoryTeam__c = tempStrToBeUpdated;
        firstIteration = true;
        tempStrToBeUpdated = '';
        for(String Str : treeViewHandshakeInstanceet.selectedStoryReleaseTrain) {
            if(firstIteration) {
                tempStrToBeUpdated = Str;
                firstIteration = false;
            } else {              
                tempStrToBeUpdated = tempStrToBeUpdated + ';' + Str;
            }
        }
        filterInst.StoryReleaseTrain__c = tempStrToBeUpdated;
        
        Database.upsert(filterInst,false);
        return null;
    }
    
    private list<SelectOption> getPicklistValues(SObject obj, String fld){
        List<SelectOption> options;
            options = new List<SelectOption>();
            Schema.sObjectType objType = obj.getSObjectType(); 
            Schema.DescribeSObjectResult objDescribe = objType.getDescribe();       
            Map<String, Schema.SObjectField> fieldMap = objDescribe.fields.getMap(); 
            List<Schema.PicklistEntry> values =
            fieldMap.get(fld).getDescribe().getPickListValues();
            for (Schema.PicklistEntry a : values){ 
                options.add(new SelectOption(a.getLabel(), a.getValue())); 
            }
        return options;
   }
   
 
     public Pagereference searchWithFilter(){
        //if(filterInst.Id!=null){
       
          showTreeView = false;
          lSprints = new list<Agile_Sprint__c >();
          lrequest = new List<Agile_Story__c>();
    
            system.debug('selectedrelease' + treeViewHandshakeInstanceet.selectedReleases );
            system.debug('selectedMilestones' + treeViewHandshakeInstanceet.selectedMilesStones );
            system.debug('selectedSprints' + treeViewHandshakeInstanceet.selectedSprints.size() );  
            system.debug('sp' + treeViewHandshakeInstanceet.selectedPriority.size() );      
            

      lSprints = [SELECT Id,Name,Sprint_Progress__c,Milestone_Sprint__c,Milestone_Sprint__r.Milestone_Name__c FROM Agile_Sprint__c 
      where Milestone_Sprint__r.Release__r.Name like :treeViewHandshakeInstanceet.selectedReleases 
                             and Milestone_Sprint__r.Milestone_Name__c like:treeViewHandshakeInstanceet.selectedMilesStones 
                          
                             and (Name like:treeViewHandshakeInstanceet.selectedSprints) ORDER BY Start_Date__c ASC LIMIT 4 ];
    
                        
     // lrequest =  [SELECT Id,Name,Owned_By_Story__c,As_A__c,Team_Story__c,Progress__c,Status__c,Rank__c,Criteria_for_Current_Future_Sprints__c,Priority_Story__c,Points__c, Sprint_Story__c,Release_Train__c,Sprint_Story__r.Milestone_Sprint__c,Owned_By_Story__r.Name,Sprint_Story__r.Name FROM Agile_Story__c ];
                        
     
     
       if(treeViewHandshakeInstanceet.selectedReleases != null && treeViewHandshakeInstanceet.selectedMilesStones != null && treeViewHandshakeInstanceet.selectedSprints != null && treeViewHandshakeInstanceet.selectedPriority.size()==0 && treeViewHandshakeInstanceet.selectedStatus.size() ==0
       &&  treeViewHandshakeInstanceet.selectedOwners.size() == 0  && treeViewHandshakeInstanceet.selectedStoryTeam.size() == 0 && treeViewHandshakeInstanceet.selectedStoryReleaseTrain.size() == 0 ){
                 lrequest = [select iD,Name,Sprint_Story__c,Status__c,Owned_By_Story__r.Name,Sprint_Story__r.Name,Sprint_Story__r.Milestone_Sprint__c,
                             Sprint_Story__r.Milestone_Sprint__r.Release__r.Name,Points__c,Progress__c,Priority_Story__c,Rank__c from Agile_Story__c 
                             where Sprint_Story__r.Milestone_Sprint__r.Release__r.Name like :treeViewHandshakeInstanceet.selectedReleases
                             and Sprint_Story__r.Milestone_Sprint__r.Milestone_Name__c like:treeViewHandshakeInstanceet.selectedMilesStones
                             and Sprint_Story__r.Name like:treeViewHandshakeInstanceet.selectedSprints
                             ];
            }
            
             else if(treeViewHandshakeInstanceet.selectedReleases != null && treeViewHandshakeInstanceet.selectedMilesStones != null && treeViewHandshakeInstanceet.selectedSprints != null && treeViewHandshakeInstanceet.selectedPriority.size()!=0 && treeViewHandshakeInstanceet.selectedStatus.size() ==0
       &&  treeViewHandshakeInstanceet.selectedOwners.size() == 0  && treeViewHandshakeInstanceet.selectedStoryTeam.size() == 0 && treeViewHandshakeInstanceet.selectedStoryReleaseTrain.size() == 0 ){
                 lrequest = [select iD,Name,Sprint_Story__c,Status__c,Owned_By_Story__r.Name,Sprint_Story__r.Name,Sprint_Story__r.Milestone_Sprint__c,
                             Sprint_Story__r.Milestone_Sprint__r.Release__r.Name,Points__c,Progress__c,Priority_Story__c,Rank__c from Agile_Story__c 
                             where Sprint_Story__r.Milestone_Sprint__r.Release__r.Name like :treeViewHandshakeInstanceet.selectedReleases
                             and Sprint_Story__r.Milestone_Sprint__r.Milestone_Name__c like:treeViewHandshakeInstanceet.selectedMilesStones
                             and Sprint_Story__r.Name like:treeViewHandshakeInstanceet.selectedSprints
                             
                             and Priority_Story__c like:treeViewHandshakeInstanceet.selectedPriority];
            } 
            
            else if(treeViewHandshakeInstanceet.selectedReleases != null && treeViewHandshakeInstanceet.selectedMilesStones != null && treeViewHandshakeInstanceet.selectedSprints != null && treeViewHandshakeInstanceet.selectedPriority.size()!=0 && treeViewHandshakeInstanceet.selectedStatus.size() !=0
       &&  treeViewHandshakeInstanceet.selectedOwners.size() == 0  && treeViewHandshakeInstanceet.selectedStoryTeam.size() == 0 && treeViewHandshakeInstanceet.selectedStoryReleaseTrain.size() == 0 ){
                 lrequest = [select iD,Name,Sprint_Story__c,Status__c,Owned_By_Story__r.Name,Sprint_Story__r.Name,Sprint_Story__r.Milestone_Sprint__c,
                             Sprint_Story__r.Milestone_Sprint__r.Release__r.Name,Points__c,Progress__c,Priority_Story__c,Rank__c from Agile_Story__c 
                             where Sprint_Story__r.Milestone_Sprint__r.Release__r.Name like :treeViewHandshakeInstanceet.selectedReleases
                             and Sprint_Story__r.Milestone_Sprint__r.Milestone_Name__c like:treeViewHandshakeInstanceet.selectedMilesStones
                             and Sprint_Story__r.Name like:treeViewHandshakeInstanceet.selectedSprints
                             
                             and Priority_Story__c like:treeViewHandshakeInstanceet.selectedPriority
                              and Status__c like:treeViewHandshakeInstanceet.selectedStatus
                           
                             ];
                             
            } 
            
            else if(treeViewHandshakeInstanceet.selectedReleases != null && treeViewHandshakeInstanceet.selectedMilesStones != null && treeViewHandshakeInstanceet.selectedSprints != null && treeViewHandshakeInstanceet.selectedPriority.size()!=0 && treeViewHandshakeInstanceet.selectedStatus.size() !=0
       &&  treeViewHandshakeInstanceet.selectedOwners.size() != 0  && treeViewHandshakeInstanceet.selectedStoryTeam.size() == 0 && treeViewHandshakeInstanceet.selectedStoryReleaseTrain.size() == 0 ){
                 lrequest = [select iD,Name,Sprint_Story__c,Status__c,Priority_Story__c,Owned_By_Story__r.Name,Sprint_Story__r.Name,Sprint_Story__r.Milestone_Sprint__c,
                             Sprint_Story__r.Milestone_Sprint__r.Release__r.Name,Points__c,Progress__c,Rank__c from Agile_Story__c 
                             where Sprint_Story__r.Milestone_Sprint__r.Release__r.Name like :treeViewHandshakeInstanceet.selectedReleases
                             and Sprint_Story__r.Milestone_Sprint__r.Milestone_Name__c like:treeViewHandshakeInstanceet.selectedMilesStones
                             and Sprint_Story__r.Name like:treeViewHandshakeInstanceet.selectedSprints
                             
                             and Priority_Story__c like:treeViewHandshakeInstanceet.selectedPriority
                            
                             and Status__c like:treeViewHandshakeInstanceet.selectedStatus
                            
                             and Owned_By_Story__r.Name like:treeViewHandshakeInstanceet.selectedOwners
                             ];
              }  
                           
             else if(treeViewHandshakeInstanceet.selectedReleases != null && treeViewHandshakeInstanceet.selectedMilesStones != null && treeViewHandshakeInstanceet.selectedSprints != null && treeViewHandshakeInstanceet.selectedPriority.size()!=0 && treeViewHandshakeInstanceet.selectedStatus.size() !=0
       &&  treeViewHandshakeInstanceet.selectedOwners.size() != 0  && treeViewHandshakeInstanceet.selectedStoryTeam.size() != 0 && treeViewHandshakeInstanceet.selectedStoryReleaseTrain.size() == 0 ){
                 lrequest = [select iD,Name,Sprint_Story__c,Status__c,Owned_By_Story__r.Name,Sprint_Story__r.Name,Sprint_Story__r.Milestone_Sprint__c,
                             Sprint_Story__r.Milestone_Sprint__r.Release__r.Name,Points__c,Priority_Story__c,Progress__c,Rank__c from Agile_Story__c 
                             where Sprint_Story__r.Milestone_Sprint__r.Release__r.Name like :treeViewHandshakeInstanceet.selectedReleases
                             and Sprint_Story__r.Milestone_Sprint__r.Milestone_Name__c like:treeViewHandshakeInstanceet.selectedMilesStones
                             and Sprint_Story__r.Name like:treeViewHandshakeInstanceet.selectedSprints
                             
                             and Priority_Story__c like:treeViewHandshakeInstanceet.selectedPriority
                           
                              and Owned_By_Story__r.Name like:treeViewHandshakeInstanceet.selectedOwners
                             and Team_Story__c like:treeViewHandshakeInstanceet.selectedStoryTeam
                             and Status__c like:treeViewHandshakeInstanceet.selectedStatus
                             ];                
             }
                               
             else if(treeViewHandshakeInstanceet.selectedReleases != null && treeViewHandshakeInstanceet.selectedMilesStones != null && treeViewHandshakeInstanceet.selectedSprints != null && treeViewHandshakeInstanceet.selectedPriority.size()!=0 && treeViewHandshakeInstanceet.selectedStatus.size() !=0
       &&  treeViewHandshakeInstanceet.selectedOwners.size() != 0  && treeViewHandshakeInstanceet.selectedStoryTeam.size() != 0 && treeViewHandshakeInstanceet.selectedStoryReleaseTrain.size() != 0){
                 lrequest = [select iD,Name,Sprint_Story__c,Status__c,Owned_By_Story__r.Name,Sprint_Story__r.Name,Sprint_Story__r.Milestone_Sprint__c,
                             Sprint_Story__r.Milestone_Sprint__r.Release__r.Name,Points__c,Priority_Story__c,Progress__c,Rank__c from Agile_Story__c 
                             where Sprint_Story__r.Milestone_Sprint__r.Release__r.Name like :treeViewHandshakeInstanceet.selectedReleases
                             and Sprint_Story__r.Milestone_Sprint__r.Milestone_Name__c like:treeViewHandshakeInstanceet.selectedMilesStones
                             and Sprint_Story__r.Name like:treeViewHandshakeInstanceet.selectedSprints
                             
                             and Priority_Story__c like:treeViewHandshakeInstanceet.selectedPriority
                             and Release_Train__c like:treeViewHandshakeInstanceet.selectedStoryReleaseTrain
                             
                             and Team_Story__c like:treeViewHandshakeInstanceet.selectedStoryTeam
                             and Status__c like:treeViewHandshakeInstanceet.selectedStatus
                             and Owned_By_Story__r.Name like:treeViewHandshakeInstanceet.selectedOwners
                             
                             ];                  
                       
                             
            } 
            
            if(treeViewHandshakeInstanceet.selectedReleases.size() ==0 || treeViewHandshakeInstanceet.selectedMilesStones.size() ==0 || treeViewHandshakeInstanceet.selectedSprints.size()  == 0){
                selectedmessage = true;
            } else {
                selectedmessage = false;
            }
            
            if(treeViewHandshakeInstanceet.selectedReleases.size() !=0 && treeViewHandshakeInstanceet.selectedMilesStones.size() !=0  && treeViewHandshakeInstanceet.selectedSprints.size()  != 0 && lrequest.size() == 0){
                showinfomessage = true;
            } else {
                showinfomessage = false;
            }
       
              
            if(lrequest.size()>0){
                showTreeView = true;
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
    
    
     
    public Pagereference dummyRender(){
        
        return null;
    }
    
    
     public Pagereference savestories() {
   
     //String p1 = System.currentPageReference().getParameters().get('p1');
     //String p2 = System.currentPageReference().getParameters().get('p2');

     //System.debug('test123'+ p1);
    
     
     //Agile_Story__c  lrequest = [ SELECT Id,Sprint_Story__c, Status__c,Points__c,Priority_Story__c
                                 // FROM Agile_Story__c where Id=:p1
                                 // ];  
     //lrequest.Points__c = lrequest.Points__c;
     //system.debug('lrequest' + lrequest);
     // update lrequest;
  
       
     return null;
    
    }
 
    

     }