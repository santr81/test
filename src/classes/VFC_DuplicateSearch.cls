/**
  * @author       : Urmi Chatterjee
  * @date         : 06/11/2013
  * @description  : Apex Class for the following :
                   1. Searching for PotentialDuplicates__c records for a particular Object or for 
                      a specific record in the Object.
                   2. Searching for Duplicate records for a particular object, based on the 
                      field-value comparison criterias specified.
                   3. Calling Merge logic for merging selected records obtained from point 2 above.
  */


public with sharing class VFC_DuplicateSearch {

    // Start of Class Variables 
    
    public String selectedTab {get;set;}
    public String recSelected {get;set;} 
    public String errorMsg {get;set;}
    public Integer listIndex {get;set;} 
    public String objectSelected {get;set;}  
    private String idVal;
    
    public Integer startCount {get;set;}
    public Integer maxRecs {get;set;}
    private Integer startRecIndex;
    private Integer endRecIndex; 

    private Boolean containsName;
    public Boolean display {get;set;}
    
    public List<SelectOption> recOptions {get;set;}
    public List<SelectOption> operators {get;set;}
    public List<SelectOption> logicOp {get;set;}
    
    public List<Integer> listCount {get;set;}
    public List<String> recordVals {get;set;}    
    public List<FieldWrapper> fieldWrapList {get;set;}
    public List<PotentialDuplicates__c> potDupes {get;set;}
    
    private List<sObject> dataList;
    public List<sObject> duplicateRecords {get;set;}
    public List<sObject> displayList {get;set;}
    
    public VFC_RuleCreateEditController cont {get;set;}
    public FieldWrapper fieldWrap {get;set;}
    
    public Map<Id, PotentialDuplicates__c> potentialDupes {get;set;}
    public Map<Id, List<String>> duplicateRecordMap {get;set;}
    public Map<Id, Boolean> recordIds {get;set;}
    
    // End of Class Variables
    
    
    /**
      * @description       Constructor to initialize some of the Class variables and call methods 
                           which need to run when the page loads. 
      * @param             NA
      * @return            void
      * @throws            NA
      */ 
    public VFC_DuplicateSearch(){
        fieldWrap = new FieldWrapper();
        errorMsg = UTIL_DuplicateConstants.BLANK_SPACE;
        display = false;
        containsName = false;
        startCount = 0;
        selectedTab = UTIL_DuplicateConstants.DUPLICATE_SEARCH_TAB;
        
        recOptions = new List<SelectOption>();
        operators = new List<SelectOption>();
        logicOp = new List<SelectOption>();
        
        listCount = new List<Integer>();
        recordVals = new List<String>();
        duplicateRecords = new List<sObject>();
        displayList = new List<sObject>(); 
        dataList = new List<sObject>();     
        fieldWrapList = new List<FieldWrapper>();
        potDupes = new List<PotentialDuplicates__c>();

        recordIds = new Map<id, Boolean>();        
        duplicateRecordMap = new Map<Id, List<String>>();
        potentialDupes = new Map<Id, PotentialDuplicates__c>();
        
        Rule__c ruleVal = new Rule__c();
        ApexPages.StandardController stdCont = new ApexPages.StandardController(ruleVal);
        cont = new VFC_RuleCreateEditController(stdCont);        
        
        fieldWrapList.add(fieldWrap);
        for(Integer i=0;i< fieldWrapList.size();i++){
            listCount.add(i);    
        }
        
        if(String.isNotBlank(cont.objectName)){
            objectSelected = cont.objectName;
            fetchRecords();
        }
        fetchOperator();
    }
    
    /**
      * @description       This method is called by VFP_DuplicateSearch page when the page loads or when
                           selected object is changes in Record Search tab. It initializes the field wrapper
                           containing the values for one field-value comparison and sets the counter to starting position.
      * @param             NA
      * @return            void
      * @throws            NA
      */
    public void init(){                
        duplicateRecords = new List<sObject>(); 
        fieldWrapList.clear();
        cont.fetchFields();
        cloneFieldWrapper();
        if(startCount > 0){
            startCount = 0; 
        }        
    }
    
    
    /**
      * @description       This method is called by VFP_DuplicateSearch page when the Search button on the 
                           Duplicate Search tab is clicked. It searches for PotentialDuplicates__c records
                           based on the Object selected or the specific record in the Object.
      * @param             NA
      * @return            void
      * @throws            QueryException
      */
    public void search(){
        recordIds = new Map<Id, Boolean>();
        potDupes.clear();
        duplicateRecords.clear();
        selectedTab = UTIL_DuplicateConstants.DUPLICATE_SEARCH_TAB;
        errorMsg = UTIL_DuplicateConstants.BLANK_SPACE;
        display = false;    
        maxRecs = Integer.valueOf(PaginationRecords__c.getInstance(UTIL_DuplicateConstants.CUSTOM_SETTING_RECORD_LIMIT).NumberofRecords__c);
        startRecIndex = 0;
        endRecIndex = maxRecs - 1;
            
        potentialDupes.clear();        
        try{
            if(String.isBlank(recSelected) || recSelected.equalsIgnoreCase(UTIL_DuplicateConstants.NONE) || 
               recSelected.equalsIgnoreCase(UTIL_DuplicateConstants.NEXT) || recSelected.equalsIgnoreCase(UTIL_DuplicateConstants.PREVIOUS)){            
                duplicateRecords = [Select RecordInScope__c, (SELECT RulesFired__c, DuplicateLog__c, CreatedById, Name,
                                    DuplicateLog__r.RecordInScope__c, DuplicateRecord__c FROM PotentialDuplicate__r LIMIT 100) From DuplicateLog__c LIMIT 450];
                List<sObject> objectId = new List<sObject>();
                objectId = Database.query('Select Id From '+cont.objectName+' Limit 1');
                for(sObject obj: objectId){
                    idVal = String.valueOf(obj.Id).left(3);
                }            
            }
            else {
                duplicateRecords = Database.query('SELECT RecordInScope__c,(SELECT RulesFired__c, DuplicateLog__c, CreatedById, Name,'+
                                   'DuplicateLog__r.RecordInScope__c, DuplicateRecord__c FROM PotentialDuplicate__r  LIMIT 50000)'+ 
                                   'FROM DuplicateLog__c WHERE RecordInScope__c =\''+recSelected+'\'');
               
            } 
            List<DuplicateLog__c> dupeList = duplicateRecords ;
            for(DuplicateLog__c dupeRecs : dupeList){
                if(String.isBlank(idVal)){
                    for(PotentialDuplicates__c potDp : dupeRecs.PotentialDuplicate__r){
                        recordIds.put(potDp.Id, false);
                        potDupes.add(potDp);
                    } 
                }
                else if((String.valueOf(dupeRecs.RecordInScope__c).left(3)).equalsIgnoreCase(idVal)){                    
                    for(PotentialDuplicates__c potDp : dupeRecs.PotentialDuplicate__r){
                        recordIds.put(potDp.Id, false);
                        potDupes.add(potDp);
                    }
                }                
            }
            displayList = subsetList(potDupes , startRecIndex, maxRecs);            
            displayResult(displayList);       
        }
        catch(QueryException excp){
            errorMsg = String.valueOf(excp.getMessage());
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,errorMsg));  
        }
    }
    
    
    /**
      * @description       This method is called by VFP_DuplicateSearch page when the Search button on the 
                           Record Search tab is clicked. It searches for duplicate records within the object
                           based on the field-value comparison criterias specified by the user.
      * @param             NA
      * @return            void
      * @throws            QueryException
      */
    public void searchDupe(){
        recordIds = new Map<Id, Boolean>();
        selectedTab = UTIL_DuplicateConstants.RECORD_SEARCH_TAB;
        display = false;
        duplicateRecordMap.clear();
        duplicateRecords.clear();
        potDupes.clear();
        String fields = UTIL_DuplicateConstants.BLANK_SPACE;
        String compareWith = UTIL_DuplicateConstants.BLANK_SPACE;
        errorMsg = UTIL_DuplicateConstants.BLANK_SPACE;
        maxRecs = Integer.valueOf(PaginationRecords__c.getInstance(UTIL_DuplicateConstants.CUSTOM_SETTING_RECORD_LIMIT).NumberofRecords__c);
        startRecIndex = 0;
        endRecIndex = maxRecs - 1;
        
        // Optional Code - User can specify fields required in the query explicitly (restricting to common standard fields across objects)
        for(SelectOption fieldVal : cont.fieldList){
            fields += UTIL_DuplicateConstants.WIDE_BLANK_SPACE+ fieldVal.getValue() + UTIL_DuplicateConstants.COMMA;
        }
        if(String.isNotBlank(fields)){
            fields = fields.left(fields.length()-1);
        }
        // End of optional code
        
        compareWith = whereClause(fieldWrapList);
        
        if(String.isNotBlank(errorMsg)){ 
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,errorMsg));      
        }
        else{
            try{
                duplicateRecords = Database.query('Select '+fields+' From '+cont.objectName+' Where '+compareWith+' LIMIT 50000');
                for(SObject dupeRecs : duplicateRecords){
                    recordIds.put(dupeRecs.Id, false);
                }
                displayList = subsetList(duplicateRecords, startRecIndex, maxRecs); 
                displayResult(displayList);                
            }
            catch(QueryException excp){
                errorMsg = String.valueOf(excp.getMessage());
                ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,errorMsg));  
            }
        }
    }
    
    /**
      * @description       This method is called by the searchDupe method. It translates the field-value comparison criterias
                           specified by the User into proper format so that the Where Clause for the dynamic SOQL Query
                           can be built.
      * @param             fieldWrapList A List of FieldWrapper type Wrapper Class
      * @return            String
      * @throws            NA
      */
    private String whereClause(List<FieldWrapper> fieldWrapList){
        String compVal = UTIL_DuplicateConstants.BLANK_SPACE;
        String compareWith = UTIL_DuplicateConstants.BLANK_SPACE;
        for(FieldWrapper fldWp : fieldWrapList){                                  
           if(String.isBlank(fldWp.opSelected)){
                errorMsg = UTIL_DuplicateConstants.OP_BLANK_ERROR; 
            } 
            else{
                if(!(fldWp.opSelected.equalsIgnoreCase(UTIL_DuplicateConstants.IN_OP) || fldWp.opSelected.equalsIgnoreCase(UTIL_DuplicateConstants.NOT_IN_OP)) &&
                   (String.isBlank(fldWp.compVal) || fldWp.compVal.contains(UTIL_DuplicateConstants.COMMA) || fldWp.compVal.contains(UTIL_DuplicateConstants.SEMI_COLON))){
                        errorMsg = UTIL_DuplicateConstants.COMPVAL_BLANK_ERROR;  
                }
                else if(((fldWp.opSelected.equalsIgnoreCase(UTIL_DuplicateConstants.EQUALS_OP)) || (fldWp.opSelected.equalsIgnoreCase(UTIL_DuplicateConstants.NOT_EQUALS_OP))) && !(fldWp.compVal.contains(UTIL_DuplicateConstants.COMMA) || fldWp.compVal.contains(';'))){
                    compVal= UTIL_DuplicateConstants.APOSTROPHE+fldWp.compVal.trim()+UTIL_DuplicateConstants.APOSTROPHE;
                }
                else if((fldWp.opSelected.equalsIgnoreCase(UTIL_DuplicateConstants.LIKE_OP)) && !(fldWp.compVal.contains(UTIL_DuplicateConstants.COMMA) || fldWp.compVal.contains(';'))){
                    compVal= UTIL_DuplicateConstants.APOSTROPHE+UTIL_DuplicateConstants.PERCENT+fldWp.compVal.trim()+UTIL_DuplicateConstants.PERCENT+UTIL_DuplicateConstants.APOSTROPHE;
                }
                else if((fldWp.opSelected.equalsIgnoreCase(UTIL_DuplicateConstants.IN_OP)) || (fldWp.opSelected.equalsIgnoreCase(UTIL_DuplicateConstants.NOT_IN_OP))){
                    if(fldWp.compVal.contains(UTIL_DuplicateConstants.COMMA)){
                        List<String> compData = fldWp.compVal.split(UTIL_DuplicateConstants.COMMA);
                        compVal = UTIL_DuplicateConstants.OPEN_BRACKET;
                        for(String val : compData){
                            compVal+= UTIL_DuplicateConstants.APOSTROPHE+val.trim()+UTIL_DuplicateConstants.APOSTROPHE+UTIL_DuplicateConstants.COMMA+UTIL_DuplicateConstants.WIDE_BLANK_SPACE;
                        }
                        compVal= compVal.trim().left(compVal.trim().length()-1)+UTIL_DuplicateConstants.CLOSE_BRACKET;
                    }
                    else if(fldWp.compVal.trim().split(UTIL_DuplicateConstants.WIDE_BLANK_SPACE)[0].trim().equalsIgnoreCase(UTIL_DuplicateConstants.SELECT_STRING) && 
                            fldWp.compVal.trim().split(UTIL_DuplicateConstants.WIDE_BLANK_SPACE)[2].trim().equalsIgnoreCase(UTIL_DuplicateConstants.FROM_STRING)){
                        compVal = UTIL_DuplicateConstants.OPEN_BRACKET+fldWp.compVal.trim()+UTIL_DuplicateConstants.CLOSE_BRACKET;
                    } 
                    else{
                    errorMsg = UTIL_DuplicateConstants.IN_ERROR_MSG;
                        }            
                }                                               
            }                       
            compareWith += fldWp.fieldSelected+UTIL_DuplicateConstants.WIDE_BLANK_SPACE+fldWp.opSelected+UTIL_DuplicateConstants.WIDE_BLANK_SPACE+compVal+UTIL_DuplicateConstants.WIDE_BLANK_SPACE+fldWp.logicOpSelected+UTIL_DuplicateConstants.WIDE_BLANK_SPACE;
        }
        return compareWith;
    }
    
    /**
      * @description       This method is called by the search and searchDupe methods. It filters values to be displayed
                           on the search table at a time for both Duplicate Search and Record Search tabs.
      * @param             dupeRecsList A List of SObject Records
      * @return            void
      * @throws            NA
      */
    private void displayResult(List<SObject> dupeRecsList){
        if(selectedTab.equalsIgnoreCase(UTIL_DuplicateConstants.DUPLICATE_SEARCH_TAB)){
            potentialDupes = new Map<Id, PotentialDuplicates__c>();
            List<PotentialDuplicates__c> potDupeList = dupeRecsList;
            for(PotentialDuplicates__c potDupe: potDupeList){
                potentialDupes.put(potDupe.Id, potDupe);
            }                                    
        }
        else if(selectedTab.equalsIgnoreCase(UTIL_DuplicateConstants.RECORD_SEARCH_TAB)){
            duplicateRecordMap = new Map<Id, List<String>>();
            for(SObject dupeRecs: dupeRecsList){ 
                recordVals = new List<String>();
                recordVals.add(String.valueOf(dupeRecs.get(UTIL_DuplicateConstants.ID_FIELD)));
                recordVals.add(String.valueOf(dupeRecs.get(UTIL_DuplicateConstants.NAME_FIELD)));
                recordVals.add(String.valueOf(dupeRecs.get(UTIL_DuplicateConstants.CREATEDBYID_FIELD)));
                duplicateRecordMap.put(dupeRecs.Id, recordVals);
            }
        }    
        if(!potentialDupes.isEmpty() || !duplicateRecordMap.isEmpty()){
            display = true;
        } 
    }
    
    
    /**
      * @description       This method is called by the VFP_DuplicateSearch page when it loads. It determines the operators
                           for the field-value comparison criterias.
      * @param             NA
      * @return            void
      * @throws            NA
      */
    public void fetchOperator() {        
        operators.clear();
        operators.add(new SelectOption(UTIL_DuplicateConstants.BLANK_SPACE, UTIL_DuplicateConstants.NONE));
        operators.add(new SelectOption(UTIL_DuplicateConstants.EQUALS_OP, UTIL_DuplicateConstants.EQUALS_TEXT));      
        operators.add(new SelectOption(UTIL_DuplicateConstants.NOT_EQUALS_OP, UTIL_DuplicateConstants.NOT_EQUALS_TEXT)); 
        operators.add(new SelectOption(UTIL_DuplicateConstants.LIKE_OP, UTIL_DuplicateConstants.LIKE_OP));  
        operators.add(new SelectOption(UTIL_DuplicateConstants.IN_OP, UTIL_DuplicateConstants.IN_OP)); 
        operators.add(new SelectOption(UTIL_DuplicateConstants.NOT_IN_OP, UTIL_DuplicateConstants.NOT_IN_OP)); 
    }
    
    /**
      * @description       This method is called by the VFP_DuplicateSearch page when the '+' button is clicked on the  
                           Record Search Tab. It determines the Logical operators between different 
                           field-value comparison criterias, when running the query to search for Duplicate records.
      * @param             NA
      * @return            void
      * @throws            NA
      */
    public void fetchLogicalOperator(){
        logicOp.clear();
        logicOp.add(new SelectOption(UTIL_DuplicateConstants.AND_LOGIC_OP, UTIL_DuplicateConstants.AND_LOGIC_OP)); 
        logicOp.add(new SelectOption(UTIL_DuplicateConstants.OR_LOGIC_OP, UTIL_DuplicateConstants.OR_LOGIC_OP));
    }
    
    /**
      * @description       This method is called by the VFP_DuplicateSearch page when the page loads or the selected Object
                           on the Duplicate Search tab is changed or Previous or Next is selected from the selectlist of records. 
                           It fetches a fixed number of records in the selected Object.
      * @param             NA
      * @return            void
      * @throws            Exception
      */
    public void fetchRecords(){        
        duplicateRecords = new List<sObject>(); 
        containsName = false;
        String queryString = UTIL_DuplicateConstants.BLANK_SPACE;
        display = false;
        dataList = new List<sObject>(); 
        maxRecs = Integer.valueOf(PaginationRecords__c.getInstance(UTIL_DuplicateConstants.CUSTOM_SETTING_RECORD_LIMIT).NumberofRecords__c);
        if(recSelected==null){
            startRecIndex = 0;
            endRecIndex = maxRecs;
        }
        else if(recSelected.equalsIgnoreCase(UTIL_DuplicateConstants.PREVIOUS)){
            endRecIndex = startRecIndex;
            startRecIndex = startRecIndex - maxRecs;
        }
        else if(recSelected.equalsIgnoreCase(UTIL_DuplicateConstants.NEXT)){
            startRecIndex = endRecIndex;
            endRecIndex = endRecIndex + maxRecs; 
        }
        cont.objectName = objectSelected;        
        try{
            cont.fetchFields();
            for(SelectOption field : cont.fieldList){
                if(String.valueOf(field.getValue()).equalsIgnoreCase(UTIL_DuplicateConstants.NAME_FIELD)){
                    queryString = 'SELECT Id, Name FROM '+objectSelected+' LIMIT '+maxRecs+' OFFSET '+startRecIndex;
                    containsName = true; 
                    break;
                }
                else{
                    queryString = 'SELECT Id FROM '+objectSelected+' LIMIT '+maxRecs+' OFFSET '+startRecIndex; 
                }
            }
            dataList = Database.query(queryString);     
            displayRecordList(); 
        }
        catch(Exception excp){
            errorMsg = String.valueOf(excp.getMessage());
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,errorMsg));  
        }       
    }
    
    /**
      * @description       This method is called by the fetchRecords method. This method displays the queried records
                           in a drop down box along with None, Previous and next selectlist options.
      * @param             NA
      * @return            void
      * @throws            NA
      */
    private void displayRecordList(){
        recSelected = UTIL_DuplicateConstants.BLANK_SPACE;
        recOptions = new List<SelectOption>();
        recOptions.add(new SelectOption(UTIL_DuplicateConstants.BLANK_SPACE, UTIL_DuplicateConstants.NONE));
        
        if(startRecIndex >= maxRecs){
            recOptions.add(new SelectOption(UTIL_DuplicateConstants.PREVIOUS, UTIL_DuplicateConstants.PREVIOUS));
        }
        
        if(!(dataList.size() < maxRecs)){
            recOptions.add(new SelectOption(UTIL_DuplicateConstants.NEXT, UTIL_DuplicateConstants.NEXT));
        }
        for (sObject objVal : dataList){                
            if(containsName)
                recOptions.add(new SelectOption(String.valueOf(objVal.Id), String.valueOf(objVal.get(UTIL_DuplicateConstants.NAME_FIELD))));
            else
                recOptions.add(new SelectOption(String.valueOf(objVal.Id), String.valueOf(objVal.get(UTIL_DuplicateConstants.ID_FIELD))));
        }
    }
    
    /**
      * @description       This method is called by the VFP_DuplicateSearch page when the 'Merge' button on the 
                           Record Search tab is clicked. It appends the Object Name and the record Ids to the URL
                           and calls the VFP_Merge page.
      * @param             NA
      * @return            PageReference
      * @throws            Exception
      */
    public PageReference mergeRecs(){
        String Ids=UTIL_DuplicateConstants.BLANK_SPACE;
        Map <Id, String> dupeObjRec = new Map <Id, String>();
        Integer i = 1;
        PageReference pgMerge = null;
        try{
            if(!potDupes.isEmpty()){
                if(String.isNotBlank(recSelected)){
                    Ids += UTIL_DuplicateConstants.URL_PARAM+i+UTIL_DuplicateConstants.EQUALS_OP+recSelected;
                    i++;
                }
                for(PotentialDuplicates__c potDp : potDupes){ 
                    dupeObjRec.put(potDp.Id, potDp.DuplicateRecord__c);
                }
            }
            for(Id mergeId : recordIds.keyset()){
                if(recordIds.get(mergeId)){
                    if(!potDupes.isEmpty()){
                        Ids += UTIL_DuplicateConstants.URL_PARAM+i+UTIL_DuplicateConstants.EQUALS_OP+dupeObjRec.get(mergeId);
                    }
                    else{
                        Ids += UTIL_DuplicateConstants.URL_PARAM+i+UTIL_DuplicateConstants.EQUALS_OP+mergeId;
                    }
                    i++;
                }
            }
            if(String.isNotBlank(Ids)){
                pgMerge = new PageReference(UTIL_DuplicateConstants.URL_STRING+cont.objectName+Ids);
                pgMerge.setRedirect(true);
            }
        }
        catch(Exception excp){
            errorMsg = String.valueOf(excp.getMessage());
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,errorMsg));
        }
        return pgMerge;
    }
    
    /**
      * @description       This method is called by the VFP_DuplicateSearch page when the '+' button is clicked on the  
                           Record Search Tab. It determines whether additional field-value comparison criterias can be added
                           based on the last criteria (i.e. if comparison value is entered or if the last criteria 
                           has an IN operator), also making the Logical Operator between criterias visible to the User.
                           If any of the conditions fail, Error Message is displayed to the User.
      * @param             NA
      * @return            void
      * @throws            Exception
      */
    public void testSave(){
        errorMsg = UTIL_DuplicateConstants.BLANK_SPACE;
        inValWrap();
        try{
            if(String.isBlank(fieldWrapList[startCount].opSelected)){
                errorMsg = UTIL_DuplicateConstants.OP_BLANK_ERROR;
            }
            else if((String.isBlank(fieldWrapList[startCount].compVal) || fieldWrapList[startCount].compVal.contains(UTIL_DuplicateConstants.COMMA) || 
                        fieldWrapList[startCount].compVal.contains(UTIL_DuplicateConstants.SEMI_COLON)) && !(fieldWrapList[startCount].opSelected.equalsIgnoreCase(UTIL_DuplicateConstants.IN_OP) || 
                        fieldWrapList[startCount].opSelected.equalsIgnoreCase(UTIL_DuplicateConstants.NOT_IN_OP))){
                errorMsg = UTIL_DuplicateConstants.COMPVAL_BLANK_ERROR;      
            }
            else if((fieldWrapList[startCount].opSelected.equalsIgnoreCase(UTIL_DuplicateConstants.IN_OP) || fieldWrapList[startCount].opSelected.equalsIgnoreCase(UTIL_DuplicateConstants.NOT_IN_OP)) ){
                if(String.isBlank(fieldWrapList[startCount].compVal) || ((!fieldWrapList[startCount].compVal.contains(UTIL_DuplicateConstants.COMMA)) && 
                   (!((fieldWrapList[startCount].compVal.trim().split(UTIL_DuplicateConstants.WIDE_BLANK_SPACE)[0].equalsIgnoreCase(UTIL_DuplicateConstants.SELECT_STRING)) &&
                   (fieldWrapList[startCount].compVal.trim().split(UTIL_DuplicateConstants.WIDE_BLANK_SPACE)[2].equalsIgnoreCase(UTIL_DuplicateConstants.FROM_STRING)))))){
                    errorMsg = UTIL_DuplicateConstants.IN_ERROR_MSG;
                }
                else{
                    errorMsg = UTIL_DuplicateConstants.IN_LAST_OP_ERROR;
                }
            } 
            else{
                if(!fieldWrapList[startCount].visible){
                    fetchLogicalOperator();            
                    fieldWrapList[startCount].visible = true;   
                    cloneFieldWrapper();             
                }               
                else if(listCount.size()-startCount>=2){
                    startCount = listCount.size()-1;  
                    testSave();
                }
            }
        }
        catch(Exception excp){
            errorMsg = String.valueOf(excp.getMessage());
        }
        if(String.isNotBlank(errorMsg)){ 
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,errorMsg));      
        }
    }
    
    /**
      * @description       This method determines which rows of field-value comparison have the operator as IN or NOT IN
                                           and displays the comparison value message accordingly.
      * @param             NA
      * @return            void
      * @throws            NA
      */
    private void inValWrap(){
        fieldWrapList[startCount].inVal = false;
        for(FieldWrapper wrap: fieldWrapList){
                if(String.isNotBlank(wrap.opSelected) && (wrap.opSelected.equalsIgnoreCase(UTIL_DuplicateConstants.IN_OP) || wrap.opSelected.equalsIgnoreCase(UTIL_DuplicateConstants.NOT_IN_OP))){
                        wrap.inVal=true;
                }
        }       
    }
    
    /**
      * @description       This method determines the number of field-value comparison criterias to be displayed
                           on the Record Search tab of VFP_DuplicateSearch page and if any new criteria rows are to be added.
      * @param             NA
      * @return            void
      * @throws            NA
      */
    private void cloneFieldWrapper(){
        FieldWrapper fldWrap = new FieldWrapper();
        fieldWrapList.add(fldWrap);
        listCount.clear();
        for(Integer i=0;i< fieldWrapList.size();i++){
            listCount.add(i);    
        } 
        startCount++;
    }
    
    /**
      * @description       This method is called when the '-' button on the Record Search tab of VFP_DuplicateSearch page
                           is clicked. It determines which field-value comparison criteria row is to be removed and
                           the remaining are displayed to the User. 
      * @param             NA
      * @return            void
      * @throws            NA
      */
    public void removeFieldWrapper(){           
        startCount = 0;
        errorMsg = UTIL_DuplicateConstants.BLANK_SPACE;
        fieldWrapList.remove(listIndex);
        listCount.clear();
        for(Integer i=0;i< fieldWrapList.size();i++){
            listCount.add(i);    
        }
        if((listIndex != 0) && (listCount.size()==listIndex)){
            fieldWrapList[listIndex-1].visible = false;
        }      
        inValWrap();
    }
    
    /**
      * @description       This method restricts the size of the SObject list to the value of the 
                           'listSize' variable passed to it.
      * @param             objList the List of SObject records from search() or searchDupe() method
      * @param             startIndex the Integer containing starting position for the list of records to be displayed
      * @param             listSize the Integer containing the number of records to be displayed
      * @return            List<SObject>
      * @throws            NA
      */
    private List<SObject> subsetList(List<SObject> objList, Integer startIndex, Integer listSize){
        List<SObject> returnList = new List<SObject>();
        if(objList!= null && objList.size() > 0 && startIndex >= 0 && startIndex <= objList.size()-1 && listSize > 0){
            for(Integer i = startIndex; i < objList.size() && i - startIndex < listSize; i++){
                returnList.add(objList.get(i));
            }
        }
        return returnList;
    }
    
    /**
      * @description       This method is called when the commandlink Next is clicked on VFP_DuplicateSearch for the purpose of pagination.
                           It displays the next maxRecs number of SObject records  
      * @param             NA
      * @return            void
      * @throws            NA
      */
    public void next(){
        if(potDupes.isEmpty() && (duplicateRecords.size()>maxRecs && (((duplicateRecords.size()-1) - endRecIndex) >0))){
            displayList.clear();            
            startRecIndex = endRecIndex +1;
            endRecIndex = endRecIndex + maxRecs;                        
            if (endRecIndex > duplicateRecords.size()){
                endRecIndex = duplicateRecords.size() - 1 ;
            }
            displayList = subsetList(duplicateRecords, startRecIndex,  maxRecs);             
        }
        else if(potDupes.size()>maxRecs && (((potDupes.size()-1) - endRecIndex) >0)){
            displayList.clear();            
            startRecIndex = endRecIndex +1;
            endRecIndex = endRecIndex + maxRecs;                        
            if (endRecIndex > potDupes.size()){
                endRecIndex = potDupes.size() - 1 ;
            }
            displayList = subsetList(potDupes, startRecIndex,  maxRecs);  
        }       
        displayResult(displayList); 
    }
    
    /**
      * @description       This method is called when the commandlink Previous is clicked on VFP_DuplicateSearch for the purpose of pagination.
                           It displays the previous maxRecs number of SObject records
      * @param             NA
      * @return            void
      * @throws            NA
      */
    public void previous(){
        if( startRecIndex > 0){
            displayList.clear();
            endRecIndex = startRecIndex - 1;
            startRecIndex = startRecIndex - maxRecs;
            displayList = subsetList(potDupes.isEmpty()?duplicateRecords:potDupes, startRecIndex, maxRecs);
            displayResult(displayList);  
        }
    }
    
    /**
      * @author        Urmi Chatterjee
      * @date          06/11/2013
      * @description   This is a wrapper class to store the field-value comparison criteria entered in 
                       Record Search Tab of VFP_DuplicateSearch page.
      */
    public class FieldWrapper{
        public String compVal {get;set;}
        public String fieldSelected {get;set;}
        public String opSelected {get;set;} 
        public String logicOpSelected {get;set;} 
        public Boolean visible {get;set;}
        public Boolean inVal {get;set;}
        
        
        /**
          * @description       Constructor to initialize some of the Wrapper Class variables.  
          * @param             NA
          * @return            void
          * @throws            NA
          */
        public FieldWrapper(){
            compVal = UTIL_DuplicateConstants.BLANK_SPACE;
            fieldSelected = UTIL_DuplicateConstants.BLANK_SPACE;
            opSelected = UTIL_DuplicateConstants.BLANK_SPACE;
            logicOpSelected = UTIL_DuplicateConstants.BLANK_SPACE; 
            visible = false; 
            inval = false;            
        }
    }

}