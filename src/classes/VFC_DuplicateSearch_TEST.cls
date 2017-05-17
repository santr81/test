/**
  * Author       : Accenture IDC Team
  * Created Date : 21/11/2013
  * Description  : Test Class for VFC_DuplicateSearch class.
  */
  
@isTest
private class VFC_DuplicateSearch_TEST{

    // Start of Constants for Test Methods
    
    private static final String ALIAS = 'dupe';
    private static final Integer NUM = 1;
    private static final String SYSTEM_ADMIN = 'System Administrator';
    private static final String TEST_NAME = 'testName';    
    private static final String ACCOUNT_OBJ = 'Account';
    private static final String DATA = 'data';
    private static final String CAMPAIGN_MEM_OBJ = 'CampaignMember';
    private static final String CREATE_VAR = 'Create';
    private static final String QUERY1 = 'SELECT AccountId FROM Opportunity';
    private static final String QUERY2 = 'SELECT Name FROM Opportunity';
    private static final String URL_STRING = '/apex/VFP_Merge?';
    private static final String OBJ = 'Account';
    private static final String PHONE_NO = '9876543210';
    private static final String PHONE_VAR = 'Phone';
    // End of Constants for Test Methods
    
    
    /**
      * @description       Method to create DuplicateLog__c test data. 
      * @param             recId the Object Record Id
      * @return            DuplicateLog__c
      * @throws            NA
      */
    private static DuplicateLog__c createDuplicateRecord(String recId){
        DuplicateLog__c dupeObj = new DuplicateLog__c();
        dupeObj.RecordInScope__c = recId;
        dupeObj.Object__c = OBJ ;
        insert dupeObj;
        return dupeObj;
    }
    
    /**
      * @description       Method to create PotentialDuplicates__c test data. 
      * @param             dupeLog the DuplicateLog__c Record Id
      * @return            PotentialDuplicates__c
      * @throws            NA
      */
    private static PotentialDuplicates__c createPotentialDupeRecord(Id dupeLog){
        PotentialDuplicates__c potDupeObj = new PotentialDuplicates__c();
        potDupeObj.DuplicateLog__c = dupeLog;
        potDupeObj.DuplicateRecord__c = String.valueOf(dupeLog);
        potDupeObj.RulesFired__c = TEST_NAME ;
        insert potDupeObj;
        return potDupeObj;
    }
    
    
    /**
      * @description       This Test Method is to verify that the the init method sets the FieldWrapper 
                           list conter to 0, so that only one field-value comparison row is present in the list.
      * @param             NA
      * @return            void
      * @throws            NA
      */
    private static testMethod void testIntialization(){
        User runUser = UTIL_TestMethods.runningUser(ALIAS+NUM , SYSTEM_ADMIN);
        UTIL_TestMethods.createCustomSetting(UTIL_DuplicateConstants.CUSTOM_SETTING_RECORD_LIMIT, 6);
        
        VFC_DuplicateSearch dupeController = new VFC_DuplicateSearch();
        dupeController.startCount = 1;
        Test.startTest();
        System.runAs(runUser){                          
            dupeController.init();               
        }
        Test.stopTest();
        System.assertEquals(dupeController.startCount, 0);
    }
    
    /**
      * @description       This Test Method is to verify that search method fetches PotentialDuplicates__c records
                           for the selected Record Id of an Object.
      * @return            void
      * @throws            NA
      */
    private static testMethod void testSearchRecSelected(){
        User runUser = UTIL_TestMethods.runningUser(ALIAS+NUM+1 , SYSTEM_ADMIN);
        UTIL_TestMethods.createCustomSetting(UTIL_DuplicateConstants.CUSTOM_SETTING_RECORD_LIMIT, 6);
        
        Account accData= new Account(Name=TEST_NAME);
        insert accData;
        
        DuplicateLog__c dupeLog = createDuplicateRecord(String.valueOf(accData.Id));        
        PotentialDuplicates__c potDupe = createPotentialDupeRecord(dupeLog.Id);
        
        VFC_DuplicateSearch dupeController = new VFC_DuplicateSearch();
        dupeController.cont.objectName = ACCOUNT_OBJ;
        dupeController.recSelected = String.valueOf(accData.Id);
        
        Test.startTest();
        System.runAs(runUser){                          
            dupeController.search();               
        }
        Test.stopTest();
        System.assertEquals(dupeController.potentialDupes.size(), 1);
    }
    
