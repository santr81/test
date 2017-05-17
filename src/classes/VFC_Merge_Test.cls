/**
  * @author        Nandan Narasappa
  * @date          21/11/2013
  * @description   Test Class for VFC_Merge for testing Merge process for duplicates of sObject
  */    
@isTest
private class VFC_Merge_Test{
	
	// Start of Class Variables
    private static final String MASTER_KEY = '$MASTER$'; 
    private static final String READ_ONLY = 'Read Only'; 
    private static final String USER_EMAIL = 'standarduser@testorg.com'; 
    private static final String LOCALE_KEY = 'en_US'; 
    private static final String ENCODE_KEY = 'UTF-8'; 
    private static final String NAME_POSTFIX = '@testorg.com';
    private static final String ZONE_KEY = 'America/Los_Angeles'; 
    private static final string OBJ = 'obj';
    private static final string ID = 'id';
    private static final string FORWARD_SLASH = '/';
    private static final string ACCOUNT_OBJ = 'Account';
    private static final string CONTACT_OBJ = 'Contact';
    private static final string RULE_OBJ = 'Rule__c';
    private static final string DUPE_ONE = 'Dupe-1';
    private static final string DUPE_TWO = 'Dupe-2';
    private static final string RULE_ONE = 'Rule-1';
    private static final string RULE_TWO = 'Rule-2';
    private static final string RULE_THREE = 'Rule-3';
    private static final string ACCOUNT_PHONE = '123456';
    private static final string BANKING_INDUSTRY = 'Banking';
    private static final string INSURANCE_INDUSTRY = 'Insurance';
    private static final string RECORD_ID = 'recordId';
    private static final string PREVENT_ACTION = 'Prevent';
    private static final string LOG_DUPLICATE = 'Log Duplicate';
    private static final string ID_ONE = 'id_1';
    private static final string ID_TWO = 'id_2';
    private static final string ID_THREE = 'id_3';
    private static final string ID_FOUR = 'id_4';
    private static final string ID_FIVE = 'id_5';
    private static final String BLANK_SPACE = '';
    private static final String READ_ONLY_USER = 'readOnly';
    private static final String TEST_VAL = 'Test';
    private static final String NULL_VAL = 'null';
    private static final string NAME_FIELD = 'Name';
    private static final string ACCOUNT_LONG_DESC = '01:07:55.202 (2202220000)|USER_DEBUG|[292]|DEBUG|** fieldRows ==>'+ 
    												'(FieldRow:[fieldLabel=, fieldName=, selectedValue=null, showRadio=false'+
    												', styleClass=header,values=(Cell:[objId=a08f0000000j47IAAQ, value=Rule-1],'+
    												'Cell:[objId=a08f0000000j47JAAQ, value=Rule-2])]';
    // End of Class Variables   
        
    /**
      * @description       This method is a utility method to create account for the test methods
      * @param             name       Name of the account
      * @param             phone      phone number of the account
      * @param             industry   industry of the account
      * @return            Account
      * @throws            NA
      */    
    private static Account createAccount(String name,String phone,String industry){
        Account acc = new Account(Name = name ,Phone = phone,Industry = industry);
        return acc;
    }
    
    /**
      * @description       This method is a utility method to create contact for the test methods
      * @param             lastName   lastName of the contact record
      * @param             accId      Id of the account record with which the contact will be associated
      * @return            Contact
      * @throws            NA
      */    
    private static Contact createContact(String lastName,String accId){
        Contact con = new Contact(LastName = lastName ,AccountId = accId);
        return con;
    }
    
    /**
      * @description       This method is a utility method to create rule for the test methods
      * @param             name      Name of the rule for test method
      * @param             objName   Name of the object the rule to apply for test method
      * @param             action    Action to be performed in case of duplicates
      * @param             isActive  Boolean to indicate whether the rule is active or not
      * @return            Rule__c
      * @throws            NA
      */
    private static Rule__c createRule(String name,String action ,Boolean isActive, String objName){
        Rule__c rule = new Rule__c(Name = name ,Action__c= action ,IsActive__c= isActive,Object__c = objName);
        return rule;
    }
    
