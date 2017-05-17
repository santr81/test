/**
  * @author        Urmi Chatterjee
  * @date          21/10/2013
  * @description   Test Class for SCH_PurgeOldExcptionScheduler class.
  */

@isTest
private class SCH_PurgeOldExcptionScheduler_TEST{
    
    // Start of Constants for Test Methods
    
    private static final String ALIAS = 'sch1';
    private static final String SYSTEM_ADMIN = 'System Administrator';
    private static final String CUSTOM_SETTING_RECORD = 'ExceptionRecordDeletionFilter';
    private static final String SCHEDULED_TIME = '0 0 23 * * ?';
    private static final String JOB_NAME = 'Test Check';
    private static final String JOB_STATUS = 'WAITING';
    
    // End of Constants for Test Methods

    /**
      * @description       Test method to verify whether the scheduler class successfully calls 
                           BATCH_PurgeOldExcption class, which deletes ExceptionLog__c records.
      * @param             NA
      * @return            void
      * @throws            NA
      */
    private static testMethod void scheduleDelete(){
        User runUser = UTIL_Test.runningUser(ALIAS, SYSTEM_ADMIN);
        BatchRecordFilter__c exceptionBatchDays = new BatchRecordFilter__c(Name=CUSTOM_SETTING_RECORD, NoOfDays__c=30);
        insert exceptionBatchDays;
        SCH_PurgeOldExcptionScheduler schVar = new SCH_PurgeOldExcptionScheduler();
        String sch = SCHEDULED_TIME ;
        String jobId = UTIL_ErrorConstants.BLANK_SPACE;
        Test.StartTest();
        System.runAs(runUser){
            jobId = System.Schedule(JOB_NAME, sch, schVar);
        }
        Test.stopTest();
        CronTrigger schData = [SELECT Id, State FROM CronTrigger WHERE Id =: jobId];
        System.assertEquals(schData.State, JOB_STATUS);                  
    }
}