public with sharing class FutureUtil {
    
    @future
    public static void updateActualStoryPoints(List<Id> actualSprintList) {
        Map<Id, Agile_Sprint__c> actualSprintMap = new Map<Id, Agile_Sprint__c>();
        List<Agile_Story__c> Stories = [Select Id, Sprint_Story__c, Points__c From Agile_Story__c Where Sprint_Story__c IN :actualSprintList]; 
        for(Agile_Story__c story : stories) {
            if(actualSprintMap.containsKey(story.Sprint_Story__c)) {
                Agile_Sprint__c updatedSprint = actualSprintMap.get(story.Sprint_Story__c);
                Integer points = Integer.valueOf(updatedSprint.Actual_Story_Points__c);
                if(story.Points__c!=null && points!=null) {
                    points += Integer.valueOf(story.Points__c);
                }
                else if(story.Points__c!=null && points==null) {
                        points = Integer.valueOf(story.Points__c);
                }
                updatedSprint.Actual_Story_Points__c = points;
                actualSprintMap.put(story.Sprint_Story__c, updatedSprint); 
            }
            else {
                Agile_Sprint__c updatedSprint = new Agile_Sprint__c();
                updatedSprint.Id = story.Sprint_Story__c;
                if(story.Points__c!=null) {
                    updatedSprint.Actual_Story_Points__c = Integer.valueOf(story.Points__c);
                }
                else {
                    updatedSprint.Actual_Story_Points__c = 0;
                }
                actualSprintMap.put(story.Sprint_Story__c, updatedSprint);
            }       
        }
        List<Agile_Sprint__c> sprints = [Select Id, Actual_Story_Points__c, (Select Id, Points__c From Stories__r) From Agile_Sprint__c Where Id IN:actualSprintList];
        for(Agile_Sprint__c sprint : sprints) {
            if(sprint.Stories__r.isEmpty()) {
                Agile_Sprint__c updatedSprint = new Agile_Sprint__c();
                updatedSprint.Id = sprint.Id;
                updatedSprint.Actual_Story_Points__c = 0;
                actualSprintMap.put(sprint.Id, updatedSprint);
            }
            else {
                Boolean isEmpty = true;
                for(Agile_Story__c story : sprint.Stories__r) {
                    if(story.Points__c!=null) {
                        isEmpty= false;
                        break;
                    }
                }
                if(isEmpty) {
                    Agile_Sprint__c updatedSprint = new Agile_Sprint__c();
                    updatedSprint.Id = sprint.Id;
                    updatedSprint.Actual_Story_Points__c = 0;
                    actualSprintMap.put(sprint.Id, updatedSprint);
                }
            }
        }
        update actualSprintMap.values();    
    }
    
    /*public void validateRank(Map<Id, Agile_Story__c> mapAllStories, Set<Id> setMilestone){
        List<Agile_Story__c> finalStories = mapAllStories.Values();
        List<String> lststoryRank = new List<String>();
        Set<String> setStoryRank = new Set<String>();
        String r;
        system.debug(setMilestone);
        for(Id mileId : setMilestone){
            for(Agile_Story__c s : finalStories){
                if(s.Sprint_Story__r.Milestone_Sprint__c == mileId && s.Rank__c != null){
                    r = String.valueOf(s.Rank__c);
                    setStoryRank.add(r);
                    lststoryRank.add(r);
                }
            }
            if(lststoryRank.size() != setStoryRank.size()) {
                System.debug(lststoryRank.size()+'-------'+ setStoryRank.size());
                Apexpages.addMessage(new Apexpages.message(ApexPages.Severity.Error,'Cannot update the records. Please correct the rank order'));
            }
        }
    }*/
}