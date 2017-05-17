global class maskPIIData implements Database.Batchable<sObject>{

    public string query;
    public set<string> fieldnamesset;
    public string fieldnames;
    public map<string,string> fieldvaluepairmap;
    public string objectapiname;
    public string exceptiontext;
    public static integer uniquefeildcounter= 1;
    global maskPIIData(String Objectname, map<string,string> fieldvaluepair){
        integer counter = 1;
        fieldnamesset= fieldvaluepair.keyset();
        this.fieldvaluepairmap = fieldvaluepair;
        this.objectapiname = Objectname;
        system.debug('fieldnamesset is ' + fieldnamesset);
        for(String field: fieldnamesset){
            if(String.isnotblank(fieldnames)){
                fieldnames = fieldnames + field;
            }else{
                fieldnames = field;
            }
            if(counter <> fieldnamesset.size()){
                fieldnames = fieldnames + ', ';
            }
            counter++;
        }
        

        query = 'Select ' + fieldnames + ' from '+ Objectname;
    }
    
    global Database.QueryLocator start(Database.BatchableContext BC){
        return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext BC, List<sObject> scope){
    try{
        for(sobject s : scope){
            for(String Field: fieldnamesset){
               if(String.isnotblank((string)s.get(Field)))
                   if(String.isnotblank(fieldvaluepairmap.get(Field)) && fieldvaluepairmap.get(Field).contains('@')){
                       list<string> strlst = String.valueof(fieldvaluepairmap.get(Field)).split('@');
                       s.put(Field,strlst[0]+ String.valueof(uniquefeildcounter) +'@' +strlst[1]);
                   }else if(String.isnotblank(fieldvaluepairmap.get(Field))){
                       s.put(Field,String.valueof(fieldvaluepairmap.get(Field)).replace('{count}', String.valueof(uniquefeildcounter)));
                   }else{
                       s.put(Field,String.valueof(s.get(Field))+ '');
                   }
            }
            uniquefeildcounter++;
            system.debug('s is ' + s);

        }
        
        Database.SaveResult[] Results=database.update(scope,false);
     }catch(Exception e){
         system.debug(e.getMessage());
         PIIMaster__c piimaster = [select status__c from PIImaster__c where Object_API_Name__c=:objectapiname limit 1];
         if(piimaster <> null){
             piimaster.Exception__c = e.getMessage();
         }
        update piimaster;
     }
    }
    
    global void finish(Database.BatchableContext BC){
        PIIMaster__c piimaster = [select status__c from PIImaster__c where Object_API_Name__c=:objectapiname limit 1];
        if(piimaster <> null){
            piimaster.status__c ='Completed';

        }
        
        update piimaster;
        
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String Email=[Select email from user where id=:Userinfo.getUserId()].email;
        List<String> toAddresses = new List<String>();
        toAddresses.add(Email);
        mail.setToAddresses(toAddresses);
        mail.setSubject('PII data update has been completed for '+objectapiname +' object.');
        mail.setPlainTextBody('PII data update completed for '+objectapiname +' has been completed for the fields '+ fieldvaluepairmap +'.' );
        mail.setHtmlBody('PII data update completed for <b> ' + objectapiname +' </b>  has been completed for the fields '+ fieldvaluepairmap +'.');
      //  Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
            
    }
    
    // Is field number?
    public boolean isNumberfield(String objname, String fieldname){
        Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
        Schema.SObjectType ObjectSchema = schemaMap.get(objname);
        Map<String, Schema.SObjectField> fieldMap = ObjectSchema.getDescribe().fields.getMap();
        return fieldMap.get(fieldname).getDescribe().getType() == Schema.DisplayType.Integer;
    }
    
}