    /**
      * @description       This Test Method is to verify that search method fetches PotentialDuplicates__c records
                           for the selected Object, when no specific record is selected. 
      * @param             NA
      * @return            void
      * @throws            NA
      */
    private static testMethod void testSearchRecNotSelected(){
        User runUser = UTIL_TestMethods.runningUser(ALIAS+NUM+2 , SYSTEM_ADMIN);
        UTIL_TestMethods.createCustomSetting(UTIL_DuplicateConstants.CUSTOM_SETTING_RECORD_LIMIT, 6);
        
        Account accData= new Account(Name=TEST_NAME);
        insert accData;
        
        Opportunity oppData = new Opportunity(Name=TEST_NAME, StageName=CREATE_VAR, CloseDate=date.today());
        insert oppData;
        
        DuplicateLog__c dupeLogAcc = createDuplicateRecord(String.valueOf(accData.Id)); 
        DuplicateLog__c dupeLogOpp = createDuplicateRecord(String.valueOf(oppData.Id));       
        PotentialDuplicates__c potDupeAcc = createPotentialDupeRecord(dupeLogAcc.Id);
        PotentialDuplicates__c potDupeOpp = createPotentialDupeRecord(dupeLogOpp.Id);
        
        VFC_DuplicateSearch dupeController = new VFC_DuplicateSearch();
        dupeController.cont.objectName = ACCOUNT_OBJ;
        dupeController.recSelected = UTIL_DuplicateConstants.BLANK_SPACE;
        
        Test.startTest();
        System.runAs(runUser){                          
            dupeController.search();               
        }
        Test.stopTest();
        System.assertEquals(dupeController.potentialDupes.size(), 1);
    }
    
    /**
      * @description       This Test Method is to verify that search method throws query exception when the 
                           Object value is null. 
      * @param             NA
      * @return            void
      * @throws            NA
      */
    private static testMethod void testSearchQueryException(){
        User runUser = UTIL_TestMethods.runningUser(ALIAS+NUM+3 , SYSTEM_ADMIN);
        UTIL_TestMethods.createCustomSetting(UTIL_DuplicateConstants.CUSTOM_SETTING_RECORD_LIMIT, 6);
        
        Account accData= new Account(Name=TEST_NAME);
        insert accData;
        
        DuplicateLog__c dupeLog = createDuplicateRecord(String.valueOf(accData.Id));        
        PotentialDuplicates__c potDupe = createPotentialDupeRecord(dupeLog.Id);
        
        VFC_DuplicateSearch dupeController = new VFC_DuplicateSearch();
        dupeController.cont.objectName = UTIL_DuplicateConstants.BLANK_SPACE;
        dupeController.recSelected = UTIL_DuplicateConstants.BLANK_SPACE;
        
        Test.startTest();
        System.runAs(runUser){                          
            dupeController.search();               
        }
        Test.stopTest();
        System.assert(String.isNotBlank(dupeController.errorMsg));
    }
    
    /**
      * @description       This Test Method is to verify that searchDupe method fetches all duplicate records in the
                           same object when 'equals to' operator is selected for the field-value comparison.
      * @param             NA
      * @return            void
      * @throws            NA
      */
    private static testMethod void testSearchEquals(){
        User runUser = UTIL_TestMethods.runningUser(ALIAS+NUM+4 , SYSTEM_ADMIN);
        UTIL_TestMethods.createCustomSetting(UTIL_DuplicateConstants.CUSTOM_SETTING_RECORD_LIMIT, 6);
        
        Account accData1= new Account(Name=TEST_NAME);
        Account accData2= new Account(Name=TEST_NAME);
        insert accData1;
        insert accData2;
        
        VFC_DuplicateSearch dupeController = new VFC_DuplicateSearch();
        dupeController.fieldWrapList[0].compVal = TEST_NAME;
        dupeController.fieldWrapList[0].fieldSelected = UTIL_DuplicateConstants.NAME_FIELD;
        dupeController.fieldWrapList[0].opSelected = UTIL_DuplicateConstants.EQUALS_OP;
        dupeController.cont.objectName = ACCOUNT_OBJ;
        
        Test.startTest();
        System.runAs(runUser){                          
            dupeController.searchDupe();               
        }
        Test.stopTest();
        System.assertEquals(dupeController.duplicateRecords.size(), 2);
    }
    
