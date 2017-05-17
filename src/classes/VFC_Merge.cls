/**
  * @author        Nandan Narasappa
  * @date          09/11/2013
  * @description   This class is controller extension for VFP_Merge page which consists of 
  				   methods for the initial page load i.e, to fetch the record details for
  				   the ids passed as a URL parameter; method to select the master record for
  				   the merge and method that updates the master record with values selected
  				   by the user, transfers all the child records associated to other records
  				   to master if re-parenting is allowed. Incase of non-reparenting, the child
  				   records are cloned and parented to master record. Class contains two wrapper
  				   class FieldRow and Cell to store the values for the field for records to be
  				   merged and style class to be displayed in the page. Maximum records that can
  				   be passed to the page depends on the Custom Label - MAX_MERGE and a minimum of 2
  				   records need to be passed for merge.
  */
public with sharing class VFC_Merge{
    
    // Start of Class Variables
    public boolean transferChild {get;set;}
    public List<FieldRow> fieldRows {get; set;}
    private Map<String, sObject> selectedRecords;   
    private set<Id> recordIds {get;set;}
    private Set<Id> xfrChildIds;
    public Integer selectedRecordsCount {get; private set;} {this.selectedRecordsCount = 0;} 
    private String firstRecordId ;
    private String secondRecordId ;
    private String thirdRecordId ; 
    private String fourthRecordId ;
    private String fifthRecordId ;
    private string tmpObjectName ;
    public string objectName {get;set;}
    public Map<String,String> objPrefixMap ;
    private Set<String> excludeChildObjs = new Set<String>{UTIL_DuplicateConstants.NOTES,
    													   UTIL_DuplicateConstants.ATTACHMENTS};
    // End of Class Variables
    
    /**
      * @author        Nandan Narasappa
      * @date          09/11/2013
      * @description   This is a wrapper class to store the field details and values for the records 
      				   to be merged and style class used to display in VFP_Merge.
      */   
    public class FieldRow {
        public String fieldLabel {get; set;} 
        public String fieldName {get; set;} 
        public boolean showRadio {get; set;} 
        public List<Cell> values {get; set;} 
        public String selectedValue {get; set;} 
        public String styleClass {get; set;}
        
        /**
          * @description       Constructor to initialize the Class variables
          * @param             NA
          * @return            NA
          * @throws            NA
          */ 
        public FieldRow() {
            this.values = new List<Cell>();
        }
        
        /**
          * @description       Constructor to initialize the Class variables
          * @param             fieldName    name of the field for the duplicate records in the merge process
          * @param             fieldLabel   label of the field for the duplicate records in the merge process
          * @param             showRadio    boolean to indicate whether radio button should be displayed for the value selection if different
          * @param             styleClass   class name for the row to apply css
          * @return            NA
          * @throws            NA
          */
        public FieldRow(String fieldName, String fieldLabel, boolean showRadio, String styleClass) {
            this();
            this.fieldName = fieldName;
            this.fieldLabel = fieldLabel;
            this.showRadio = showRadio;
            this.styleClass = styleClass;
        }
    }
    
    /**
      * @author        Nandan Narasappa
      * @date          09/11/2013
      * @description   This is a wrapper class to store the field Values and the records to be 
      				   merged used to display in VFP_Merge.
      */ 
    public class Cell {
        public String objId {get; private set;} 
        public String value {get; set;}
        public boolean xfrChild {get; set;} 
        
        /**
          * @description       Constructor to initialize the Class variables
          * @param             objectId   Id of the record in the merge process
          * @param             value      value for particular field in a record 
          * @return            NA
          * @throws            NA
          */ 
        public Cell (String objectId, String value) {
            this.objId = objectId;
            this.value = value;
            this.xfrChild = false;
        }
    }     
    
    /**
      * @description       Constructor to initialize some of the Class variables and call methods
      					   which need to run when the page loads i.e, to fetch the record details for
  				           the ids passed as a URL parameter. Maximum of 5 records can be passed to the 
  				           page.
      * @param             NA
      * @return            NA
      * @throws            NA
      */ 
    public VFC_Merge(){
    	transferChild = false;
        recordIds = new set<id>();
        selectedRecords = new Map<String, sObject>();
        objPrefixMap = new Map<String,String>();
        fieldRows = new List<FieldRow>();
        
        for(Schema.SObjectType objType : Schema.getGlobalDescribe().values()){
            string prefix = objType.getDescribe().getKeyPrefix();
            string objName = objType.getDescribe().getName();
            objPrefixMap.put(objName,prefix);
        }
        
        tmpObjectName = ApexPages.CurrentPage().getParameters().get(UTIL_DuplicateConstants.OBJ);
        if(!String.isBlank(tmpObjectName)){
            objectName = tmpObjectName.removeEnd(UTIL_DuplicateConstants.OBJ_POSTFIX); 
        }
        else{
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.Error, UTIL_DuplicateConstants.INVALID_OBJECT));
            return;
        }
        firstRecordId =  ApexPages.CurrentPage().getParameters().get(UTIL_DuplicateConstants.ID_ONE);
        secondRecordId = ApexPages.CurrentPage().getParameters().get(UTIL_DuplicateConstants.ID_TWO);
        thirdRecordId = ApexPages.CurrentPage().getParameters().get(UTIL_DuplicateConstants.ID_THREE);
        fourthRecordId = ApexPages.CurrentPage().getParameters().get(UTIL_DuplicateConstants.ID_FOUR);
        fifthRecordId = ApexPages.CurrentPage().getParameters().get(UTIL_DuplicateConstants.ID_FIVE);
        Integer max_merge = Integer.valueOf(Label.MAX_MERGE) > 2 ? 
        					(Integer.valueOf(Label.MAX_MERGE) > 5? 5 : Integer.valueOf(Label.MAX_MERGE)) : 2;

        if(!String.isBlank(firstRecordId)){
            recordIds.add(firstRecordId);
        }
        if(!String.isBlank(secondRecordId)){
            recordIds.add(secondRecordId);
        }
        if(!String.isBlank(thirdRecordId) && recordIds.size() < max_merge){
            recordIds.add(thirdRecordId);
        }
        if(!String.isBlank(fourthRecordId) && recordIds.size() < max_merge){
            recordIds.add(fourthRecordId);
        }
        if(!String.isBlank(fifthRecordId) && recordIds.size() < max_merge){
            recordIds.add(fifthRecordId);
        }

        if (recordIds.size() < 2) {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.Error,UTIL_DuplicateConstants.MIN_RECORD_ERROR));                
        }
        else{
            String objectPrefix = objPrefixMap.get(tmpObjectName);
            String firstPrefix = !String.isBlank(firstRecordId) ? firstRecordId.substring(0,3) : null;
            String secondPrefix = !String.isBlank(secondRecordId) ? secondRecordId.substring(0,3) : null;
            String thirdPrefix = !String.isBlank(thirdRecordId) ? thirdRecordId.substring(0,3) : null;
            String fourthPrefix = !String.isBlank(fourthRecordId) ? fourthRecordId.substring(0,3) : null;
            String fifthPrefix = !String.isBlank(fifthRecordId) ? fifthRecordId.substring(0,3) : null;
            
            Set<String> objPrefixSet = new Set<String>{objectPrefix,firstPrefix,secondPrefix,
            										   thirdPrefix,fourthPrefix,fifthPrefix };
    
            if(objPrefixSet.contains(NULL)){
                Boolean bol = objPrefixSet.remove(NULL);    
            }
            if(objPrefixSet.size() > 1){
                ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.Error, 
                										   UTIL_DuplicateConstants.SAME_OBJ_ERROR));
            }
            else{
                fetchRecords();
            }
        }
    }
    
    /**
      * @description       This method selects the default record i.e., master copy for the merge
      * @param             NA
      * @return            Void
      * @throws            NA
      */ 
    public void selectDefaultRecord() {
        String recordId = Apexpages.currentPage().getParameters().get(UTIL_DuplicateConstants.RECORDID);
        if (!String.isBlank(recordId) && selectedRecords.keySet().contains(recordId)) {
            for (FieldRow row : fieldRows) {
                if (row.showRadio) {
                    row.selectedValue = recordId;
                }
            }
        }
    }
    
    /**
      * @description       This method queries all the fields for the record ids passed to the page
      					   from an sObject, categorizes to standard, custom and system fields. For each
      					   field, an FieldRow instance is created which is displayed in the page for
      					   comparison.
      * @param             NA
      * @return            Void
      * @throws            NA
      */ 
    public void fetchRecords() {           
        String contactIdFilter = UTIL_DuplicateConstants.BLANK_SPACE; 
        this.selectedRecordsCount = 0;
        List<sObject> sobjRecords;
        Map<String, Schema.SObjectField> objectFields = new Map<String, Schema.SObjectField>();
        Map<String, Schema.DescribeFieldResult> standardFieldMap = new Map<String, Schema.DescribeFieldResult>();
        Map<String, Schema.DescribeFieldResult> customFieldMap = new Map<String, Schema.DescribeFieldResult>();   
        try {        
            objectFields = Schema.getGlobalDescribe().get(tmpObjectName).getDescribe().fields.getMap();         
            String query = UTIL_DuplicateConstants.SELECT_STRING + UTIL_DuplicateConstants.WIDE_BLANK_SPACE + 
                           UTIL_DuplicateConstants.ID_FIELD + UTIL_DuplicateConstants.COMMA +
                           UTIL_DuplicateConstants.NAME_FIELD + UTIL_DuplicateConstants.COMMA; 
            String fieldName ;
            for(Schema.SObjectField field : objectFields.values()){
                Schema.DescribeFieldResult fieldResult = field.getDescribe();
                fieldName = fieldResult.getName();
                if (fieldResult.isUpdateable()) {
                    if (fieldResult.getRelationshipName() == null) {
                        if(!fieldName.equalsIgnoreCase(UTIL_DuplicateConstants.NAME_FIELD)){
                            query += (fieldName + UTIL_DuplicateConstants.COMMA);
                        }
                    } else {
                        query += (fieldResult.getRelationshipName() + UTIL_DuplicateConstants.NAME_COMMA);
                    }
                    if(fieldResult.isCustom()) {
                        customFieldMap.put(fieldName, fieldResult);
                    } else {                    
                        standardFieldMap.put(fieldName, fieldResult);
                    }
                }
            }
    
            query += UTIL_DuplicateConstants.SYSTEM_FIELDS_LIST;
            
            query += UTIL_DuplicateConstants.WIDE_BLANK_SPACE + UTIL_DuplicateConstants.FROM_STRING +
                     UTIL_DuplicateConstants.WIDE_BLANK_SPACE + tmpObjectName + UTIL_DuplicateConstants.WIDE_BLANK_SPACE +
                     UTIL_DuplicateConstants.WHERE_CLAUSE;
            sobjRecords = Database.query(query);         
            if (sobjRecords == null || sobjRecords.size() != recordIds.size()) {
                ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.Error,
                										   UTIL_DuplicateConstants.QUERY_ALL_ERROR));
                return;
            }
        } catch (Exception e) {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.Error, 
            										   UTIL_DuplicateConstants.QUERY_DETAIL_ERROR + e));
            return;
        }
        
        for (Sobject obj: sobjRecords) {
            this.selectedRecords.put(obj.id, obj);
        }
                                
        List<String> standardFieldList = new List<String>();
        standardFieldList.addAll(standardFieldMap.keySet());
        standardFieldList.sort();
        
        List<String> customFieldList = new List<String>();
        customFieldList.addAll(customFieldMap.keySet());
        customFieldList.sort();
        
        FieldRow temp = new FieldRow(UTIL_DuplicateConstants.BLANK_SPACE, UTIL_DuplicateConstants.BLANK_SPACE, 
                                     false, UTIL_DuplicateConstants.HEADER);
        for (Sobject obj: sobjRecords) {            
            temp.values.add(new Cell(obj.id, String.valueOf(obj.get(UTIL_DuplicateConstants.NAME_FIELD))));
        }
        fieldRows.add(temp);
        
        temp = new FieldRow(UTIL_DuplicateConstants.MASTER_KEY, UTIL_DuplicateConstants.MASTER_RECORD, true, null);
        {
            DateTime lastModifiedDate;
            for (Sobject c: sobjRecords) {
                temp.values.add(new Cell(c.id, null));
                if (lastModifiedDate == null ||
                    (lastModifiedDate != null && 
                    (DateTime)c.get(UTIL_DuplicateConstants.LASTMODIFIED_DATE) > lastModifiedDate)) {
                    temp.selectedValue = c.id;
                    lastModifiedDate = (DateTime)c.get(UTIL_DuplicateConstants.LASTMODIFIED_DATE);
                }
            }
        }
        fieldRows.add(temp);
        
        fieldRows.add(new FieldRow(UTIL_DuplicateConstants.STANDARD_FIELDS, UTIL_DuplicateConstants.STANDARD_FIELDS, 
                                    false, UTIL_DuplicateConstants.SEPARATOR));
        
        for (String field: standardFieldList) {
            addFieldComparisonRows(field, standardFieldMap.get(field), sobjRecords);
        }
        
        fieldRows.add(new FieldRow(UTIL_DuplicateConstants.CUSTOM_FIELDS, UTIL_DuplicateConstants.CUSTOM_FIELDS, 
                                    false, UTIL_DuplicateConstants.SEPARATOR));
        
        for (String field: customFieldList) {
            addFieldComparisonRows(field, customFieldMap.get(field), sobjRecords);
        }
        
        fieldRows.add(new FieldRow(UTIL_DuplicateConstants.SYSTEM_FIELDS, UTIL_DuplicateConstants.SYSTEM_FIELDS, 
                                    false, UTIL_DuplicateConstants.SEPARATOR));
        
        FieldRow createdByRow = new FieldRow(UTIL_DuplicateConstants.CREATEDBYID_FIELD, 
        									 UTIL_DuplicateConstants.CREATEDBY_LABEL,false, null),
            lastModifiedByRow = new FieldRow(UTIL_DuplicateConstants.LASTMODIFIEDBYID_FIELD, 
            								 UTIL_DuplicateConstants.LASTMODIFIEDBY_LABEL,false, null);
        for (Sobject c: sobjRecords) {
            SObject createdBy = c.getSObject(UTIL_DuplicateConstants.CREATEDBY);
            SObject modifiedBy = c.getSObject(UTIL_DuplicateConstants.LASTMODIFIEDEDBY);
            createdByRow.values.add(new Cell(c.id, createdBy.get(UTIL_DuplicateConstants.NAME_FIELD) + 
                                                   UTIL_DuplicateConstants.WIDE_BLANK_SPACE + 
                                                   c.get(UTIL_DuplicateConstants.CREATED_DATE)));
            lastModifiedByRow.values.add(new Cell(c.id, modifiedBy.get(UTIL_DuplicateConstants.NAME_FIELD) +
                                                        UTIL_DuplicateConstants.WIDE_BLANK_SPACE + 
                                                        c.get(UTIL_DuplicateConstants.LASTMODIFIED_DATE)));
        }
        fieldRows.add(createdByRow);
        fieldRows.add(lastModifiedByRow);
        FieldRow xfrChild = new FieldRow('XFR', 'Child Records to Transfer', true, UTIL_DuplicateConstants.SEPARATOR);
        for (Sobject c: sobjRecords) {
            xfrChild.values.add(new Cell(c.id, null));
        }
        System.debug('** xfrChild  ==>'+xfrChild);
        fieldRows.add(xfrChild);
        System.debug('** fieldRows ==>'+fieldRows.get(fieldRows.size()-1));
                
    }
    
    /**
      * @description       This method is used to compare the field values for the records 
      					   passed to the page. For a field, if atleast one value is different
      					   among the records passed a radio button is displayed left to value
      					   for selection.
      * @param             fieldName   name of the field to be compared for the duplicate records
      * @param             fieldDesc   schema describe for the field to be compared
      * @param             objs        list of records for an sObject for comparison
      * @return            Void
      * @throws            NA
      */ 
    private void addFieldComparisonRows(String fieldName, Schema.DescribeFieldResult fieldDesc, List<SObject> objs) {
        FieldRow row = new FieldRow();
        row.fieldName = fieldName;
        
        if (!fieldDesc.isCustom() && fieldDesc.getRelationshipName() != null) {
            row.fieldLabel = fieldDesc.getRelationshipName();
        } else {
            row.fieldLabel = fieldDesc.getLabel();
        }
        
        row.values = new List<Cell>();
        
        boolean isDifferent = false; 
        boolean isNull = true; 
        Integer idx = 0;
        
        List<String> values = new List<String>();
        DateTime lastModifiedDate = null;
        String prev;
        
        for (SObject c : objs) {
            if (fieldDesc.getRelationshipName() != null) {
                Sobject obj = c.getSObject(fieldDesc.getRelationshipName());
                if (obj != null) {
                    values.add(String.valueOf(obj.get(UTIL_DuplicateConstants.NAME_FIELD)));
                } else {
                    values.add(null);
                }
            } else {
                values.add(String.valueOf(c.get(fieldName)));
            }
            
            isNull &= (c.get(fieldName) == null); 
            
            if (idx == 0) {
                prev = String.valueOf(c.get(fieldName));
            }
            if (idx > 0 && !isNull) {
                String current = String.valueOf(c.get(fieldName));
                if ((prev != null && !prev.equals(current)) ||
                    (current != null && !current.equals(prev))) {
                    isDifferent = true;
                }
                prev = current;
            }
            
            if (c.get(fieldName) != null && (lastModifiedDate == null ||
                (lastModifiedDate != null && 
                 (DateTime)c.get(UTIL_DuplicateConstants.LASTMODIFIED_DATE) > lastModifiedDate))) {
                row.selectedValue = c.id;
                lastModifiedDate = (DateTime)c.get(UTIL_DuplicateConstants.LASTMODIFIED_DATE);
            }
            
            idx++;
        }

        if (!isNull) {
        	for (Integer i=0; i < values.size(); i++) {
            	String val = values[i];
                if (val != null && val.length() > 255) {
                	val = val.substring(0, 251) + UTIL_DuplicateConstants.DOT_EXT;
                }
                row.values.add(new Cell(objs[i].id, val));
            }            
            row.showRadio = isDifferent ;
            fieldRows.add(row);
        }
        System.debug('** fieldRows ==>'+fieldRows);
    }
    
    /**
      * @description       This method updates the master record with values selected
		  				   by the user, transfers all the child records associated to other records
		  				   to master if re-parenting is allowed. Incase of non-reparenting, the child
		  				   records are cloned and parented to master record. Once the child records 
		  				   are transfered, the losing records are deleted.
      * @param             NA
      * @return            PageReference
      * @throws            Might throw exception which is handled by try-catch block
      */ 
    public PageReference mergeRecords() {
        SObject master; 
        xfrChildIds = new Set<Id>();
        System.debug('** fieldRows ==>'+fieldRows.size());
        System.debug('** fieldRows ==>'+fieldRows.get(0));
        System.debug('** fieldRows ==>'+fieldRows.get(fieldRows.size()-1));
        for (FieldRow row : fieldRows) {
            if (row.showRadio && row.fieldName.equals(UTIL_DuplicateConstants.MASTER_KEY)) {           
                master = Schema.getGlobalDescribe().get(tmpObjectName).newSObject() ;
                master.id = row.selectedValue;         
                break;
            }
        }
        if (master != null) {
            for (FieldRow row : fieldRows) {
            	System.debug('** row ==>'+row);
		    	if(row.fieldName.equalsIgnoreCase('XFR')){
		    		for(Cell c : row.values){
		    			System.debug('** Cell ==>'+c);
		    			if(c.xfrChild){
		    				xfrChildIds.add(c.objId);	
		    			}
		    		} 
		        }
                if (row.showRadio && !row.fieldName.equals(UTIL_DuplicateConstants.MASTER_KEY) 
                	&& !row.fieldName.equals('XFR') && row.selectedValue != master.id) {
                    SObject selectedRecord = this.selectedRecords.get(row.selectedValue);                    
                    if (selectedRecord.get(row.fieldName) == null) {
                        master.put(row.fieldName, null); 
                    } 
                    else {
                    	Object val = selectedRecord.get(row.fieldName);
                        master.put(row.fieldName, val);
                    }
                }
            }
            System.debug('** xfrChildIds ==>'+xfrChildIds);
            List<sObject> losers = new List<sObject>();            
            for (sObject c : this.selectedRecords.values()) {
                if (c.id != master.id) {
                    losers.add(c);
                }
            }
                       
            List<sObject> allRecords = new List<sObject>();
            allRecords.add(master);
            allRecords.addAll(losers);
            List<sObject> lock = Database.Query(UTIL_DuplicateConstants.SELECT_FROM + 
            									UTIL_DuplicateConstants.WIDE_BLANK_SPACE +
                                                tmpObjectName + UTIL_DuplicateConstants.WIDE_BLANK_SPACE + 
                                                UTIL_DuplicateConstants.WHERE_CLAUSE_LOCK);          
            
            if (lock == null || lock.size() != allRecords.size()) {
                ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.Error, 
                										   UTIL_DuplicateConstants.RECORD_LOCK_ERROR));
                return null;
            }
            
            System.SavePoint sp = Database.setSavepoint();
            try {                
                if(transferChild || !xfrChildIds.isEmpty()){ 
                    updateChildRecords(master,losers);     
                }
                delete losers;          
                update master;                
                return new PageReference(UTIL_DuplicateConstants.FORWARD_SLASH + master.id);          
            } catch (Exception e) {
                Database.rollback(sp);
                ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.Error, 
                                                           UTIL_DuplicateConstants.MERGE_ERROR + e.getStacktracestring()));
            }
        } else {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.Error, 
            										   UTIL_DuplicateConstants.SELECT_RECORD_INFO));
        }   
        return null;
    }
    
    /**
      * @description       This method fetch child records related to the losing records
                           for re-parenting to the master record. The child records that
                           can be re-parented will be updated with master and other records
                           will be cloned.
      * @param             master    sObject record selected as the master copy for merging 
      								 records 
  	  * @param             losers    list of sObject records that are duplicate to master copy. 
  								     The child records of losers will be transferred to the
  								     master record. 
      * @return            void 
      * @throws            Might throw exception which is handled by try-catch block in the calling method
      */ 
    public void updateChildRecords(sObject master,List<sObject> losers) {     
        String requiredFields ;
        List<sObject> childObjList = new List<sObject>(); 
	    List<sObject> insertchildObjList = new List<sObject>(); 
	    Set<Id> loserIds = new Set<Id>();
	    sObject tmpObj = null;     
	    boolean isUpdateable;
        Map<String,String> relatedObjectsMap = new Map<String,String>(); 
        Map<String,String> relatedObjMap = new Map<String,String>();        
        Map<String,String> requiredFieldsMap = new Map<String,String>();  
        Map<String,Schema.sObjectField> fieldMap = new Map<String,Schema.sObjectField>();    
        
        if(transferChild){
        	loserIds = (new Map<Id,SObject>(losers)).keySet();
        } 
        else{
        	loserIds = xfrChildIds;
        }  
        System.debug('** loserIds ==>'+loserIds);
        List<Schema.Childrelationship> relatedObjectsList = 
        							   Schema.getGlobalDescribe().get(tmpObjectName).getdescribe().getChildRelationships();
        for (Schema.Childrelationship  relatedObject : relatedObjectsList) {
            if(relatedObject.getChildSObject().getDescribe().isUpdateable()
                && relatedObject.getChildSObject().getDescribe().getKeyPrefix()!=null
                && !relatedObject.getChildSObject().getDescribe().isCustomSetting()
                && relatedObject.getChildSObject().getDescribe().isCreateable()
                && relatedObject.getRelationshipName() != null
                && !excludeChildObjs.contains(relatedObject.getRelationshipName())){
                relatedObjectsMap.put(String.valueOf(relatedObject.getRelationshipName()),
                					  String.valueOf(relatedObject.getField()));
                relatedObjMap.put(String.valueOf(relatedObject.getRelationshipName()),
                				  String.valueOf(relatedObject.getChildSObject()));
            }            
        }
        
        for(String obj : relatedObjMap.keyset()){
            requiredFields  = UTIL_DuplicateConstants.BLANK_SPACE;
            fieldMap.clear();
            fieldMap = Schema.getGlobalDescribe().get(relatedObjMap.get(obj)).getDescribe().fields.getMap();
            for(String reqField: fieldMap.keyset()){
                if(!reqField.equalsIgnoreCase(relatedObjectsMap.get(obj)) 
                   && !fieldMap.get(reqField).getDescribe().isNillable()){
                    requiredFields += UTIL_DuplicateConstants.COMMA + reqField;
                    requiredFieldsMap.put(obj,requiredFields);      
                }
            }  
        }
        String query = UTIL_DuplicateConstants.SELECT_ID + UTIL_DuplicateConstants.WIDE_BLANK_SPACE;
        for(String child : relatedObjectsMap.keyset()){
            query += UTIL_DuplicateConstants.SELECT_SUB + UTIL_DuplicateConstants.WIDE_BLANK_SPACE + 
            		 relatedObjectsMap.get(child)+ UTIL_DuplicateConstants.WIDE_BLANK_SPACE + requiredFieldsMap.get(child)+
            		 UTIL_DuplicateConstants.WIDE_BLANK_SPACE + UTIL_DuplicateConstants.FROM_STRING + 
            		 UTIL_DuplicateConstants.WIDE_BLANK_SPACE + child + UTIL_DuplicateConstants.CLOSE_BRACKET;
        }
        query += UTIL_DuplicateConstants.WIDE_BLANK_SPACE + UTIL_DuplicateConstants.FROM_STRING + 
                 UTIL_DuplicateConstants.WIDE_BLANK_SPACE + tmpObjectName + UTIL_DuplicateConstants.WIDE_BLANK_SPACE +
                 UTIL_DuplicateConstants.WHERE_CLAUSE_LOSER ;        
  
        for(sObject obj : Database.query(query)){
            for(String childName : relatedObjectsMap.keyset()){
                for(sObject child : obj.getSObjects(childName)){
                    isUpdateable = child.getSObjectType().getDescribe().fields.getMap().get(relatedObjectsMap.get(childName)).getDescribe().isUpdateable();
                    if(isUpdateable){
                        child.put(relatedObjectsMap.get(childName),master.id);   
                        childObjList.add(child);                     
                    }
                    else{
                       tmpObj = child.clone(false,true,true,true); 
                       tmpObj.put(relatedObjectsMap.get(childName),master.id);
                       insertchildObjList.add(tmpObj);
                    }                     
                }
            }
        }
        insertchildObjList.addALL(fetchNotesAttachment(master,losers));
        if(!insertchildObjList.isEmpty()){
        	Database.insert(insertchildObjList);
        }
        if(!childObjList.isEmpty()){
        	Database.update(childObjList);
        }
    }
    
    /**
      * @description       This method fetch notes & attachements related to the losing records
                           for re-parenting to the master record and returns to updateChildRecords
                           method for update.
      * @param             master    sObject record selected as the master copy for merging 
      								 records 
  	  * @param             losers    list of sObject records that are duplicate to master copy. 
  								     The child records of losers will be transferred to the
  								     master record. 
      * @return            List<sObject> 
      * @throws            Might throw exception which is handled by try-catch block in the calling method
      */ 
    public List<sObject> fetchNotesAttachment(sObject master,List<sObject> losers) {
        List<sObject> objList = new List<sObject>();
        Note tmpNote ;
        Attachment tmpAtch;
        for(Note note : [SELECT id,body,title,ParentId FROM Note WHERE ParentId IN: losers]){
            tmpNote = note.clone(false,true,true,true); 
            tmpNote.parentId = master.id;
            objList.add(tmpNote);
        } 
        for(Attachment attch : [SELECT id,body,Name,description,ParentId  FROM Attachment WHERE ParentId IN: losers]){
            tmpAtch= attch.clone(false,true,true,true); 
            tmpAtch.parentId = master.id;
            objList.add(tmpAtch);
        }
        return objList;  
    }
}