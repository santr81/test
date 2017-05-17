/**
  * @author        Nandan Narasappa
  * @date          17/11/2013
  * @description   Test Class for VFC_RuleCreateEditController for testing creation of rule & rule criteria for De-Duplication of sObject
  */   
@isTest
private class VFC_RuleCreateEditController_Test{
    
    // Start of Class Variables
    private static final string RULE_NAME = 'Unique Account';
    private static final string ACCOUNT_OBJ = 'Account';
    private static final string PREVENT_ACTION = 'Prevent';
    private static final string LOG_DUPLICATE = 'Log Duplicate';
    private static final string NAME_FIELD = 'Name';
    private static final string PHONE_FIELD = 'Phone';
    private static final String ID_FIELD = 'id';
    private static final string FORWARD_SLASH = '/';
    private static final string ONE = '1';
    private static final String BLANK_SPACE = '';
    private static final string NULL_ERROR = 'Attempt to de-reference a null object';
    private static final string UPSERT_ERROR = 'Required fields are missing: [Object__c]';
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
      * @description       Test method to validate creation of Rule & Rule Criteria for de-duplication of sobject
      * @param             NA
      * @return            Void
      * @throws            NA
      */    
    private static testMethod void testRuleCreationSave(){
        PageReference pageRef = Page.VFP_RuleCreateEdit;
        Test.setCurrentPage(pageRef);
        Rule__c rule = createRule(RULE_NAME,ACCOUNT_OBJ,PREVENT_ACTION,true);
        ApexPages.StandardController controller = new ApexPages.standardController(rule);
        VFC_RuleCreateEditController extn = new VFC_RuleCreateEditController(controller);
        extn.fieldWrapperList[0].selectedField = NAME_FIELD;
        extn.fieldWrapperList[0].isPhonetic = true;
        extn.fieldWrapperList[0].isFuzzy = true;
        
        Test.startTest();
            extn.save();
        Test.stopTest();
        
        System.assertNotEquals(rule.id,null);
    }
    
    /**
      * @description       Test method to validate save & new method in the process of creating Rule & Rule Criteria for de-duplication of sobject
      * @param             NA
      * @return            Void
      * @throws            NA
      */ 
    private static testMethod void testRuleCreationSaveNew(){
        PageReference pageRef = Page.VFP_RuleCreateEdit;
        Test.setCurrentPage(pageRef);
        Rule__c rule = createRule(RULE_NAME,ACCOUNT_OBJ,PREVENT_ACTION,true);      
        Database.insert(rule);
        ApexPages.StandardController controller = new ApexPages.standardController(rule);
        VFC_RuleCreateEditController extn = new VFC_RuleCreateEditController(controller);
        Test.startTest();
            rule.isActive__c = false;
            extn.saveNew();
        Test.stopTest();
        
        System.assertEquals(rule.isActive__c,false);
        System.assertEquals(pageRef.getParameters().get(ID_FIELD),null);        
    }
    
    /**
      * @description       Test method to validate cancel method in the process of creating Rule & Rule Criteria for de-duplication of sobject
      * @param             NA
      * @return            Void
      * @throws            NA
      */
    private static testMethod void testRuleCreationCancel(){
        PageReference pageRef = Page.VFP_RuleCreateEdit;
        Test.setCurrentPage(pageRef);
        Rule__c rule = createRule(RULE_NAME,ACCOUNT_OBJ,PREVENT_ACTION,true);        
        Database.insert(rule);
        pageRef.getParameters().put(ID_FIELD,rule.id);
        ApexPages.StandardController controller = new ApexPages.standardController(rule);
        VFC_RuleCreateEditController extn = new VFC_RuleCreateEditController(controller);
        Test.startTest();
            controller.cancel();
        Test.stopTest();
        System.assertEquals(ApexPages.currentPage(),pageRef );        
    }
    