    /**
      * @description       This Test Method is to verify that searchDupe method fetches all duplicate records in the
                           same object when 'LIKE' operator is selected for the field-value comparison.
      * @param             NA
      * @return            void
      * @throws            NA
      */
    private static testMethod void testSearchLIKE(){
        User runUser = UTIL_TestMethods.runningUser(ALIAS+NUM+5 , SYSTEM_ADMIN);
        UTIL_TestMethods.createCustomSetting(UTIL_DuplicateConstants.CUSTOM_SETTING_RECORD_LIMIT, 6);
        
        Account accData1= new Account(Name=TEST_NAME);
        Account accData2= new Account(Name=TEST_NAME);
        insert accData1;
        insert accData2;
        
        VFC_DuplicateSearch dupeController = new VFC_DuplicateSearch();
        dupeController.fieldWrapList[0].compVal = UTIL_DuplicateConstants.NAME_FIELD;
        dupeController.fieldWrapList[0].fieldSelected = UTIL_DuplicateConstants.NAME_FIELD;
        dupeController.fieldWrapList[0].opSelected = UTIL_DuplicateConstants.LIKE_OP;
        dupeController.cont.objectName = ACCOUNT_OBJ;
        
        Test.startTest();
        System.runAs(runUser){                          
            dupeController.searchDupe();               
        }
        Test.stopTest();
        System.assertEquals(dupeController.duplicateRecords.size(), 2);
    }
    
    /**
      * @description       This Test Method is to verify that searchDupe method fetches all duplicate records in the
                           same object when 'IN' operator is selected, and a list of comparison values are entered
                           for the field-value comparison.
      * @param             NA
      * @return            void
      * @throws            NA
      */
    private static testMethod void testSearchIN(){
        User runUser = UTIL_TestMethods.runningUser(ALIAS+NUM+6 , SYSTEM_ADMIN);
        UTIL_TestMethods.createCustomSetting(UTIL_DuplicateConstants.CUSTOM_SETTING_RECORD_LIMIT, 6);
        
        Account accData1= new Account(Name=TEST_NAME);
        Account accData2= new Account(Name=UTIL_DuplicateConstants.NAME_FIELD);
        insert accData1;
        insert accData2;
        
        VFC_DuplicateSearch dupeController = new VFC_DuplicateSearch();
        dupeController.fieldWrapList[0].compVal = UTIL_DuplicateConstants.NAME_FIELD+UTIL_DuplicateConstants.COMMA+TEST_NAME;
        dupeController.fieldWrapList[0].fieldSelected = UTIL_DuplicateConstants.NAME_FIELD;
        dupeController.fieldWrapList[0].opSelected = UTIL_DuplicateConstants.IN_OP;
        dupeController.cont.objectName = ACCOUNT_OBJ;
        
        Test.startTest();
        System.runAs(runUser){                          
            dupeController.searchDupe();               
        }
        Test.stopTest();
        System.assertEquals(dupeController.duplicateRecords.size(), 2);
    }
    
    
    /**
      * @description       This Test Method is to verify that searchDupe method fetches all duplicate records in the
                           same object when 'IN' operator is selected, and a query providing comparison values is entered
                           for the field-value comparison.
      * @param             NA
      * @return            void
      * @throws            NA
      */
    private static testMethod void testSearchINQuery(){
        User runUser = UTIL_TestMethods.runningUser(ALIAS+NUM+7 , SYSTEM_ADMIN);
        UTIL_TestMethods.createCustomSetting(UTIL_DuplicateConstants.CUSTOM_SETTING_RECORD_LIMIT, 6);
        
        Account accData= new Account(Name=TEST_NAME);
        insert accData;
        Opportunity oppData = new Opportunity(AccountId=accData.Id, Name=TEST_NAME, StageName=CREATE_VAR, 
                                              CloseDate=date.today());
        insert oppData;        
        
        VFC_DuplicateSearch dupeController = new VFC_DuplicateSearch();
        dupeController.fieldWrapList[0].compVal = QUERY1;
        dupeController.fieldWrapList[0].fieldSelected = UTIL_DuplicateConstants.ID_FIELD;
        dupeController.fieldWrapList[0].opSelected = UTIL_DuplicateConstants.IN_OP;
        dupeController.cont.objectName = ACCOUNT_OBJ;
        
        Test.startTest();
        System.runAs(runUser){                          
            dupeController.searchDupe();               
        }
        Test.stopTest();
        System.assertEquals(dupeController.duplicateRecords.size(), 1);
    }
    
