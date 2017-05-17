public class TreeNodes
{
    //CONSTRUCTOR TO INITIALZE THE WRAPPER CLASS INSTANCE
    public TreeNodes(){
        //treeViewHandShkInst = new TreeViewHandshake();
        percentageValue = 80;
    }
    //TO BE DYNAMIC ACCORDING TO THE SPRINT FIELD
    public Integer percentageValue{get;set;}
    /* Wrapper class to contain the nodes and their children */
    public class cNodes
    {
        public List<Agile_Sprint__c> parent {get; set;}
        Public Agile_Milestone__c gparent {get;set;}
        public cNodes(Agile_Milestone__c gp, List<Agile_Sprint__c> p)
        {       
            parent = p;       
            gparent = gp;   
        }  
    }
    
    /* end of Wrapper class */
    public String getDummyVariable(){
        initialize();
        return '';
    }
    Public List<cNodes> hierarchy;
    public void setMainNodes(List<cNodes> mainNodes){
        this.mainNodes = mainNodes;    
    }
    Public TreeViewHandshake treeViewHandShkInst{get;set;}
    public List<cNodes> mainNodes = new List<cNodes>();
    
    public void initialize(){
        mainNodes = new List<cNodes>();
        Map<Id, Agile_Milestone__c> tempparent = new Map<Id, Agile_Milestone__c>();
        List<Agile_Sprint__c> tempchildren = new List<Agile_Sprint__c>();
        Map<Id,List<Agile_Sprint__c>> mapSprints = new Map<Id,List<Agile_Sprint__c>>();
        String parentQueryStr  = '';
        system.debug('treeViewHandShkInst.selectedReleases -- >' + treeViewHandShkInst.selectedReleases);
        system.debug('treeViewHandShkInst.selectedMilesStones-- >' + treeViewHandShkInst.selectedMilesStones);
        if(treeViewHandShkInst.selectedReleases.Size() > 0 && treeViewHandShkInst.selectedMilesStones.Size() == 0) {
            tempparent = new Map<Id, Agile_Milestone__c>([Select Milestone_Name__c from Agile_Milestone__c where Release__r.Name IN: treeViewHandShkInst.selectedReleases]);    
        }
        else if(treeViewHandShkInst.selectedMilesStones.Size() > 0 && treeViewHandShkInst.selectedReleases.Size() == 0) {
            tempparent = new Map<Id, Agile_Milestone__c>([Select Milestone_Name__c from Agile_Milestone__c where Milestone_Name__c IN: treeViewHandShkInst.selectedMilesStones]);
        }
        else if(treeViewHandShkInst.selectedMilesStones.Size() > 0 && treeViewHandShkInst.selectedReleases.Size() > 0) {
            tempparent = new Map<Id, Agile_Milestone__c>([Select Milestone_Name__c from Agile_Milestone__c where Milestone_Name__c IN: treeViewHandShkInst.selectedMilesStones AND Release__r.Name In: treeViewHandShkInst.selectedReleases]);
        }
        else {
            tempparent = new Map<Id, Agile_Milestone__c>([Select Milestone_Name__c from Agile_Milestone__c]);
        }
                 
        String whereClause = '';
        String whereClauseSub = '';
        String cQuery = '';
        Set<Id> tempSet = tempparent.keySet();
        System.debug('++++'+ tempSet);
        String queryParam = 'SELECT Name,Milestone_Sprint__c,Sprint_Progress__c,(SELECT Name,Status__c,Priority_Story__c,Story_Number__c,Points__c,Rank__c,Owned_By_Story__c,Sprint_Story__c FROM Stories__r ';
        String fromClause = 'FROM Agile_Sprint__c WHERE Milestone_Sprint__c IN: tempSet';
        String orderBy = ' ORDER BY Name ';
        String orderBySub = ' ORDER BY Name) ';
        List<String> handShakeSelectSprints = new List<String>();
        List<String> handShakeSelectOwners = new List<String>();
        List<String> handShakeSelectPriority = new List<String>();
        List<String> handShakeSelectStatus = new List<String>();
         List<String> handShakeSelectTeam= new List<String>();
         List<String> handShakeSelectReleaseTrain= new List<String>();
        Set<Id> mileStoneIds = new Set<Id>();
         
        if(treeViewHandShkInst.selectedSprints.Size() > 0) {
            handShakeSelectSprints = treeViewHandShkInst.selectedSprints;
            System.debug('++++'+ handShakeSelectSprints);
            whereClause = ' AND Name IN: handShakeSelectSprints';
            cQuery = queryParam + orderBySub + fromClause + whereClause + orderBy;
        }
        if(treeViewHandShkInst.selectedOwners.Size() > 0) {
            handShakeSelectOwners = treeViewHandShkInst.selectedOwners;
            System.debug('++++'+ handShakeSelectOwners);
            whereClauseSub = ' WHERE Owned_By_Story__r.Name IN: handShakeSelectOwners';
            if(!String.isEmpty(whereClause)) {
                cQuery = queryParam + whereClauseSub + orderBySub + fromClause + whereClause + orderBy;
            }
            else {
                    cQuery = queryParam + whereClauseSub + orderBySub + fromClause + orderBy;
            }
        }
        if(treeViewHandShkInst.selectedPriority.Size() > 0) {
            handShakeSelectPriority = treeViewHandShkInst.selectedPriority;
            System.debug('++++'+ handShakeSelectPriority);
            if(!String.isEmpty(whereClauseSub)) {
                whereClauseSub += ' AND Priority_Story__c IN: handShakeSelectPriority';
            }
            else {
                    whereClauseSub = ' WHERE Priority_Story__c IN: handShakeSelectPriority';
            }
            if(!String.isEmpty(whereClause)) {
                cQuery = queryParam + whereClauseSub + orderBySub + fromClause + whereClause + orderBy;
            }
            else {
                    cQuery = queryParam + whereClauseSub + orderBySub + fromClause + orderBy;
            }
        }
        if(treeViewHandShkInst.selectedStatus.Size() > 0) {
            handShakeSelectStatus = treeViewHandShkInst.selectedStatus;
            System.debug('++++'+ handShakeSelectStatus);
            if(!String.isEmpty(whereClauseSub)) {
                whereClauseSub += ' AND Status__c IN: handShakeSelectStatus';
            }
            else {
                    whereClauseSub = ' WHERE Status__c IN: handShakeSelectStatus';
            }
            if(!String.isEmpty(whereClause)) {
                cQuery = queryParam + whereClauseSub + orderBySub + fromClause + whereClause + orderBy;
            }
            else {
                    cQuery = queryParam + whereClauseSub + orderBySub + fromClause + orderBy;
            }
        }
        
        if(treeViewHandShkInst.selectedStoryTeam.Size() > 0) {
            handShakeSelectTeam = treeViewHandShkInst.selectedStoryTeam;
            if(!String.isEmpty(whereClauseSub)) {
                whereClauseSub += ' AND Team_Story__c IN: handShakeSelectTeam';
            }
            else {
                    whereClauseSub = ' WHERE Team_Story__c IN: handShakeSelectTeam';
            }
            if(!String.isEmpty(whereClause)) {
                cQuery = queryParam + whereClauseSub + orderBySub + fromClause + whereClause + orderBy;
            }
            else {
                    cQuery = queryParam + whereClauseSub + orderBySub + fromClause + orderBy;
            }
        }
        if(treeViewHandShkInst.selectedStoryReleaseTrain.Size() > 0) {
            handShakeSelectReleaseTrain = treeViewHandShkInst.selectedStoryReleaseTrain;
            if(!String.isEmpty(whereClauseSub)) {
                whereClauseSub += ' AND Release_Train__c IN: handShakeSelectReleaseTrain';
            }
            else {
                    whereClauseSub = ' WHERE Release_Train__c IN: handShakeSelectReleaseTrain';
            }
            if(!String.isEmpty(whereClause)) {
                cQuery = queryParam + whereClauseSub + orderBySub + fromClause + whereClause + orderBy;
            }
            else {
                    cQuery = queryParam + whereClauseSub + orderBySub + fromClause + orderBy;
            }
        }
        if(String.isEmpty(cQuery)) {
            cQuery = queryParam + orderBySub + fromClause + orderBy;    
        }
        
        tempchildren = Database.query(cQuery);
        
        if(handShakeSelectOwners.size() > 0 || handShakeSelectPriority.size() > 0 || handShakeSelectStatus.size() > 0) {
            for(Agile_Sprint__c temp : tempchildren) {
                if(temp.stories__r.size() > 0) {
                    if( mapSprints.containsKey(temp.Milestone_Sprint__c)) {
                        mapSprints.get(temp.Milestone_Sprint__c).add(temp);
                    }
                    else {
                        List<Agile_Sprint__c> tempSpr = new List<Agile_Sprint__c>();
                        tempSpr.add(temp);
                        mapSprints.put(temp.Milestone_Sprint__c, tempSpr);
                    }
                }
                
            }
        }
        else {
            for(Agile_Sprint__c temp : tempchildren) {
                if(temp.stories__r.size() > 0){
                    if( mapSprints.containsKey(temp.Milestone_Sprint__c)) {
                        mapSprints.get(temp.Milestone_Sprint__c).add(temp);
                    }
                    else {
                        List<Agile_Sprint__c> tempSpr = new List<Agile_Sprint__c>();
                        tempSpr.add(temp);
                        mapSprints.put(temp.Milestone_Sprint__c, tempSpr);
                    }
                }
                
                
            }
        } 
        if(!tempparent.values().isEmpty()) {   
            for(Agile_Milestone__c mile : tempparent.values()) {
                if(mapSprints.get(mile.Id) != NULL) {
                    mainNodes.add(new cNodes(mile,mapSprints.get(mile.Id)));
                }
            }
        }
    }
    
    public List<cNodes> getMainNodes(){
       return mainNodes;
    }
    
    public PageReference saveRec() {
        List<Agile_Story__c> temp = new List<Agile_Story__c>();
        List<Agile_Sprint__c> tempSprint = new List<Agile_Sprint__c>();
        for(Integer i = 0 ; i< mainNodes.size(); i++) {
            if (mainNodes[i].parent != NULL) {
                tempSprint= mainNodes[i].parent;
                for(Agile_Sprint__c sprint : tempSprint) {
                    System.debug('++++1'+ sprint.Stories__r); 
                    if(sprint.Stories__r != NULL) {
                        temp.addAll(sprint.Stories__r);
                    }
                }
            }
        }
        System.debug('----'+temp);
        Database.Upsert(temp,false);
        return null;
    }

   
}