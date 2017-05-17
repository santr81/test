global class Batch_DeDuper implements Database.Batchable<sObject>, Database.stateful {

    public String queryString; 
    public List<sObject> recordsList ;
    public Map<Id,List<sObject>> dupeMap ;
    
    global Batch_DeDuper(String query){
        queryString = query;
        recordsList = new List<sObject>();
        dupeMap = new Map<Id,List<sObject>>();
    }
       
    global Database.QueryLocator start(Database.BatchableContext currentScope){
         return Database.getQueryLocator(queryString);
    }
    
    global void execute(Database.BatchableContext currentScope, List<sObject> sObjectList){
        recordsList = sObjectList;
        dupeMap.putALL(UTIL_DeDuper.findDuplicates(recordsList));
        for(integer i=0;i<recordsList.size();i++){
            if(dupeMap.keyset().contains(recordsList[i].id)){
                recordsList.remove(i);
            }    
        }
    }

    global void finish(Database.BatchableContext currentScope){
    }
}