    /**
      * @description       This method is a utility method to create rule criteria for the test methods
      * @param             ruleId     Id of the rule 
      * @param             fieldName  field name of the object selected in the rule
      * @param             isPhonetic Boolean to indicate whether to perform Phonetic search or not
      * @param             isFuzzy    Boolean to indicate whether to perform Fuzzy search or not
      * @return            RuleCriteria__c
      * @throws            NA
      */ 
    private static RuleCriteria__c createRuleCriteria(String ruleId,String fieldName,boolean isPhonetic,Boolean isFuzzy){
    	RuleCriteria__c criteria = new RuleCriteria__c(Rule__c = ruleId, Field__c = fieldName, 
    													IsPhonetic__c = isPhonetic, IsFuzzy__c = isFuzzy);
    	return criteria;
    }
    
    /**
      * @description       This method is a utility method to create user for the test methods
      * @param             alias      alias of the user record
      * @return            User
      * @throws            NA
      */
    private static User createUser(String alias){
        Profile p = [SELECT Id FROM Profile WHERE Name=: READ_ONLY]; 
        User usr = new User(Alias = alias, Email = USER_EMAIL, 
                          EmailEncodingKey=ENCODE_KEY, LastName=alias, LanguageLocaleKey=LOCALE_KEY, 
                          LocaleSidKey=LOCALE_KEY, ProfileId = p.Id, 
                          TimeZoneSidKey=ZONE_KEY, UserName=alias+NAME_POSTFIX);
        return usr;
    }
    
    /**
      * @description       Test method to validate merge process for standard object with two records in context and
      					   selecting the master record and values to be merged.
      * @param             NA
      * @return            Void
      * @throws            NA
      */     
    private static testMethod void testMergeStd(){
        PageReference pageRef = Page.VFP_Merge;
        PageReference redirectedPageRef ;
        Test.setCurrentPage(pageRef);
        pageRef.getParameters().put(OBJ,ACCOUNT_OBJ);          
        List<Account> accList = new List<Account>();
        Account accDupe1 = createAccount(DUPE_ONE,ACCOUNT_PHONE,BANKING_INDUSTRY);
        accDupe1.Description = ACCOUNT_LONG_DESC ;
        Account accDupe2 = createAccount(DUPE_TWO,ACCOUNT_PHONE,INSURANCE_INDUSTRY);
        accList.add(accDupe1);
        accList.add(accDupe2);
        Database.insert(accList);
        pageRef.getParameters().put(ID_ONE, accDupe1.id);   
        pageRef.getParameters().put(ID_TWO,accDupe2.id);   
        Test.startTest();
            VFC_Merge extn = new VFC_Merge(); 
            pageRef.getParameters().put(RECORD_ID, accDupe1.id);  
            extn.selectDefaultRecord();
            redirectedPageRef = extn.mergeRecords(); 
        Test.stopTest();
        System.assertEquals(String.valueOF(new Pagereference(FORWARD_SLASH+accDupe1.id)),String.valueOF(redirectedPageRef));
    }
    
    /**
      * @description       Test method to validate merge process for custom object with two records in context and
      					   selecting the master record and values to be merged.
      * @param             NA
      * @return            Void
      * @throws            NA
      */  
    private static testMethod void testMergeCustom(){
        PageReference pageRef = Page.VFP_Merge;
        PageReference redirectedPageRef ;
        Test.setCurrentPage(pageRef);
        pageRef.getParameters().put(OBJ,RULE_OBJ);          
        List<Rule__c> accList = new List<Rule__c>();
        Rule__c accDupe1 = createRule(RULE_ONE,PREVENT_ACTION,true,ACCOUNT_OBJ);
        Rule__c accDupe2 = createRule(RULE_TWO,LOG_DUPLICATE,false,CONTACT_OBJ);
        Rule__c accDupe3 = createRule(RULE_THREE,LOG_DUPLICATE,true,RULE_OBJ);
        accList.add(accDupe1);
        accList.add(accDupe2);
        accList.add(accDupe3);
        Database.insert(accList);
        pageRef.getParameters().put(ID_ONE, accDupe1.id);   
        pageRef.getParameters().put(ID_TWO,accDupe2.id); 
        pageRef.getParameters().put(ID_THREE,accDupe3.id);   
        Test.startTest();
            VFC_Merge extn = new VFC_Merge(); 
            pageRef.getParameters().put(RECORD_ID, accDupe2.id);  
            extn.selectDefaultRecord();
            redirectedPageRef = extn.mergeRecords(); 
        Test.stopTest();
        System.assertEquals(String.valueOF(new Pagereference(FORWARD_SLASH+accDupe2.id)),String.valueOF(redirectedPageRef));
    }
    
