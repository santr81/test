/**
  * @author        Urmi Chatterjee
  * @date          09/10/2013
  * @description   This is Apex Schedulable Class which will invoke BATCH_PurgeOldExcption Batch Class that deletes exception records.
  */

global class SCH_PurgeOldExcptionScheduler implements Schedulable{    
    
    /**
      * @description       This method defines the query which determines which records are to be deleted and invokes the BATCH_PurgeOldExcption Batch Class to delete these records.
      * @param             context A reference to the SchedulableContext object
      * @return            void
      * @throws            NA
      */
    global void execute(SchedulableContext context){
         BatchRecordFilter__c exceptionBatchDays = new BatchRecordFilter__c(); 
         // Record fetched fromt the Custom Setting will depend on the User requirement
         exceptionBatchDays = BatchRecordFilter__c.getInstance(UTIL_ErrorConstants.BATCH_CUSTOM_SETTING_RECORD);
         
         BATCH_PurgeOldExcption batchVar = new BATCH_PurgeOldExcption();
         batchVar.queryString = 'SELECT Id FROM ExceptionLog__c WHERE CreatedDate = N_DAYS_AGO:'+
                                 Integer.valueOf(exceptionBatchDays.NoOfDays__c);
         Database.executeBatch(batchVar);
    }
}