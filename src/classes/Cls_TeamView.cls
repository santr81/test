public with sharing class Cls_TeamView {
public list<AgileViewFilter__c> listView {get;set;}
public List<SelectOption> myList{get; set;}

    public Cls_TeamView(){
        listView = [SELECT Id,Name,MilesStone__c,Priority__c,Release__c,Release_Train__c,Sprint__c,Status__c,StoryReleaseTrain__c,StoryTeam__c,Team_ViewFilter__c from AgileViewFilter__c];
    
    }
    
    
     public List<SelectOption> getTrainValues(){
        myList =new List<SelectOption>();
        Schema.DescribeFieldResult f = Agile_Story__c.Release_Train__c.getDescribe();
            List<Schema.PicklistEntry> p = f.getPicklistValues();
               for(Schema.PicklistEntry e:p){
                    myList.add(new SelectOption(e.getLabel(),e.getValue()));
            }
            return myList;
    }
    
    public List<SelectOption> getTeamValues(){
        myList =new List<SelectOption>();
        Schema.DescribeFieldResult f = Agile_Story__c.Team_Story__c.getDescribe();
            List<Schema.PicklistEntry> p = f.getPicklistValues();
               for(Schema.PicklistEntry e:p){
                    myList.add(new SelectOption(e.getLabel(),e.getValue()));
            }
            return myList;
    }
    
   
        
}