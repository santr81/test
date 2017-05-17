public class TreeViewHandshake {
    public List<String> selectedMilesStones = new List<String>();
    
    public List<String> getSelectedMilesStones(){
        return selectedMilesStones;
    }
    public void setSelectedMilesStones(List<String> selectedMilesStones){
        this.selectedMilesStones = selectedMilesStones;
    }
    public List<String> selectedSprints {get;set;}
    public List<String> selectedReleases {get;set;}
    public List<String> selectedOwners {get;set;}
    public List<String> selectedStatus {get;set;}
    public List<String> selectedPriority {get;set;}
    public List<String> selectedTeam {get;set;}
    public List<String> selectedStoryTeam {get;set;}
    public List<String> selectedStoryReleaseTrain {get;set;}
    public AgileViewFilter__c filterInst {get;set;}
    public TreeViewHandshake(){
        filterInst = new AgileViewFilter__c();
        selectedSprints = new List<String>();
        selectedReleases = new List<String>();
        selectedOwners = new List<String>();
        selectedStatus = new List<String>();
        selectedPriority = new List<String>();
        selectedTeam = new List<String>();
        selectedStoryTeam = new List<String>();
        selectedStoryReleaseTrain = new List<String>();
    }
}