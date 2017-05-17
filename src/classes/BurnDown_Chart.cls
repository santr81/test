public class BurnDown_Chart{

    public String accountName { get; set; }
    public String chartRow { get; set; }
    //public Date chartRow { get; set; }
    public Agile_Sprint__c sprint { get; set; }
    public Agile_Sprint__c sprintDetails;
    public BurnDown_Chart(ApexPages.StandardController stdController) { 
            
        this.sprint = (Agile_Sprint__c)stdController.getRecord();
        String sprintID = this.sprint.Id;
        
        sprintDetails = [Select Id, Start_Date__c, End_Date__c, Actual_Story_Points__c,Total_Remaining_story_Points__c from Agile_Sprint__c where Id=:sprintID ];
        
        List<Sprint_Burn_Down__c> sBurnDownList = [select Date__c,Expected_Remaining_Points__c,Remaining_Story_Points__c,Agile_Sprint__r.Actual_Story_Points__c,Agile_Sprint__r.Start_Date__c,Agile_Sprint__r.End_Date__c from Sprint_Burn_Down__c where Agile_Sprint__c =:sprintID order by Date__c];
        
        Map<Integer,Decimal> burn = new Map<Integer,Decimal>();
        for(Sprint_Burn_Down__c s:sBurnDownList)
        {
            burn.put(s.Date__c.day(),s.Remaining_Story_Points__c);        
        }
        system.debug('###value of burn'+burn);        
        //BusinessHours bh = [SELECT Id FROM BusinessHours WHERE IsDefault=true];
        chartrow ='';        
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
                ndays++;
           }
           sDateTime = sDateTime.addDays(1);
        }
       
        system.debug('nDays are >>>>>@@@@@'+ndays);
        Decimal actualPoint = sprintDetails.Actual_Story_Points__c;       
        diff = actualPoint/ndays;
        System.debug('diff is >>>>>>'+diff);
        diff = diff.setScale(2);
        system.debug('@@@@@diff'+diff );
        
        sDateTime = (DateTime)sprintDetails.Start_Date__c;
        eDateTime = (DateTime)sprintDetails.End_Date__c;
        
      
        sDateTime = (DateTime)sprintDetails.Start_Date__c;
        planned = actualPoint; 
        System.debug('***eDay'+eDay);
        System.debug('***sDay'+sDay);
        System.debug('***planned '+planned );
        for(integer i=0;i<=numDays;i++)
        {
            datetime dddd= (datetime)sprintDetails.Start_Date__c.adddays(i);
         Integer dtMonth = (Integer)dddd.month();
            system.debug('@@@@@Day'+ dddd.formatGMT('E'));
            if (dddd.formatGMT('E') != 'Sat' && dddd.formatGMT('E') != 'Sun') {
               String month;
                if(planned==0 )
                    planned = actualPoint;                
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
                
            chartrow = chartrow + '[' +'\''+month+' '+ burnday +'\'' +',' + planned + ',' + burn.get(burnday) + '],';                
              
            }
           
            
            system.debug('###value of sDateTime '+sDateTime );
        }
        
        system.debug('@@@@@@ChartRow'+chartrow);
    }
    
}