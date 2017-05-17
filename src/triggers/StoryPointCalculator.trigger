trigger StoryPointCalculator on Agile_Story__c (before insert, before update) {
    
    Map<Id, Integer> plannedSprintMap = new Map<Id, Integer>();
    List<Id> actualSprintList = new List<Id>();
    List<Agile_Story__c> lstAllStories = [select Id,Name, Rank__c, Sprint_Story__r.Milestone_Sprint__c from Agile_Story__c];
    Map<Id, Agile_Story__c> mapAllStories = new Map<Id, Agile_Story__c>(lstAllStories);
    Set<Id> setMilestone = new Set<Id>();
    Agile_Sprint__c ms = new Agile_Sprint__c();

    for(Agile_Story__c story : Trigger.New) {
        if(Trigger.isInsert) {
            story.Planned_Sprint__c = story.Sprint_Story__c;
            if(!plannedSprintMap.containsKey(story.Sprint_Story__c)) {
                if(story.Points__c!=null) {
                    plannedSprintMap.put(story.Sprint_Story__c, Integer.valueOf(story.Points__c));
                }
            }
            /*else {
                Integer plannedPoints = plannedSprintMap.get(story.Sprint_Story__c);
                if(story.Points__c!=null && plannedPoints!=null) {
                    plannedPoints += Integer.valueOf(story.Points__c);
                }
                else if(story.Points__c!=null && plannedPoints==null) {
                    plannedPoints = Integer.valueOf(story.Points__c);
                }
                plannedSprintMap.put(story.Sprint_Story__c, plannedPoints);
            } */
            actualSprintList.add(story.Sprint_Story__c);
            ms = [SELECT Milestone_Sprint__c FROM Agile_Sprint__c where id = :story.Sprint_Story__c];
            setMilestone.add(ms.Milestone_Sprint__c);
            system.debug(setMilestone);
            
            if(mapAllStories.containsKey(story.Id)){
                mapAllStories.get(story.Id).Rank__c = story.rank__c;
            }

        }
        else if(Trigger.isUpdate) {
            Agile_Story__c oldStory = Trigger.oldMap.get(story.Id);
            ms = [SELECT Milestone_Sprint__c FROM Agile_Sprint__c where id = :story.Sprint_Story__c];
            setMilestone.add(ms.Milestone_Sprint__c);
            system.debug(setMilestone);
            
            if(mapAllStories.containsKey(story.Id)){
                mapAllStories.get(story.Id).Rank__c = story.rank__c;
            }

            if(oldStory.Planned_Sprint__c==null && oldStory.Sprint_Story__c==null && story.Sprint_Story__c!=null) {
                story.Planned_Sprint__c = story.Sprint_Story__c;
            }
            if(story.Sprint_Story__c!=oldStory.Sprint_Story__c || story.Points__c!=oldStory.Points__c) {
                if(story.Sprint_Story__c!=null) {
                    actualSprintList.add(story.Sprint_Story__c);    
                }
                if(oldStory.Sprint_Story__c!=null) {
                    actualSprintList.add(oldStory.Sprint_Story__c);
                }
            }
            if(story.Sprint_Story__c!=oldStory.Sprint_Story__c) {
                if(!plannedSprintMap.containsKey(story.Sprint_Story__c)) {
                    if(story.Points__c!=null) {
                        plannedSprintMap.put(story.Sprint_Story__c, Integer.valueOf(story.Points__c));
                    }
                }
               /* else {
                    Integer plannedPoints = plannedSprintMap.get(story.Sprint_Story__c);
                    if(story.Points__c!=null && plannedPoints!=null) {
                        plannedPoints += Integer.valueOf(story.Points__c);
                    }
                    else if(story.Points__c!=null && plannedPoints==null) {
                        plannedPoints = Integer.valueOf(story.Points__c);
                    }
                    plannedSprintMap.put(story.Sprint_Story__c, plannedPoints);
                }*/
            } 
            else if(story.Points__c!=oldStory.Points__c) {
                if(oldStory.Points__c==null && story.Points__c!=null) {
                    if(!plannedSprintMap.containsKey(story.Sprint_Story__c)) {
                        plannedSprintMap.put(story.Sprint_Story__c, Integer.valueOf(story.Points__c));
                    }
                    else {
                        Integer plannedPoints = plannedSprintMap.get(story.Sprint_Story__c);
                        if(plannedPoints!=null) {
                            plannedPoints += Integer.valueOf(story.Points__c);
                        }
                        else {
                            plannedPoints = Integer.valueOf(story.Points__c);
                        }
                        plannedSprintMap.put(story.Sprint_Story__c, plannedPoints);
                    } 
                }
                else if(oldStory.Points__c!=null && story.Points__c==null) {
                    if(!plannedSprintMap.containsKey(oldStory.Sprint_Story__c)) {
                        plannedSprintMap.put(oldStory.Sprint_Story__c, -Integer.valueOf(oldStory.Points__c));
                    }
                    else {
                        Integer plannedPoints = plannedSprintMap.get(oldStory.Sprint_Story__c);
                        if(plannedPoints!=null) {
                            plannedPoints -= Integer.valueOf(oldStory.Points__c);
                        }
                        else {
                            plannedPoints = -Integer.valueOf(oldStory.Points__c);
                        }
                        plannedSprintMap.put(oldStory.Sprint_Story__c, plannedPoints);
                    }
                }
                else if(oldStory.Points__c!=null && story.Points__c!=null) {
                    Integer pointDifference = Integer.valueOf(story.Points__c) - Integer.valueOf(oldStory.Points__c);
                    if(!plannedSprintMap.containsKey(story.Sprint_Story__c)) {
                        plannedSprintMap.put(story.Sprint_Story__c, pointDifference);
                    }
                    else {
                        Integer plannedPoints = plannedSprintMap.get(story.Sprint_Story__c);
                        if(plannedPoints!=null) {
                            plannedPoints += pointDifference;
                        }
                        else {
                            plannedPoints = pointDifference;
                        }
                        plannedSprintMap.put(story.Sprint_Story__c, plannedPoints);
                    }
                }
            }
        }
    }
    
    
    //FutureUtil.validateRank(mapAllStories, setMilestone);
    
    List<Agile_Story__c> finalStories = mapAllStories.Values();
    List<String> lststoryRank = new List<String>();
    Set<String> setStoryRank = new Set<String>();
    String r;
    for(Id mileId : setMilestone){
        for(Agile_Story__c s : finalStories){
            if(s.Sprint_Story__r.Milestone_Sprint__c == mileId && s.Rank__c != null){
                r = String.valueOf(s.Rank__c);
                setStoryRank.add(r);
                lststoryRank.add(r);
            }
        }
    }
    
    if(lststoryRank.size() == setStoryRank.size()) {
        List<Agile_Sprint__c> plannedSprints = [Select Id, Planned_Story_Points__c From Agile_Sprint__c Where Id IN :plannedSprintMap.keySet()];
        
        for(Agile_Sprint__c plannedSprint : plannedSprints) {
            if(plannedSprint.Planned_Story_Points__c!=null && plannedSprintMap.get(plannedSprint.Id)!=null) {
                plannedSprint.Planned_Story_Points__c += plannedSprintMap.get(plannedSprint.Id);
            }
            else if(plannedSprint.Planned_Story_Points__c==null && plannedSprintMap.get(plannedSprint.Id)!=null) {
                plannedSprint.Planned_Story_Points__c = plannedSprintMap.get(plannedSprint.Id);
            }
        } 
        if(!plannedSprints.isEmpty()) {
            update plannedSprints;  
        }
        
        if(!actualSprintList.isEmpty()) {
            FutureUtil.updateActualStoryPoints(actualSprintList);
        }
    }else {
        //Trigger.New[0].addError('Cannot update the records. Please correct the rank order');
    }
}