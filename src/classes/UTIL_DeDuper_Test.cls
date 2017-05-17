/**
  * @author        Nandan Narasappa
  * @date          17/11/2013
  * @description   Test Class for UTIL_DeDuper for testing De-Duplication for an sObject
                   based on rule criterias using exact or phonetic or fuzzy match
  */    
@isTest
private class UTIL_DeDuper_Test{
    
    // Start of Class Variables
    private static final string RULE_NAME = 'Unique Account';
    private static final string ACCOUNT_OBJ = 'Account';
    private static final string LOG_DUPLICATE = 'Log Duplicate';
    private static final string PREVENT = 'Prevent';
    private static final string NAME_FIELD = 'Name';
    private static final string PHONE_FIELD = 'Phone';
    private static final boolean TRUE_VALUE = true;
    private static final boolean FALSE_VALUE = false;
    private static final string ACCOUNT_KLOAK = 'Kloak';
    private static final string ACCOUNT_CAK = 'Cak';
    private static final string ACCOUNT_CLOAK = 'Cloak';
    private static final string ACCOUNT_CLAK = 'Clak';
    private static final string ACCOUNT_TEST = 'Test';
    private static final string ACCOUNT_PHONE = '123456';
    private static final string SMITH = 'Smith';
    private static final string CONVERTED_CODE = 'SM0';
    private static List<string> stringList = new List<String>{'knight','lamb','air', 'chair' ,'edge','rough','maggi',
                                                              'mahla','xavier','urguay','what' ,'van','IOT','IATH',
                                                              'ias','teq','physics','jade','tehg', 'face', 'schedule',
                                                               'bat', 'freeze','choose','bags','kettle','xylo','ty',
                                                               'tax','jaw','triage','she','p','eh','cia','ghan','gy',
                                                               'dh','ITIOA','pawe','yeah','behp','yhs'};
    // End of Class Variables
    