    /**
      * @description       This Test Method is to verify that searchDupe method fetches an error message when the 
                           'IN' operator is selected, and a single is entered for the field-value comparison.
      * @param             NA
      * @return            void
      * @throws            NA
      */
    private static testMethod void testSearchINError(){
        User runUser = UTIL_TestMethods.runningUser(ALIAS+NUM+8 , SYSTEM_ADMIN);
        UTIL_TestMethods.createCustomSetting(UTIL_DuplicateConstants.CUSTOM_SETTING_RECORD_LIMIT, 6);
        
        Account accData= new Account(Name=TEST_NAME);
        insert accData;
        Opportunity oppData = new Opportunity(Name = TEST_NAME, StageName=CREATE_VAR, CloseDate=date.today());
        insert oppData;        
        
        VFC_DuplicateSearch dupeController = new VFC_DuplicateSearch();
        dupeController.fieldWrapList[0].compVal = TEST_NAME;
        dupeController.fieldWrapList[0].fieldSelected = UTIL_DuplicateConstants.NAME_FIELD;
        dupeController.fieldWrapList[0].opSelected = UTIL_DuplicateConstants.IN_OP;
        dupeController.cont.objectName = ACCOUNT_OBJ;
        
        Test.startTest();
        System.runAs(runUser){                          
            dupeController.searchDupe();               
        }
        Test.stopTest();
        System.assertEquals(dupeController.errorMsg, UTIL_DuplicateConstants.IN_ERROR_MSG);
    }
    
    
    /**
      * @description       This Test Method is to verify that searchDupe method fetches an error message when
                           no operator is selected in a field-value comparison.
      * @param             NA
      * @return            void
      * @throws            NA
      */
    private static testMethod void testSearchOpError(){
        User runUser = UTIL_TestMethods.runningUser(ALIAS+NUM+10 , SYSTEM_ADMIN);
        UTIL_TestMethods.createCustomSetting(UTIL_DuplicateConstants.CUSTOM_SETTING_RECORD_LIMIT, 6);
        
        Account accData= new Account(Name=TEST_NAME);
        insert accData;
        Opportunity oppData = new Opportunity(Name = TEST_NAME, StageName=CREATE_VAR, CloseDate=date.today());
        insert oppData;        
        
        VFC_DuplicateSearch dupeController = new VFC_DuplicateSearch();
        dupeController.fieldWrapList[0].compVal = TEST_NAME;
        dupeController.fieldWrapList[0].fieldSelected = UTIL_DuplicateConstants.NAME_FIELD;
        dupeController.fieldWrapList[0].opSelected = UTIL_DuplicateConstants.BLANK_SPACE;
        dupeController.cont.objectName = ACCOUNT_OBJ;
        
        Test.startTest();
        System.runAs(runUser){                          
            dupeController.searchDupe();               
        }
        Test.stopTest();
        System.assertEquals(dupeController.errorMsg, UTIL_DuplicateConstants.OP_BLANK_ERROR);
    }
    
    /**
      * @description       This Test Method is to verify that searchDupe method fetches an error message when
                           no no comparison value is entered for field-value comparison.
      * @param             NA
      * @return            void
      * @throws            NA
      */
    private static testMethod void testSearchError(){
        User runUser = UTIL_TestMethods.runningUser(ALIAS+NUM+10 , SYSTEM_ADMIN);
        UTIL_TestMethods.createCustomSetting(UTIL_DuplicateConstants.CUSTOM_SETTING_RECORD_LIMIT, 6);
        
        Account accData= new Account(Name=TEST_NAME);
        insert accData;
        Opportunity oppData = new Opportunity(Name = TEST_NAME, StageName=CREATE_VAR, CloseDate=date.today());
        insert oppData;        
        
        VFC_DuplicateSearch dupeController = new VFC_DuplicateSearch();
        dupeController.fieldWrapList[0].compVal = UTIL_DuplicateConstants.BLANK_SPACE;
        dupeController.fieldWrapList[0].fieldSelected = UTIL_DuplicateConstants.NAME_FIELD;
        dupeController.fieldWrapList[0].opSelected = UTIL_DuplicateConstants.EQUALS_OP;
        dupeController.cont.objectName = ACCOUNT_OBJ;
        
        Test.startTest();
        System.runAs(runUser){                          
            dupeController.searchDupe();               
        }
        Test.stopTest();
        System.assertEquals(dupeController.errorMsg, UTIL_DuplicateConstants.COMPVAL_BLANK_ERROR);
    }
    
