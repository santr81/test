/**
  * @author        Nandan Narasappa
  * @date          06/11/2013
  * @description   Controller Extension for Creating and Editing Rule & Rule Criterias
  */    
public with sharing class VFC_RuleCreateEditController{
    
    // Start of Class Variables
    public string listIndex {get;set;}
    public boolean renderCriterias {get;set;}
    public String objectName {get;set;}
    public String fieldName {get;set;}
    public Rule__c rule {get;set;}  
    public List<SelectOption> fieldList {get;set;}
    public list<SelectOption> objectOptions {get;set;}
    public List<FieldWrapper> fieldWrapperList {get;set;}   
    public List<Integer> listCount {get;set;}
    public set<Id> criteriaIds ;
    private Set<String> stdObjects = new Set<String>{UTIL_DuplicateConstants.ACCOUNT_OBJ,
                                                    UTIL_DuplicateConstants.CONTACT_OBJ,
                                                    UTIL_DuplicateConstants.CONTRACT_OBJ,
                                                    UTIL_DuplicateConstants.OPPORTUNITY_OBJ,
                                                    UTIL_DuplicateConstants.CAMPAIGN_OBJ,
                                                    UTIL_DuplicateConstants.CASE_OBJ,
                                                    UTIL_DuplicateConstants.SOLUTION_OBJ,
                                                    UTIL_DuplicateConstants.CAMPAIGNMEMBER_OBJ,
                                                    UTIL_DuplicateConstants.TASK_OBJ,
                                                    UTIL_DuplicateConstants.EVENT_OBJ,
                                                    UTIL_DuplicateConstants.LEAD_OBJ};
    // End of Class Variables
    
    
    /**
      * @description       Constructor to initialize the Class variables and invoke methods for the
                           initial setup
      * @param             controller Standard controller variable for VFP_RuleCreateEditController which
                           contains rule details
      * @return            NA
      * @throws            NA
      */ 
    public VFC_RuleCreateEditController(ApexPages.StandardController controller){   
        fieldList = new List<SelectOption>();
        objectOptions = new list<SelectOption>();
        fieldWrapperList = new List<FieldWrapper>();
        listCount = new List<Integer>();
        criteriaIds = new set<Id>();
             
        Id ruleId = ApexPages.CurrentPage().getParameters().get(UTIL_DuplicateConstants.ID);        
        if(ruleId != null){
            rule = [SELECT Name,IsActive__c,Action__c,Object__c, 
                    (SELECT Field__c,IsFuzzy__c,IsPhonetic__c FROM RuleCriterias__r) 
                    FROM Rule__c WHERE Id =: ruleId]; 
        }
        else{
            rule = (Rule__c)controller.getRecord();  
        }                
        objectName = rule.Object__c;
                
        renderCriterias = false;               
        fetchObjectOptions();
        fetchFields();  
              
        if(rule.id != null){
            renderCriterias = true;
            for(RuleCriteria__c criteria : rule.RuleCriterias__r){
                FieldWrapper fldWrap = new FieldWrapper();
                fldWrap.criteriaId = criteria.id;
                fldWrap.selectedField = criteria.Field__c;
                fldWrap.isFuzzy = criteria.isFuzzy__c;
                fldWrap.isPhonetic = criteria.isPhonetic__c;
                criteriaIds.add(criteria.id);
                fieldWrapperList.add(fldWrap);
            }
            for(Integer i=0;i< fieldWrapperList.size();i++){
                listCount.add(i);    
            }
        }
        else{            
            cloneFieldWrapper();    
        }
        renderColumns();
    }    
    
    /**
      * @description       This method clears the old Field List and invoke fetchFields to add fields to Wrapper List
      * @param             NA
      * @return            Void
      * @throws            NA
      */         
    public void fetchFieldWrapper(){
        fieldWrapperList.clear();
        fetchFields();
        cloneFieldWrapper();
    }        
    
    /**
      * @description       Dummy method for the issue of retaining values in cloneFieldWrapper for the display
                           in page
      * @param             NA
      * @return            Void
      * @throws            NA
      */
    public void testSave(){
    }
    
    /**
      * @description       This method is used to add new row of Fields i.e,  rule criteria for an object in the List
                           to display in the page
      * @param             NA
      * @return            Pagereference
      * @throws            NA
      */
    public Pagereference cloneFieldWrapper(){
        FieldWrapper fldWrap = new FieldWrapper();
        fieldWrapperList.add(fldWrap);
        listCount.clear();
        for(Integer i=0;i< fieldWrapperList.size();i++){
            listCount.add(i);    
        }
        renderColumns();
        return null;
    }
    
    /**
      * @description       This method is used to remove row of Fields i.e,  rule criteria for an object from the 
                           List to display in the page
      * @param             NA
      * @return            Pagereference
      * @throws            NA
      */
    public Pagereference removeFieldWrapper(){
        fieldWrapperList.remove(Integer.valueOf(listIndex.trim()));
        listCount.clear();
        for(Integer i=0;i< fieldWrapperList.size();i++){
            listCount.add(i);    
        } 
        return null;      
    }
    
    /**
      * @description       This method is used to get the list of all objects in the organization.
      * @param             NA
      * @return            void
      * @throws            NA
      */
    public void fetchObjectOptions() {
        
        Map<String, Schema.SObjectType> objectMap = Schema.getGlobalDescribe();
        List<Schema.SObjectType> objectList = objectMap.Values();
        for (Schema.SObjectType objectType: objectList){            
            string apiName = objectType.getDescribe().getName();
            if(apiName.endsWith(UTIL_DuplicateConstants.OBJ_POSTFIX) || stdObjects.contains(apiName)){
                objectOptions.add(new SelectOption(apiName,apiName));
            }
        } 
        objectOptions.sort();    
    }
    
    /**
      * @description       This method is used to get the list of all fields for the selected object
                           in the organization.
      * @param             NA
      * @return            void
      * @throws            NA
      */
    public void fetchFields(){
        fieldList.clear();
        try{       
            renderCriterias = true;
            if(objectName == Null){
                objectName = objectOptions[0].getvalue();
            }
            Map<String, Schema.SObjectField> objectFields = Schema.getGlobalDescribe().get(objectName).getDescribe().fields.getMap();
            for(Schema.SObjectField f : objectFields.values()){
                fieldList.add(new SelectOption(f.getDescribe().getName(),f.getDescribe().getLabel()));
            } 
        }
        catch(Exception exp){
            Apexpages.addMessage(new ApexPages.Message(ApexPages.Severity.Error,exp.getMessage()));
        }     
    }
    
    /**
      * @description       This method is used to render fields to be displayed for rule criteria when the
                           selected object is changed. 
      * @param             NA
      * @return            void
      * @throws            NA
      */
    public void renderColumns(){
        if(objectName != null){
            Schema.SObjectType t = Schema.getGlobalDescribe().get(objectName); 
            Schema.DescribeSObjectResult r = t.getDescribe();        
         
            for(FieldWrapper fldWrap : fieldWrapperList){
                if(fldWrap.selectedField == null){
                    fldWrap.selectedField = fieldList[0].getvalue();
                }
                Schema.DescribeFieldResult f = r.fields.getMap().get(fldWrap.selectedField).getDescribe();
                fldWrap.fieldType = String.valueOf(f.getType());                
            }
        }
    }
    
    /**
      * @description       This method is used to save the rule & rule criterias for de-duplication on 
                           an object. 
      * @param             NA
      * @return            void
      * @throws            NA
      */
    public void saveRule(){
        list<RuleCriteria__c> criteriaList = new list<RuleCriteria__c>();
        Savepoint sPoint = Database.setSavepoint();
        Database.upsertResult result = Database.upsert(rule,false);
        if(result.isSuccess()){
            for(FieldWrapper fldWrap : fieldWrapperList){
                if(fldWrap.selectedField != null && !fldWrap.selectedField.equalsIgnoreCase(UTIL_DuplicateConstants.BLANK_SPACE) ){
                    RuleCriteria__c criteria = new RuleCriteria__c();
                    if(fldWrap.criteriaId != null){
                        if(criteriaIds.contains(fldWrap.criteriaId)){
                            criteriaIds.remove(fldWrap.criteriaId);    
                        }
                        criteria.id = fldWrap.criteriaId;    
                    }else{
                        criteria.Rule__c = rule.Id;
                    }                    
                    criteria.Field__c = fldWrap.selectedField;
                    if(fldWrap.fieldType.equalsIgnoreCase(UTIL_DuplicateConstants.STRING_TYPE) ||
                       fldWrap.fieldType.equalsIgnoreCase(UTIL_DuplicateConstants.PICKLIST_TYPE)){
                        criteria.IsPhonetic__c = fldWrap.isPhonetic; 
                        criteria.IsFuzzy__c = fldWrap.isFuzzy; 
                    }
                    criteriaList.add(criteria);
                }
            }
            if(!criteriaIds.isEmpty()){
                Database.delete(new List<Id>(criteriaIds));
            }
            if(!criteriaList.isEmpty()){
                try{
                    Database.upsert(criteriaList);
                }
                catch(Exception exp){
                    Database.rollBack(sPoint);
                    Apexpages.addMessage(new ApexPages.Message(ApexPages.Severity.Error,UTIL_DuplicateConstants.RULE_SAVE_ERROR));
                }
            }
        }
        else{
            Apexpages.addMessage(new ApexPages.Message(ApexPages.Severity.Error,result.errors[0].message));
        }    
    }
    
    /**
      * @description       This method is used to save the rule & rule criterias for de-duplication on 
                           an object invoking saveRule method. 
      * @param             NA
      * @return            PageReference
      * @throws            NA
      */
    public PageReference save(){
        saveRule();
        return new PageReference(UTIL_DuplicateConstants.FORWARD_SLASH+rule.id);
    }
    
    /**
      * @description       This method is used to save the rule & rule criterias for de-duplication on 
                           an object invoking saveRule method and redirects to creation of page for 
                           new rule creation.  
      * @param             NA
      * @return            PageReference
      * @throws            NA
      */
    public PageReference saveNew(){
        saveRule();
        PageReference page = new PageReference(UTIL_DuplicateConstants.SAVE_NEW_URL);
        page.setRedirect(true);
        return page;
    }
    
    /**
      * @author        Nandan Narasappa
      * @date          06/11/2013
      * @description   Wrapper class for rule criteraia fields for display in rule creation page
      */ 
    public class FieldWrapper{
        public Id criteriaId {get;set;}
        public string selectedField {get;set;}
        public string fieldType{get;set;}
        public boolean isPhonetic {get;set;}
        public boolean isFuzzy {get;set;}
    }
}