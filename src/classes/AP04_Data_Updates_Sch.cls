/**     CREATED BY                  CREATED DATE        DESCRIRIPTION
        Ranjeet Singh Chouhan       01/31/2013          Scheduler class to schedule masking of email address fields
--------------------------------------------------------------------------------------------------------------------                             
		UPDATED BY                  UPDATED DATE        DESCRIPTION
		
**/

global class AP04_Data_Updates_Sch implements Schedulable {
    
    // Scheduler class constants
    
    private static final String jobStatusQueued = 'Queued';
    private static final String jobStatusProcessing = 'Processing';
    private static final String jobStatusPreparing = 'Preparing';
    
    // Lists to store batch information and cron expressions
    public List<AP03_Data_Updates_Batch> dataUpdatesBatchList;
    public Set<ID> batchProcessIdSet;
    public List<String> cronExpList;
    public Integer waitingTimeInSecs;
    
    global void execute(SchedulableContext sc) {
        
        Integer currentlyScheduledJobsCount = 0;
        List<AsyncApexJob> asyncApexJobList = [Select ID From AsyncApexJob Where Status = :jobStatusQueued OR Status = : jobStatusProcessing OR Status = :jobStatusPreparing];
        
        if(asyncApexJobList != null)
        	currentlyScheduledJobsCount = asyncApexJobList.size();
        	
    	Integer dataUpdatesBatchListSize = 0;
        if(dataUpdatesBatchList != null)
        	dataUpdatesBatchList.size();
        	
    	if(currentlyScheduledJobsCount == 5 && dataUpdatesBatchListSize > 0) {
    		resetWaitingTime();
    		reschedulePostRefreshDataUpdates();
    	} else {
    		
    		Integer scope = 5 - currentlyScheduledJobsCount;
    		
    		if(dataUpdatesBatchListSize >= scope) {
    			
    			for(Integer i = dataUpdatesBatchListSize - 1; i >= (dataUpdatesBatchListSize - scope); i--) {
    				AP03_Data_Updates_Batch batch = dataUpdatesBatchList.remove(i);
    				ID batchProcessId = Database.executeBatch(batch);
    				
                	batchProcessIdSet.add(batchProcessId);
    			}
    			
    			if(currentlyScheduledJobsCount > 0)
    				resetWaitingTime();
    			
    			reschedulePostRefreshDataUpdates();
    			
    		} else if(dataUpdatesBatchListSize > 0) {
    			
    			for(Integer i = dataUpdatesBatchListSize - 1; i >= 0; i--) {
    				AP03_Data_Updates_Batch batch = dataUpdatesBatchList.remove(i);
    				ID batchProcessId = Database.executeBatch(batch);
    				
                	batchProcessIdSet.add(batchProcessId);
    			}
    			
    			if(currentlyScheduledJobsCount > 0)
    				resetWaitingTime();
    			
    			reschedulePostRefreshDataUpdates();
    			
			} else {
				
				Boolean stillExecutingJob = false;
				for(AsyncApexJob job : asyncApexJobList) {
					
					if(batchProcessIdSet != null && batchProcessIdSet.contains(job.Id)) {
						stillExecutingJob = true;
						break;
					}
					
				}
				
				if(stillExecutingJob) {
    				resetWaitingTime();
					reschedulePostRefreshDataUpdates();
				} else {
					deleteEmailMaskingSchJobs();
                	sendCompleteNotification();
				}
				
			}
    	}
            
    }
    @TestVisible
    private void resetWaitingTime() {
    	if(waitingTimeInSecs == 0) {
    		waitingTimeInSecs = 60;
    	} else if(waitingTimeInSecs < 3600) {
    		waitingTimeInSecs = waitingTimeInSecs * 2;
    	} else {
    		waitingTimeInSecs = 3600;
    	}
    }
    
    // Method to reschedule email masking if all the batches have not been completed
    @TestVisible
    private void reschedulePostRefreshDataUpdates() {
        try {
            DateTime currentDateTime = system.now();            
            DateTime scheduleDateTime = currentDateTime.addSeconds(waitingTimeInSecs);
            
            String sch = string.valueof(scheduleDateTime.second()) + ' ' + string.valueof(scheduleDateTime.minute()) + ' ' + string.valueof(scheduleDateTime.hour()) + ' ' + string.valueof(scheduleDateTime.day()) + ' ' + string.valueof(scheduleDateTime.month()) + ' ? ' + string.valueof(scheduleDateTime.year());
            
            AP04_Data_Updates_Sch dataUpdatesSch = new AP04_Data_Updates_Sch();
            
            dataUpdatesSch.batchProcessIdSet = batchProcessIdSet;
            cronExpList.add(sch);
            dataUpdatesSch.cronExpList = cronExpList;
            dataUpdatesSch.dataUpdatesBatchList = dataUpdatesBatchList;
            dataUpdatesSch.waitingTimeInSecs = waitingTimeInSecs;
            
            system.schedule('Email Masking' + sch, sch, dataUpdatesSch);
            
        } catch(exception ex) {
            System.debug(ex);
        }
    }
    
    // Method to delete the scheduled jobs that were created in this process
    @TestVisible
    private void deleteEmailMaskingSchJobs() {
        if(this.cronExpList != null && !this.cronExpList.isEmpty()){
        List<CronTrigger> jobsList = [Select Id From CronTrigger Where CronExpression IN :this.cronExpList AND State != 'EXECUTING'];
        
        if(!jobsList.isEmpty()) {
            for(CronTrigger job : jobsList) {
                System.abortJob(job.Id);
            }
        }
    }
    }
    
    // Method to send email notification to system administrator when the scheduled jobs are completed
    public void sendCompleteNotification() {
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        List<String> toAddresses = new List<String>();
        
        User runningUser = [SELECT Email FROM User WHERE Id = :UserInfo.getUserId()];
        toAddresses.add(runningUser.Email);
             
        mail.setToAddresses(toAddresses);
        mail.setSubject('Post Refresh Tasks are successfully completed');
        mail.setHtmlBody('Congratulations!<br/><br/>The post refresh tasks scheduled by you have been completed successfully.<br/><br/>Thank You,<br/>System Administrator');
        
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] {mail});
    }
    
}