    /**
      * @description       This Test Method is to verify that searchDupe method throws an exception, when selected operator 
                           in 'IN' and invalid inner query for a WHERE clause is obtained.
      * @param             NA
      * @return            void
      * @throws            NA
      */
    private static testMethod void testSearchDupeQueryException(){
        User runUser = UTIL_TestMethods.runningUser(ALIAS+NUM+11 , SYSTEM_ADMIN);
        UTIL_TestMethods.createCustomSetting(UTIL_DuplicateConstants.CUSTOM_SETTING_RECORD_LIMIT, 6);
        
        Account accData= new Account(Name=TEST_NAME);
        insert accData;
        Opportunity oppData = new Opportunity(Name = TEST_NAME, StageName=CREATE_VAR, CloseDate=date.today());
        insert oppData;        
        
        VFC_DuplicateSearch dupeController = new VFC_DuplicateSearch();
        dupeController.fieldWrapList[0].compVal = QUERY2;
        dupeController.fieldWrapList[0].fieldSelected = UTIL_DuplicateConstants.NAME_FIELD;
        dupeController.fieldWrapList[0].opSelected = UTIL_DuplicateConstants.IN_OP;
        dupeController.cont.objectName = ACCOUNT_OBJ;
        
        Test.startTest();
        System.runAs(runUser){                          
            dupeController.searchDupe();               
        }
        Test.stopTest();
        System.assert(String.isNotBlank(dupeController.errorMsg));
    }
    
    /**
      * @description       This Test Method is to verify that fecthRecords method fetches the record Ids of the 
                           selected Object when no 'Name' field is present in the Object.
      * @param             NA
      * @return            void
      * @throws            NA
      */
    private static testMethod void testFetchRecordNoName(){
        User runUser = UTIL_TestMethods.runningUser(ALIAS+NUM+12 , SYSTEM_ADMIN);
        UTIL_TestMethods.createCustomSetting(UTIL_DuplicateConstants.CUSTOM_SETTING_RECORD_LIMIT, 6);
        
        Campaign cmp = new Campaign(Name=TEST_NAME);
        Contact cnt = new Contact(LastName=TEST_NAME);
        Lead ld = new Lead(LastName=TEST_NAME, Company=TEST_NAME);
        insert cmp;
        insert cnt;
        insert ld;
        CampaignMember cmpMem = new CampaignMember(LeadId=ld.Id, ContactId=cnt.Id, CampaignId=cmp.Id);
        insert cmpMem;
        
        VFC_DuplicateSearch dupeController = new VFC_DuplicateSearch();
        dupeController.objectSelected = CAMPAIGN_MEM_OBJ;
        
        Test.startTest();
        System.runAs(runUser){                          
            dupeController.fetchRecords();               
        }
        Test.stopTest();
        System.assertEquals(dupeController.recOptions.size(), 2);
    }
    
    /**
      * @description       This Test Method is to verify that fecthRecords method throws an exception when the 
                           selected object obtained is null.
      * @param             NA
      * @return            void
      * @throws            NA
      */
    private static testMethod void testFetchRecordException(){
        User runUser = UTIL_TestMethods.runningUser(ALIAS+NUM+13 , SYSTEM_ADMIN);
        UTIL_TestMethods.createCustomSetting(UTIL_DuplicateConstants.CUSTOM_SETTING_RECORD_LIMIT, 6);
        
        VFC_DuplicateSearch dupeController = new VFC_DuplicateSearch();
        dupeController.objectSelected = null;
        
        Test.startTest();
        System.runAs(runUser){                          
            dupeController.fetchRecords();               
        }
        Test.stopTest();
        System.assert(String.isNotBlank(dupeController.errorMsg));
    }  
    