    /**
      * @description       Test method to validate merge process for exception when records in context are
      					   of two different sObject type
      * @param             NA
      * @return            Void
      * @throws            NA
      */
    private static testMethod void testMergeDiffObj(){
        PageReference pageRef = Page.VFP_Merge;
        Test.setCurrentPage(pageRef); 
        pageRef.getParameters().put(OBJ,RULE_OBJ);          
        Account accDupe1 = createAccount(DUPE_ONE,ACCOUNT_PHONE,BANKING_INDUSTRY);
        Rule__c rule = createRule(RULE_ONE,PREVENT_ACTION,true,ACCOUNT_OBJ);        
        Database.insert(accDupe1 );
        Database.insert(rule );
        pageRef.getParameters().put(ID_ONE, accDupe1.id);   
        pageRef.getParameters().put(ID_TWO,rule.id);  
        Test.startTest();
            VFC_Merge extn = new VFC_Merge();  
        Test.stopTest();
        System.assertEquals(String.valueOf(ApexPages.getMessages()[0].getDetail()),UTIL_DuplicateConstants.SAME_OBJ_ERROR); 
    }
    
    /**
      * @description       Test method to validate merge process for exception when only one record is in context
      * @param             NA
      * @return            Void
      * @throws            NA
      */
    private static testMethod void testMergeOneObj(){
        PageReference pageRef = Page.VFP_Merge;
        Test.setCurrentPage(pageRef);
        pageRef.getParameters().put(OBJ,RULE_OBJ);          
        Account accDupe1 = createAccount(DUPE_ONE,ACCOUNT_PHONE,BANKING_INDUSTRY);     
        Database.insert(accDupe1 );
        pageRef.getParameters().put(ID_ONE, accDupe1.id);   
        Test.startTest();
            VFC_Merge extn = new VFC_Merge();  
        Test.stopTest();
        System.assertEquals(String.valueOf(ApexPages.getMessages()[0].getDetail()),UTIL_DuplicateConstants.MIN_RECORD_ERROR);
    }
    
    /**
      * @description       Test method to validate merge process for exception when invalid object is passed
      * @param             NA
      * @return            Void
      * @throws            NA
      */
    private static testMethod void testMergeInvalidObj(){
        PageReference pageRef = Page.VFP_Merge;
        Test.setCurrentPage(pageRef);
        pageRef.getParameters().put(OBJ,BLANK_SPACE);          
        Account accDupe1 = createAccount(DUPE_ONE,ACCOUNT_PHONE,BANKING_INDUSTRY);     
        Database.insert(accDupe1 );
        pageRef.getParameters().put(ID_ONE, accDupe1.id);   
        Test.startTest();
            VFC_Merge extn = new VFC_Merge();  
        Test.stopTest();
        System.assertEquals(String.valueOf(ApexPages.getMessages()[0].getDetail()),UTIL_DuplicateConstants.INVALID_OBJECT);
    }
    
    /**
      * @description       Test method to validate merge process for exception with no record in context
      * @param             NA
      * @return            Void
      * @throws            NA
      */
    private static testMethod void testMergeNoRec(){
        PageReference pageRef = Page.VFP_Merge;
        Test.setCurrentPage(pageRef);
        pageRef.getParameters().put(OBJ,ACCOUNT_OBJ);         
        Test.startTest();
            VFC_Merge extn = new VFC_Merge();  
        Test.stopTest();
        System.assertEquals(String.valueOf(ApexPages.getMessages()[0].getDetail()),UTIL_DuplicateConstants.MIN_RECORD_ERROR);
    }
    
    /**
      * @description       Test method to validate merge process for exception with null object in context
      * @param             NA
      * @return            Void
      * @throws            NA
      */
    private static testMethod void testMergeExp(){
        PageReference pageRef = Page.VFP_Merge;
        Test.setCurrentPage(pageRef);
        pageRef.getParameters().put(OBJ,NULL_VAL);         
        Test.startTest();
            VFC_Merge extn = new VFC_Merge();  
        Test.stopTest();
        System.assertEquals(String.valueOf(ApexPages.getMessages()[0].getDetail()),UTIL_DuplicateConstants.MIN_RECORD_ERROR);
    } 
    
