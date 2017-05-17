/**     CREATED BY                  CREATED DATE        DESCRIRIPTION
        Ranjeet Singh Chouhan       01/31/2013          Batch class to perform masking of email address fields
-------------------------------------------------------------------------------------------------------------------------                        
		UPDATED BY                  UPDATED DATE        DESCRIPTION
		
**/

global class AP03_Data_Updates_Batch implements Database.Batchable<sObject> {
    
	// Batch class instance variables    
    private String objectName;
    private List<String> fieldsList;
    private String query;
    private List<sObject> batchUpdateList;
    private String emailAddressSuffix;
    private String replaceOrSuffix;
    
    // Batch class constructor, it takes object name & fields list and builds soql query that will be used to create batch of data
    global AP03_Data_Updates_Batch(String objectName, List<String> fieldsList, String emailAddressSuffix, String replaceOrSuffix) {
        this.objectName = objectName;
        this.fieldsList = fieldsList;
        this.emailAddressSuffix = emailAddressSuffix;
        this.replaceOrSuffix = replaceOrSuffix;
        
        this.query = 'Select Id';
        
        for(String fieldName : fieldsList) {
            this.query = this.query + ', ' + fieldName;
        }
        
        if(objectName == 'Lead') {
            this.query = this.query + ', isConverted';
        }
        
        this.query = this.query + ' From ' + objectName;
    }
    
    global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext bc, List<sObject> batch) {

        maskEmailAddressFields(batch);
        
        try {
            if(!batchUpdateList.isEmpty()) {
                Database.update(batchUpdateList, false);
            }
        } catch (Exception ex) {
            system.debug(ex);
        }
        
    }
    
    global void finish(Database.BatchableContext bc) {
        
    }
    
    // This method does the masking of email address fields
    private void maskEmailAddressFields(List<sObject> batch) {
        if(objectName == 'Lead') {
            batchUpdateList = new List<Lead>();
            for(sObject obj : batch) {
                if(!((Boolean)obj.get('isConverted'))) {
                    batchUpdateList.add(obj);
                    
                    for(String fieldName : fieldsList) {
                    	if(replaceOrSuffix == 'suffix') {
                    		Object value = obj.get(fieldName);
                    		if(value != null)
                    			obj.put(fieldName, value + '.' + emailAddressSuffix);
                    	} else {
                    		obj.put(fieldName, emailAddressSuffix);
                    	}
                    }                   
                }
            }
        } else {
            for(sObject obj : batch) {
            	system.debug('replaceOrSuffix :::::::::::::::::::' + replaceOrSuffix);
            	system.debug('emailAddressSuffix :::::::::::::::::::' + emailAddressSuffix);
                for(String fieldName : fieldsList) {
                	if(replaceOrSuffix == 'suffix') {
                		Object value = obj.get(fieldName);
                		if(value != null)
                			obj.put(fieldName, value + '.' + emailAddressSuffix);
                	} else {
                		obj.put(fieldName, emailAddressSuffix);
                	}
                }
            }
            
            batchUpdateList = batch;
        }   
        
    }

}