    /**
      * @description       This Test Method is to verify that mergeRecs method redirects to VFP_Merge page when
                           objectName and Record Ids are provided.
      * @param             NA
      * @return            void
      * @throws            NA
      */
    private static testMethod void testMerge(){
        User runUser = UTIL_TestMethods.runningUser(ALIAS+NUM+14 , SYSTEM_ADMIN);
        UTIL_TestMethods.createCustomSetting(UTIL_DuplicateConstants.CUSTOM_SETTING_RECORD_LIMIT, 6);
        
        Account acc1 = new Account(Name=TEST_NAME+NUM);
        Account acc2 = new Account(Name=TEST_NAME+NUM+1);
        insert acc1;
        insert acc2;
        
        VFC_DuplicateSearch dupeController = new VFC_DuplicateSearch();
        dupeController.recordIds.put(acc1.Id,true);
        dupeController.recordIds.put(acc2.Id,true);
        dupeController.cont.objectName = ACCOUNT_OBJ;
        
        PageReference pgRef;
        
        Test.startTest();
        System.runAs(runUser){                          
            pgRef = dupeController.mergeRecs();               
        }
        Test.stopTest();
        System.assert(String.valueOf(pgRef).contains(URL_STRING));
    }   
    
    /**
      * @description       This Test Method is to verify that mergeRecs method throws an exception when
                           no record Ids are obtained.
      * @param             NA
      * @return            void
      * @throws            NA
      */
    private static testMethod void testMergeException(){
        User runUser = UTIL_TestMethods.runningUser(ALIAS+NUM+15 , SYSTEM_ADMIN);
        UTIL_TestMethods.createCustomSetting(UTIL_DuplicateConstants.CUSTOM_SETTING_RECORD_LIMIT, 6);
        
        VFC_DuplicateSearch dupeController = new VFC_DuplicateSearch();
        dupeController.recordIds = null;
        dupeController.cont.objectName = ACCOUNT_OBJ;
        
        PageReference pgRef;
        
        Test.startTest();
        System.runAs(runUser){                          
            pgRef = dupeController.mergeRecs();               
        }
        Test.stopTest();
        System.assert(String.isNotBlank(dupeController.errorMsg));
    } 
    
    /**
      * @description       This Test Method is to verify that testSave method adds field-value comparison values to
                           the FieldWrapper list when called.
      * @param             NA
      * @return            void
      * @throws            NA
      */
    private static testMethod void testAddRows(){
        User runUser = UTIL_TestMethods.runningUser(ALIAS+NUM+16 , SYSTEM_ADMIN);
        UTIL_TestMethods.createCustomSetting(UTIL_DuplicateConstants.CUSTOM_SETTING_RECORD_LIMIT, 6);
        
        VFC_DuplicateSearch dupeController = new VFC_DuplicateSearch();
        dupeController.startCount = 0;
        dupeController.fieldWrapList[0].compVal=DATA;
        dupeController.fieldWrapList[0].opSelected =UTIL_DuplicateConstants.EQUALS_OP;
        dupeController.fieldWrapList[0].visible = false;
        
        Test.startTest();
        System.runAs(runUser){                          
            dupeController.testSave();               
        }
        Test.stopTest();
        System.assertEquals(dupeController.fieldWrapList.size(), 2);
    } 
    
    /**
      * @description       This Test Method is to verify that testSave method adds field-value comparison values to
                           the FieldWrapper list when the counter value is pointing at the first value of the List
                           i.e. the '+' button of the first field-value comparison calls this method.
      * @param             NA
      * @return            void
      * @throws            NA
      */
    private static testMethod void testAddRowsFromRowOne(){
        User runUser = UTIL_TestMethods.runningUser(ALIAS+NUM+17 , SYSTEM_ADMIN);
        UTIL_TestMethods.createCustomSetting(UTIL_DuplicateConstants.CUSTOM_SETTING_RECORD_LIMIT, 6);
        
        VFC_DuplicateSearch dupeController = new VFC_DuplicateSearch();
        dupeController.startCount = 0;
        dupeController.listCount = new List<Integer>{1,2,3};
        dupeController.fieldWrapList[0].compVal=DATA;
        dupeController.fieldWrapList[0].opSelected =UTIL_DuplicateConstants.EQUALS_OP;
        dupeController.fieldWrapList[0].visible = true;
        
        Test.startTest();
        System.runAs(runUser){                          
            dupeController.testSave();               
        }
        Test.stopTest();
        System.assertEquals(dupeController.startCount, 2);
    }  
    