    /**
      * @description       Test method to validate merge process with no master record selected for merge
      * @param             NA
      * @return            Void
      * @throws            NA
      */
    private static testMethod void testMergeNoMaster(){
        PageReference pageRef = Page.VFP_Merge;
        Test.setCurrentPage(pageRef);
        pageRef.getParameters().put(OBJ,RULE_OBJ);          
        List<Rule__c> accList = new List<Rule__c>();
        Rule__c accDupe1 = createRule(RULE_ONE,PREVENT_ACTION,true,ACCOUNT_OBJ);
        Rule__c accDupe2 = createRule(RULE_TWO,LOG_DUPLICATE,false,CONTACT_OBJ);
        accList.add(accDupe1);
        accList.add(accDupe2);
        Database.insert(accList);
        pageRef.getParameters().put(ID_ONE, accDupe1.id);   
        pageRef.getParameters().put(ID_TWO,accDupe2.id);   
        Test.startTest();
            VFC_Merge extn = new VFC_Merge(); 
            pageRef.getParameters().put(RECORD_ID, BLANK_SPACE);  
            extn.selectDefaultRecord();
            List<VFC_Merge.FieldRow> rows = new List<VFC_Merge.FieldRow>();
            for (VFC_Merge.FieldRow row : extn.fieldRows) {
                if (row.showRadio && row.fieldName.equals(MASTER_KEY)) {
                    row.fieldName = TEST_VAL;
                    rows.add(row);
                }
            }
            extn.fieldRows = rows;
            extn.mergeRecords(); 
        Test.stopTest();
        System.assertEquals(String.valueOf(ApexPages.getMessages()[0].getDetail()),UTIL_DuplicateConstants.SELECT_RECORD_INFO);
    } 
    
    /**
      * @description       Test method to validate merge process with master record & values
      					   selected for merge from different record
      * @param             NA
      * @return            Void
      * @throws            NA
      */
    private static testMethod void testMergeValues(){
        PageReference pageRef = Page.VFP_Merge;
        PageReference redirectedPageRef;
        Test.setCurrentPage(pageRef);
        pageRef.getParameters().put(OBJ,RULE_OBJ);          
        List<Rule__c> accList = new List<Rule__c>();
        Rule__c accDupe1 = createRule(RULE_ONE,PREVENT_ACTION,true,ACCOUNT_OBJ);
        Rule__c accDupe2 = createRule(RULE_TWO,null,false,CONTACT_OBJ);
        accList.add(accDupe1);
        accList.add(accDupe2);
        Database.insert(accList);
        RuleCriteria__c criteria = createRuleCriteria(accDupe2.id,NAME_FIELD,true,true);
        Database.insert(criteria);
        pageRef.getParameters().put(ID_ONE, accDupe1.id);   
        pageRef.getParameters().put(ID_TWO,accDupe2.id);   
        Test.startTest();
            VFC_Merge extn = new VFC_Merge(); 
            extn.transferChild = true;
            pageRef.getParameters().put(RECORD_ID, accDupe1.id);  
            extn.selectDefaultRecord();
            List<VFC_Merge.FieldRow> rows = new List<VFC_Merge.FieldRow>();
            for (VFC_Merge.FieldRow row : extn.fieldRows) {
                if (row.showRadio && !row.fieldName.equals(MASTER_KEY)) {
                    row.selectedValue = accDupe2.id;
                }
                rows.add(row);
            }
            extn.fieldRows.clear();
            extn.fieldRows.addALL(rows);
            redirectedPageRef = extn.mergeRecords(); 
        Test.stopTest();
        System.assertEquals(String.valueOF(new Pagereference(FORWARD_SLASH+accDupe1.id)),String.valueOF(redirectedPageRef)); 
    } 
    
    /**
      * @description       Test method to validate merge process with records in context locked already
      * @param             NA
      * @return            Void
      * @throws            NA
      */    
    private static testMethod void testMergeLock(){
        PageReference pageRef = Page.VFP_Merge;
        Test.setCurrentPage(pageRef);
        pageRef.getParameters().put(OBJ,RULE_OBJ);          
        List<Rule__c> accList = new List<Rule__c>();
        Rule__c accDupe1 = createRule(RULE_ONE,PREVENT_ACTION,true,ACCOUNT_OBJ);
        Rule__c accDupe2 = createRule(RULE_TWO,LOG_DUPLICATE,false,CONTACT_OBJ);
        accList.add(accDupe1);
        accList.add(accDupe2);
        Database.insert(accList);
        pageRef.getParameters().put(ID_ONE, accDupe1.id);   
        pageRef.getParameters().put(ID_TWO,accDupe2.id);   
        Test.startTest();
            VFC_Merge extn = new VFC_Merge(); 
            pageRef.getParameters().put(RECORD_ID, accDupe1.id);  
            extn.selectDefaultRecord();
            Database.delete(accList);
            extn.mergeRecords(); 
        Test.stopTest();
        System.assertEquals(String.valueOf(ApexPages.getMessages()[0].getDetail()),UTIL_DuplicateConstants.RECORD_LOCK_ERROR);
    } 
    
