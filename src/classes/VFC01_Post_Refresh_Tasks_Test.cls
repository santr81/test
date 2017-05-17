@isTest (seealldata = true)
private class VFC01_Post_Refresh_Tasks_Test {

    @isTest static void testPostRefreshTasks() {
        
        VFC01_Post_Refresh_Tasks pstController = new VFC01_Post_Refresh_Tasks();
        
        List<AP02_RemoteSiteSettingsWrapper> remoteSiteSettingsWrapperList = new List<AP02_RemoteSiteSettingsWrapper>();
        remoteSiteSettingsWrapperList.add(new AP02_RemoteSiteSettingsWrapper('test1', 'www.google.com', false, true, true));
        remoteSiteSettingsWrapperList.add(new AP02_RemoteSiteSettingsWrapper('test2', 'www.yahoo.com', false, true, true));
        
        pstController.remoteSiteSettingsWrapperList = remoteSiteSettingsWrapperList;
        AP02_RemoteSiteSettingsWrapper ap02 = new AP02_RemoteSiteSettingsWrapper();
        ap02.compareTo(new AP02_RemoteSiteSettingsWrapper('test2', 'www.yahoo.com', false, true, true));
        //Test.setMock(WebServiceMock.class, new AP05_MetadataRetrieveMockImpl());
        
        Test.startTest();
        
        pstController.checkInitialSetup();
        pstController.initialSetupCompleted();
        pstController.getEmailFieldsList();
        pstController.getScheduledJobsList();
        pstController.getRemoteSiteSettingsList();
        
        pstController.checkAsyncRequest();
     //   pstController.checkAsyncRequest();
        
        pstController.getRemoteSiteSettingsList();
        pstController.getEmailFieldsList();
        
      //  pstController.emailFieldsWrapperList = pstController.getStandardEmailAddressFields();
        pstController.schedulePostRefreshTasks();
        pstController.confirmPostRefreshTasks();
        pstController.cancelPostRefreshTasks();

        pstController.populateScheduledJobsList();
        pstController.processMetadataZipStaticResource();
        pstController.deleteMetadataZipStaticResource();
        
        AP08_EmailFieldsWrapper wrap = new AP08_EmailFieldsWrapper('Email','email','Contact',true);
        
        List<AP08_EmailFieldsWrapper> wraplist = new list<AP08_EmailFieldsWrapper>();
        wraplist.add(wrap);
        pstController.emailFieldsWrapperList = wraplist;
        
        pstController.getEmailFieldsList();
        pstController.processMetadataZipStaticResource();
        
        AP04_Data_Updates_Sch dataUpdatesBatch = new AP04_Data_Updates_Sch();
        dataUpdatesBatch.sendCompleteNotification();
        
        VFC01_Post_Refresh_Tasks.ScheduledJobsWrapper s = new VFC01_Post_Refresh_Tasks.ScheduledJobsWrapper('jobId', 'jobName', 'jobType', true, system.now(), 'state');
        
        Test.stopTest();
        
    }
    
}