    /**
      * @description       This Test Method is to verify that testSave method returns an error message when the 
                           comparison value of the last row is blank.
      * @param             NA
      * @return            void
      * @throws            NA
      */
    private static testMethod void testAddRowsCompValBlank(){
        User runUser = UTIL_TestMethods.runningUser(ALIAS+NUM+18 , SYSTEM_ADMIN);
        UTIL_TestMethods.createCustomSetting(UTIL_DuplicateConstants.CUSTOM_SETTING_RECORD_LIMIT, 6);
        
        VFC_DuplicateSearch dupeController = new VFC_DuplicateSearch();
        dupeController.startCount = 0;
        dupeController.fieldWrapList[0].opSelected=UTIL_DuplicateConstants.EQUALS_OP;
        dupeController.fieldWrapList[0].compVal=UTIL_DuplicateConstants.BLANK_SPACE;
        
        Test.startTest();
        System.runAs(runUser){                          
            dupeController.testSave();               
        }
        Test.stopTest();
        System.assertEquals(dupeController.errorMsg, UTIL_DuplicateConstants.COMPVAL_BLANK_ERROR);
    }
    
    /**
      * @description       This Test Method is to verify that testSave method returns an error message when no 
                           operator is selected for the last row.
      * @param             NA
      * @return            void
      * @throws            NA
      */
    private static testMethod void testAddRowsOpBlank(){
        User runUser = UTIL_TestMethods.runningUser(ALIAS+NUM+19 , SYSTEM_ADMIN);
        UTIL_TestMethods.createCustomSetting(UTIL_DuplicateConstants.CUSTOM_SETTING_RECORD_LIMIT, 6);
        
        VFC_DuplicateSearch dupeController = new VFC_DuplicateSearch();
        dupeController.startCount = 0;
        dupeController.fieldWrapList[0].compVal=TEST_NAME;
        dupeController.fieldWrapList[0].opSelected = UTIL_DuplicateConstants.BLANK_SPACE;
        
        Test.startTest();
        System.runAs(runUser){                          
            dupeController.testSave();               
        }
        Test.stopTest();
        System.assertEquals(dupeController.errorMsg, UTIL_DuplicateConstants.OP_BLANK_ERROR);
    }      
    
    /**
      * @description       This Test Method is to verify that testSave method returns an error message when the 
                           comparison value of the last row is not seperated by comma or is not a Query and
                           the 'IN' Operator is selected.
      * @param             NA
      * @return            void
      * @throws            NA
      */
    private static testMethod void testAddRowsOpSelectedIN(){
        User runUser = UTIL_TestMethods.runningUser(ALIAS+NUM+20 , SYSTEM_ADMIN);
        UTIL_TestMethods.createCustomSetting(UTIL_DuplicateConstants.CUSTOM_SETTING_RECORD_LIMIT, 6);
        
        VFC_DuplicateSearch dupeController = new VFC_DuplicateSearch();
        dupeController.startCount = 0;
        dupeController.fieldWrapList[0].compVal=DATA;
        dupeController.fieldWrapList[0].opSelected =UTIL_DuplicateConstants.IN_OP;
        
        Test.startTest();
        System.runAs(runUser){                          
            dupeController.testSave();               
        }
        Test.stopTest();
        System.assertEquals(dupeController.errorMsg, UTIL_DuplicateConstants.IN_ERROR_MSG);
    }
    
    /**
      * @description       This Test Method is to verify that testSave method returns an error message when the 
                           'IN' Operator is selected for the last row and User adds more field-value comparison rows.
      * @param             NA
      * @return            void
      * @throws            NA
      */
    private static testMethod void testAddRowsOpSelectedINError(){
        User runUser = UTIL_TestMethods.runningUser(ALIAS+NUM+21 , SYSTEM_ADMIN);
        UTIL_TestMethods.createCustomSetting(UTIL_DuplicateConstants.CUSTOM_SETTING_RECORD_LIMIT, 6);
        
        VFC_DuplicateSearch dupeController = new VFC_DuplicateSearch();
        dupeController.startCount = 0;
        dupeController.fieldWrapList[0].compVal=DATA+UTIL_DuplicateConstants.COMMA+TEST_NAME;
        dupeController.fieldWrapList[0].opSelected =UTIL_DuplicateConstants.IN_OP;
        
        Test.startTest();
        System.runAs(runUser){                          
            dupeController.testSave();               
        }
        Test.stopTest();
        System.assertEquals(dupeController.errorMsg, UTIL_DuplicateConstants.IN_LAST_OP_ERROR);
    }
    
