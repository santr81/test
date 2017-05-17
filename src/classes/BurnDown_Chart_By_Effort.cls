public class BurnDown_Chart_By_Effort{

    public String accountName { get; set; }
    public String chartRow { get; set; }
    public Agile_Sprint__c sprint { get; set; }
    public Agile_Sprint__c sprintDetails;
    public BurnDown_Chart_By_Effort(ApexPages.StandardController stdController) { 
            
        this.sprint = (Agile_Sprint__c)stdController.getRecord();
        String sprintID = this.sprint.Id;
        
        sprintDetails = [Select Id, Start_Date__c, End_Date__c, Actual_Story_Points__c,Total_Planned_Effort__c from Agile_Sprint__c where Id=:sprintID];
        
        List<Sprint_Burn_Down__c> sBurnDownList = [select Date__c,Remaining_Effort__c,Remaining_Story_Points__c,Agile_Sprint__r.Actual_Story_Points__c,Agile_Sprint__r.Start_Date__c,Agile_Sprint__r.End_Date__c from Sprint_Burn_Down__c where Agile_Sprint__c =:sprintID order by Date__c];
        
        Map<Integer,Decimal> burn = new Map<Integer,Decimal>();
        for(Sprint_Burn_Down__c s:sBurnDownList)
        {
            burn.put(s.Date__c.day(),s.Remaining_Effort__c);        
        }
        
        system.debug('@@@@@@'+burn);
        
        chartrow = '';
        Decimal diff = 0;
        Decimal planned = 0;
        Integer sDay = sprintDetails.Start_Date__c.day();
        Integer eDay = sprintDetails.End_Date__c.day();
        Integer days = 1;//eDay - sDay;
        Integer numDays=sprintDetails.Start_Date__c.daysBetween(sprintDetails.End_Date__c);
        
        
        DateTime sDateTime = (DateTime)sprintDetails.Start_Date__c;
        DateTime eDateTime = (DateTime)sprintDetails.End_Date__c;
        Integer ndays = 1;
        while (sDateTime < eDateTime) {
            if (sDateTime.formatGMT('E') != 'Sat' && sDateTime.formatGMT('E') != 'Sun') {
                ndays ++;
           }
           sDateTime = sDateTime.addDays(1);
        }
        
        Decimal plannedEffort = sprintDetails.Total_Planned_Effort__c;
        System.debug('Planned effort  is::'+plannedEffort );
        diff = plannedEffort/nDays;
        
        System.debug('diff errort is:::'+diff);
        diff = diff.setScale(2);
        
        //Integer i= sprintDetails.Start_Date__c.Day();
        system.debug('@@@@@@eday'+eDay);
        system.debug('@@@@@@sday'+sDay);
        
        sDateTime = (DateTime)sprintDetails.Start_Date__c;
        
        for(Integer i=0;i<=numDays;i++)
        {
            datetime dddd= (datetime)sprintDetails.Start_Date__c.adddays(i);
            Integer dtMonth = (Integer)dddd.month();
            if (dddd.formatGMT('E') != 'Sat' && dddd.formatGMT('E') != 'Sun') {
                String month; 
                   if(planned==0)
                       planned = plannedEffort;                
                   else{
                      planned = planned - diff;
                         if(planned < 0){
                            planned = 0;
                        }
                      }                   
                    system.debug('###value of planned '+planned); 
                    if(dtMonth == 1){
                      month = 'Jan';              
                    }
                    if(dtMonth == 2){
                      month = 'Feb';              
                    }
                    if(dtMonth == 3){
                      month = 'Mar';
                    }
                    if(dtMonth == 4){
                      month = 'Apr';
                    }
                    if(dtMonth == 5){
                      month = 'May';
                    }
                    if(dtMonth == 6){
                      month = 'Jun';
                    }
                    if(dtMonth == 7){
                      month = 'Jul';
                    }
                    if(dtMonth == 8){
                      month = 'Aug';
                    }
                    if(dtMonth == 9){
                      month = 'Sep';
                    }
                    if(dtMonth == 10){
                      month = 'Oct';
                    }            
                    if(dtMonth == 11){
                      month = 'Nov';
                    }
                    if(dtMonth == 12){
                      month = 'Dec';
                    }
                    integer burnday= dddd.day();           
            
                chartrow = chartrow + '[' +'\''+ month+' '+burnday+'\'' +',' + planned + ',' + burn.get(burnday) + '],';              
            }
            //sDateTime = sDateTime.addDays(1);
        
        }
        system.debug('@@@@@@'+chartrow );
        
    }
    
}