    /**
      * @description       Test method to validate merge process for exception while deleting the losing records in context
      * @param             NA
      * @return            Void
      * @throws            NA
      */    
    private static testMethod void testMergeDelExp(){
        PageReference pageRef = Page.VFP_Merge;
        Test.setCurrentPage(pageRef);
        pageRef.getParameters().put(OBJ,RULE_OBJ);          
        List<Rule__c> accList = new List<Rule__c>();
        Rule__c accDupe1 = createRule(RULE_ONE,PREVENT_ACTION,true,ACCOUNT_OBJ);
        Rule__c accDupe2 = createRule(RULE_TWO,LOG_DUPLICATE,false,CONTACT_OBJ);
        accList.add(accDupe1);
        accList.add(accDupe2);
        Database.insert(accList);
        pageRef.getParameters().put(ID_ONE, accDupe1.id);   
        pageRef.getParameters().put(ID_TWO,accDupe2.id);   
        Test.startTest();
            System.runAs(createUser(READ_ONLY_USER)){
                VFC_Merge extn = new VFC_Merge(); 
                pageRef.getParameters().put(RECORD_ID, accDupe1.id);  
                extn.selectDefaultRecord();
                extn.mergeRecords();
            } 
        Test.stopTest();
        System.assert(String.valueOf(ApexPages.getMessages()[0].getDetail()).contains(UTIL_DuplicateConstants.MERGE_ERROR));
    } 
    
    /**
      * @description       Test method to validate merge process with master record & values
      					   selected for merge for five records
      * @param             NA
      * @return            Void
      * @throws            NA
      */
    private static testMethod void testMergeFiveRecords(){
        PageReference pageRef = Page.VFP_Merge;
        PageReference redirectedPageRef ;
        Test.setCurrentPage(pageRef);
        pageRef.getParameters().put(OBJ,ACCOUNT_OBJ);          
        List<Account> accList = new List<Account>();
        Account accDupe1 = createAccount(DUPE_ONE,ACCOUNT_PHONE,BANKING_INDUSTRY);
        accDupe1.Description = ACCOUNT_LONG_DESC ;
        Account accDupe2 = createAccount(DUPE_TWO,ACCOUNT_PHONE,INSURANCE_INDUSTRY);
        Account accDupe3 = createAccount(DUPE_TWO,ACCOUNT_PHONE,INSURANCE_INDUSTRY);
        Account accDupe4 = createAccount(DUPE_TWO,ACCOUNT_PHONE,INSURANCE_INDUSTRY);
        Account accDupe5 = createAccount(DUPE_TWO,ACCOUNT_PHONE,INSURANCE_INDUSTRY);
        accList.add(accDupe1);
        accList.add(accDupe2);
        accList.add(accDupe3);
        accList.add(accDupe4);
        accList.add(accDupe5);
        Database.insert(accList);
        Contact con = createContact(TEST_VAL,accList[2].Id);
        Database.insert(con);
        Case cs = new Case(AccountId = accList[2].Id);
        Database.insert(cs);
        Note note = new Note(Title = TEST_VAL,Body = TEST_VAL,ParentId = accList[3].Id);
        Database.insert(note);
        Attachment attch = new Attachment(ParentId = accList[3].Id,Body = BLOB.valueOf(TEST_VAL),Name = TEST_VAL);
        Database.insert(attch);
        pageRef.getParameters().put(ID_ONE, accDupe1.id);   
        pageRef.getParameters().put(ID_TWO,accDupe2.id);  
        pageRef.getParameters().put(ID_THREE,accDupe3.id);
        pageRef.getParameters().put(ID_FOUR,accDupe4.id);
        pageRef.getParameters().put(ID_FIVE,accDupe5.id); 
        Test.startTest();
            VFC_Merge extn = new VFC_Merge(); 
            extn.transferChild = true;
            pageRef.getParameters().put(RECORD_ID, accDupe1.id);  
            extn.selectDefaultRecord();
            redirectedPageRef = extn.mergeRecords(); 
        Test.stopTest();
        System.assertEquals(String.valueOF(new Pagereference(FORWARD_SLASH+accDupe1.id)),String.valueOF(redirectedPageRef)); 
    }
    
}