    /**
      * @description       Test method to validate creation of Rule Criteria for de-duplication of sobject
      * @param             NA
      * @return            Void
      * @throws            NA
      */
    private static testMethod void testRuleCreationCriteria(){
        PageReference pageRef = Page.VFP_RuleCreateEdit;
        Test.setCurrentPage(pageRef);
        Rule__c rule = createRule(RULE_NAME,ACCOUNT_OBJ,PREVENT_ACTION,true);         
        Database.insert(rule);
        RuleCriteria__c criteria = createRuleCriteria(rule.id,NAME_FIELD,true,true); 
        RuleCriteria__c phoneCriteria = createRuleCriteria(rule.id,PHONE_FIELD,false,false); 
        List<RuleCriteria__c> criterias = new List<RuleCriteria__c>();
        criterias.add(criteria);
        criterias.add(phoneCriteria);
        Database.insert(criterias);            
        pageRef.getParameters().put(ID_FIELD,rule.id);
        ApexPages.StandardController controller = new ApexPages.standardController(rule);
        pageRef = controller.view();
        VFC_RuleCreateEditController extn = new VFC_RuleCreateEditController(controller);   
        Test.startTest(); 
            controller.edit();
            extn.fieldWrapperList[0].isFuzzy = false;
            extn.save();
            extn.fetchFieldWrapper();          
            extn.testSave();
            extn.cloneFieldWrapper();
            extn.listIndex = ONE;            
            extn.removeFieldWrapper();
            extn.save();                       
        Test.stopTest();
        System.assert((FORWARD_SLASH+rule.id).startswith(pageRef.getURL()));        
    }
    
    /**
      * @description       Test method to validate deletion of Rule Criteria for de-duplication of sobject
      * @param             NA
      * @return            Void
      * @throws            NA
      */
    private static testMethod void testRuleCreationDeleteCriteria(){
        PageReference pageRef = Page.VFP_RuleCreateEdit;
        Test.setCurrentPage(pageRef);
        Rule__c rule = createRule(RULE_NAME,ACCOUNT_OBJ,PREVENT_ACTION,true);        
        Database.insert(rule);
        RuleCriteria__c criteria = createRuleCriteria(rule.id,NAME_FIELD,true,true); 
        RuleCriteria__c phoneCriteria = createRuleCriteria(rule.id,PHONE_FIELD,false,false); 
        List<RuleCriteria__c> criterias = new List<RuleCriteria__c>();
        criterias.add(criteria);
        criterias.add(phoneCriteria);
        Database.insert(criterias);            
        pageRef.getParameters().put(ID_FIELD,rule.id);
        ApexPages.StandardController controller = new ApexPages.standardController(rule);
        pageRef = controller.view();
        VFC_RuleCreateEditController extn = new VFC_RuleCreateEditController(controller);   
        Test.startTest(); 
            controller.edit();
            extn.fieldWrapperList[0].isFuzzy = false;
            extn.listIndex = ONE;            
            extn.removeFieldWrapper(); 
            extn.save();                       
        Test.stopTest();
        System.assert((FORWARD_SLASH+rule.id).startswith(pageRef.getURL()));        
    }
    
    /**
      * @description       Test method to validate exception handling incase of invalid object while creating Rule for de-duplication of sobject
      * @param             NA
      * @return            Void
      * @throws            NA
      */
    private static testMethod void testRuleCreationException(){
        PageReference pageRef = Page.VFP_RuleCreateEdit;
        Test.setCurrentPage(pageRef);
        Rule__c rule = new Rule__c();
        ApexPages.StandardController controller = new ApexPages.standardController(rule);
        VFC_RuleCreateEditController extn = new VFC_RuleCreateEditController(controller);
        Test.startTest(); 
            extn.objectName = BLANK_SPACE;
            extn.fetchFields();
        Test.stopTest();
        System.assertEquals(String.valueOf(ApexPages.getMessages()[0].getDetail()),NULL_ERROR);
    }
    
    /**
      * @description       Test method to validate exception handling incase of upsert with blank object while creating Rule for de-duplication of sobject
      * @param             NA
      * @return            Void
      * @throws            NA
      */
    private static testMethod void testRuleCreationUpsertException(){
        PageReference pageRef = Page.VFP_RuleCreateEdit;
        Test.setCurrentPage(pageRef);
        Rule__c rule = createRule(RULE_NAME,ACCOUNT_OBJ,PREVENT_ACTION,true);        
        Database.insert(rule);
        ApexPages.StandardController controller = new ApexPages.standardController(rule);
        VFC_RuleCreateEditController extn = new VFC_RuleCreateEditController(controller);
        Test.startTest(); 
            rule.Object__c = BLANK_SPACE;
            extn.save();
        Test.stopTest();
        System.assertEquals(String.valueOf(ApexPages.getMessages()[0].getDetail()),UPSERT_ERROR);
    }
    
}