    /**
      * @description       This method is a utility method to create rule for the test methods
      * @param             name      Name of the rule for test method
      * @param             objName   Name of the object the rule to apply for test method
      * @param             action    Action to be performed in case of duplicates
      * @param             isActive  Boolean to indicate whether the rule is active or not
      * @return            Rule__c
      * @throws            NA
      */ 
    private static Rule__c createRule(String name,String objName,String action,Boolean isActive){
        Rule__c rule = new Rule__c(Name = name, Object__c = objName, Action__c = action, isActive__c = isActive);
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
      * @description       This method is a utility method to create account for the test methods
      * @param             name       Name of the account
      * @param             phone      phone number of the account
      * @return            Account
      * @throws            NA
      */ 
    private static Account createAccount(string name,string phone){
        Account acc = new Account(Name = name,Phone = phone);
        return acc;
    }
    
    /**
      * @description       This method creates test data for the test methods to validate the funcationality
      * @param             NA
      * @return            Void
      * @throws            NA
      */
    private static void createTestData(){
        Rule__c rule = createRule(RULE_NAME,ACCOUNT_OBJ,LOG_DUPLICATE,TRUE_VALUE);
        Database.insert(rule);
        RuleCriteria__c criteria = createRuleCriteria(rule.id,NAME_FIELD,TRUE_VALUE,TRUE_VALUE); 
        RuleCriteria__c phoneCriteria = createRuleCriteria(rule.id,PHONE_FIELD,FALSE_VALUE,FALSE_VALUE); 
        List<RuleCriteria__c> criterias = new List<RuleCriteria__c>();
        criterias.add(criteria);
        criterias.add(phoneCriteria);
        Database.insert(criterias);   
        
        List<Account> accList = new List<Account>();               
        Account acc1 = createAccount(ACCOUNT_KLOAK,ACCOUNT_PHONE); 
        Account acc2 = createAccount(ACCOUNT_CAK,ACCOUNT_PHONE);   
        Account acc3 = createAccount(ACCOUNT_TEST,ACCOUNT_PHONE);
        accList.add(acc1);    
        accList.add(acc2);    
        accList.add(acc3);     
        Database.insert(accList);  
    }
    
    /**
      * @description       Test method to validate de-duplication of records with exact, phonetic and fuzzy match
                           and logging of duplicates in a table
      * @param             NA
      * @return            Void
      * @throws            NA
      */
    private static testMethod void testDeDuplicate(){
        createTestData();
        Account acc = createAccount(ACCOUNT_CLOAK,ACCOUNT_PHONE);
        Database.insert(acc);
        MAP<Id,LIST<SObject>> dupeMap = new MAP<Id,LIST<SObject>>();
        Test.startTest();
            dupeMap = UTIL_DeDuper.findDuplicates(new List<sObject>{acc}); 
        Test.stopTest();
        System.assertEquals(false,dupeMap.isEmpty());        
    }
    
    /**
      * @description       Test method to validate de-duplication of records with fuzzy match
                           and logging of duplicates in a table
      * @param             NA
      * @return            Void
      * @throws            NA
      */
    private static testMethod void testDeDuplicateFuzzy(){
        createTestData();
        Account acc = createAccount(ACCOUNT_CLOAK,ACCOUNT_PHONE);
        Database.insert(acc);
        RuleCriteria__c criteria = [SELECT Field__c,IsFuzzy__c,IsPhonetic__c 
                                    FROM RuleCriteria__c WHERE Field__c =: NAME_FIELD];
        criteria.IsPhonetic__c = false;
        Database.update(criteria);
        MAP<Id,LIST<SObject>> dupeMap = new MAP<Id,LIST<SObject>>();
        Test.startTest();
            dupeMap = UTIL_DeDuper.findDuplicates(new List<sObject>{acc}); 
        Test.stopTest();
        System.assertEquals(false,dupeMap.isEmpty());        
    }
    
    /**
      * @description       Test method to validate de-duplication of records with exact, phonetic and fuzzy match
                           with multiple rules on an object and updating of duplicate logs
      * @param             NA
      * @return            Void
      * @throws            NA
      */
    private static testMethod void testDeDuplicatewithLog(){
        createTestData();
        List<Account> accList = new List<Account>();          
        Account acc = createAccount(ACCOUNT_CLAK,ACCOUNT_PHONE);
        Account acc1 = createAccount(ACCOUNT_CLOAK,ACCOUNT_PHONE);
        accList.add(acc1);    
        accList.add(acc); 
        Database.insert(accList); 
        RuleCriteria__c criteria = [SELECT Field__c,IsFuzzy__c,IsPhonetic__c 
                                    FROM RuleCriteria__c WHERE Field__c =: NAME_FIELD];
        criteria.IsFuzzy__c = false;
        Database.update(criteria);
        MAP<Id,LIST<SObject>> dupeMap = new MAP<Id,LIST<SObject>>();
        Test.startTest();
            dupeMap = UTIL_DeDuper.findDuplicates(new List<sObject>{acc}); 
            Rule__c rule = createRule(RULE_NAME,ACCOUNT_OBJ,LOG_DUPLICATE,TRUE_VALUE);
            Database.insert(rule);
            RuleCriteria__c fuzzyCriteria = createRuleCriteria(rule.id,NAME_FIELD,FALSE_VALUE,TRUE_VALUE); 
            dupeMap = UTIL_DeDuper.findDuplicates(new List<sObject>{acc});              
        Test.stopTest();
        System.assertEquals(false,dupeMap.isEmpty());        
    }
    
    /**
      * @description       Test method to validate exception handling incase of null object
      * @param             NA
      * @return            Void
      * @throws            NA
      */
    private static testMethod void testDeDuplicateException(){
        createTestData();
        sObject obj;
        MAP<Id,LIST<SObject>> dupeMap = new MAP<Id,LIST<SObject>>();
        Test.startTest();
            dupeMap = UTIL_DeDuper.findDuplicates(new List<sObject>{obj}); 
        Test.stopTest();
        System.assertEquals(true,dupeMap.isEmpty());
    }
    
    /**
      * @description       Test method to validate de-duplication of records with exact, phonetic and fuzzy match
      * @param             NA
      * @return            Void
      * @throws            NA
      */
    private static testMethod void testPreventDuplicate(){
        Rule__c rule = createRule(RULE_NAME,ACCOUNT_OBJ,PREVENT,TRUE_VALUE);
        Database.insert(rule);
        RuleCriteria__c criteria = createRuleCriteria(rule.id,NAME_FIELD,true,false); 
        Database.insert(criteria);
        List<Account> accList = new List<Account>();               
        Account acc1 = createAccount(ACCOUNT_KLOAK,ACCOUNT_PHONE); 
        Account acc2 = createAccount(ACCOUNT_CAK,ACCOUNT_PHONE);   
        Account acc3 = createAccount(ACCOUNT_TEST,ACCOUNT_PHONE);
        accList.add(acc1);    
        accList.add(acc2);    
        accList.add(acc3);     
        Database.insert(accList);
        Account acc = createAccount(ACCOUNT_CLOAK,ACCOUNT_PHONE);
        Database.insert(acc);
        MAP<Id,LIST<SObject>> dupeMap = new MAP<Id,LIST<SObject>>();
        Test.startTest();
            dupeMap = UTIL_DeDuper.findDuplicates(new List<sObject>{acc}); 
        Test.stopTest();
        System.assertEquals(false,dupeMap.isEmpty());        
    }
    
    /**
      * @description       Test method to validate conversion of string value to phonetic code 
                           using metaphone algorithm
      * @param             NA
      * @return            Void
      * @throws            NA
      */
    private static testMethod void testPhonetic(){
        Test.startTest();
        for(String val : stringList){
            UTIL_PhoneticSearch.convertToCode(val);
        }
        Test.stopTest();
        System.assertEquals(CONVERTED_CODE,UTIL_PhoneticSearch.convertToCode(SMITH));        
    }
}