    /**
      * @description       This Test Method is to verify that removeFieldWrapper method removes the field-value comparison
                           row at which the listIndex is set.
      * @param             NA
      * @return            void
      * @throws            NA
      */
    private static testMethod void testRemoveRows(){
        User runUser = UTIL_TestMethods.runningUser(ALIAS+NUM+22 , SYSTEM_ADMIN);
        UTIL_TestMethods.createCustomSetting(UTIL_DuplicateConstants.CUSTOM_SETTING_RECORD_LIMIT, 6);
        
        VFC_DuplicateSearch dupeController = new VFC_DuplicateSearch();
        dupeController.listIndex = 1;
        dupeController.fieldWrapList.clear();
        
        List<VFC_DuplicateSearch.FieldWrapper> wrapList = new List<VFC_DuplicateSearch.FieldWrapper>();
        VFC_DuplicateSearch.FieldWrapper wrapRec = new VFC_DuplicateSearch.FieldWrapper();
        wrapRec.visible = true;
        for(Integer i=0; i<2; i++){            
            wrapList.add(wrapRec);
        }  
        
        for(VFC_DuplicateSearch.FieldWrapper rec : wrapList){
            dupeController.fieldWrapList.add(rec);   
        }
        
        Test.startTest();
        System.runAs(runUser){                          
            dupeController.removeFieldWrapper();               
        }
        Test.stopTest();
        System.assertEquals(dupeController.fieldWrapList[0].visible, false);
    }  
    
    /**
      * @description       This Test Method is to verify that next method refreshes the list of selected Object records 
                           to be displayed to contain the last record of the list of records.
      * @param             NA
      * @return            void
      * @throws            NA
      */
    private static testMethod void testPaginationNext(){
        
        User runUser = UTIL_TestMethods.runningUser(ALIAS+NUM+23 , SYSTEM_ADMIN);
        UTIL_TestMethods.createCustomSetting(UTIL_DuplicateConstants.CUSTOM_SETTING_RECORD_LIMIT, 6);
                
        VFC_DuplicateSearch dupeController = new VFC_DuplicateSearch();
        Account[] accList = new Account[7];
        
        for(Integer i=0; i<=6; i++){
            accList[i] = new Account(Name=TEST_NAME+i, Phone=PHONE_NO);
        }
        insert accList;
        
        dupeController.fieldWrapList = new List<VFC_DuplicateSearch.FieldWrapper>();
        VFC_DuplicateSearch.FieldWrapper fldWp = new VFC_DuplicateSearch.FieldWrapper();
        fldWp.fieldSelected = PHONE_VAR;
        fldWp.opSelected = UTIL_DuplicateConstants.EQUALS_OP;
        fldWp.compVal = PHONE_NO;
        dupeController.fieldWrapList.add(fldWp);
        
        dupeController.searchDupe();      
        Test.startTest();
        System.runAs(runUser){ 
            dupeController.next();    
        }
        Test.stopTest();   
        System.assertEquals(dupeController.duplicateRecordMap.size(), 1);
    }
    
    /**
      * @description       This Test Method is to verify that previous method refreshes the list of selected Object records 
                           to be displayed to contain the first 6 records of the list of records.
      * @param             NA
      * @return            void
      * @throws            NA
      */
    private static testMethod void testPaginationPrevious(){
        
        User runUser = UTIL_TestMethods.runningUser(ALIAS+NUM+24 , SYSTEM_ADMIN);
        UTIL_TestMethods.createCustomSetting(UTIL_DuplicateConstants.CUSTOM_SETTING_RECORD_LIMIT, 6);
        
        VFC_DuplicateSearch dupeController = new VFC_DuplicateSearch();
        Account[] accList = new Account[7];
        
        for(Integer i=0; i<=6; i++){
            accList[i] = new Account(Name=TEST_NAME+i, Phone=PHONE_NO);
        }
        insert accList;
        
        dupeController.fieldWrapList = new List<VFC_DuplicateSearch.FieldWrapper>();
        VFC_DuplicateSearch.FieldWrapper fldWp = new VFC_DuplicateSearch.FieldWrapper();
        fldWp.fieldSelected = PHONE_VAR;
        fldWp.opSelected = UTIL_DuplicateConstants.EQUALS_OP;
        fldWp.compVal = PHONE_NO;
        dupeController.fieldWrapList.add(fldWp);
        
        dupeController.searchDupe();     
        dupeController.next();
         
        Test.startTest();
        System.runAs(runUser){ 
            dupeController.previous();    
        }
        Test.stopTest();   
        System.assertEquals(dupeController.duplicateRecordMap.size(),6);
    }
}