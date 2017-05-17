public class PIICaptureControllerMerge {

    public List<String> fieldNameToString { get; set; }
    public List<SelectOption> fieldNames{get; set;}
    public List<String> CorrespondingFields{ get; set; }
    public  list<PIIMaster__c> addedPII { get; set; }
    public String AllObjectsList { get; set; }
    List<String > originalvalues = new List<String >();
    Public List<string> rightselected{get;set;}
    Set<string> leftvalues = new Set<string>();
    Set<string> rightvalues = new Set<string>();
    public map<string, map<string,string>> objfieldmap {get;set;}
    public boolean showsavebtn {get;set;}
    public list<PIIMaster__c> piimasterlist {get;set;}
    public map<String, id> objectJobIdmap = new map<String, id>();
    public boolean polleractive {get;set;}
    
    public PIICaptureControllerMerge(VFC01_Post_Refresh_Tasks controller){
        
    }
    public PIICaptureControllerMerge(){
        CorrespondingFields= new List<string>();
        addedPII = new list<PIIMaster__c>();
        objfieldmap = new map<string, map<string,string>>();
        piimasterlist = [SELECT Id, Field_Names__c, Object_API_Name__c, PreferredDummyText__c, Status__c, Exception__c FROM PIIMaster__c];
        rightselected = new List<String>();
        leftvalues.addAll(originalvalues);  
        showsavebtn = false;     
        polleractive = false; 
    }
    
    public void loadPiimaster(){
         piimasterlist = [SELECT Id, Field_Names__c, Object_API_Name__c, PreferredDummyText__c, Status__c, Exception__c FROM PIIMaster__c];
    }
    
    // Fired on click of > arrow button
    public PageReference selectclick(){
        ApexPages.getmessages().clear();
        system.debug(CorrespondingFields);
        rightselected.clear();
        for(String s : CorrespondingFields){
            leftvalues.remove(s);
            rightvalues.add(s);
        }
        rightSelected.addall(rightvalues);
        system.debug(rightselected);
        return null;
    }
    // Fired on click of < arrowbutton
    public PageReference unselectclick(){
        ApexPages.getmessages().clear();
        CorrespondingFields.clear();
        for(String s : rightselected){
            rightvalues.remove(s);
            leftvalues.add(s);
        }
        return null;
    }
    
    // Building the fields to choose multiselect box
    public List<SelectOption> getunSelectedValues(){
        List<SelectOption> options = new List<SelectOption>();
        List<string> tempList = new List<String>();
        tempList.addAll(leftvalues);
        tempList.sort();
        for(string s : tempList)
            options.add(new SelectOption(s,s));
        return options;
    }
    
    // Building the fields to choose multiselect box
    public List<SelectOption> getSelectedValues(){
        List<SelectOption> options1 = new List<SelectOption>();
        List<string> tempList = new List<String>();
        tempList.addAll(rightvalues);
        tempList.sort();
        for(String s : tempList)
            options1.add(new SelectOption(s,s));
        return options1;
    }
    
    public class innerWrapperClass{
        List<String> SelectedFieldsName { get; set; }
    }
    
    // Adds the selected fields in a temperory list
    public void addfieldstothelist(){
        try{
            PIIMaster__c pii;
            if(objfieldmap == null){
                objfieldmap = new map<string, map<string,string>>();
            }
            map<string,string> fieldAndDummytext = new map<string,string>();
            if(!rightselected.isEmpty()){
                for(String field: rightselected){
                    fieldAndDummytext.put(field,'');
                }
                system.debug('fielddummytext is ' + fieldAndDummytext);
                system.debug('AllObjectsList is ' + AllObjectsList);
                if(fieldAndDummytext != null){
                    objfieldmap.put(AllObjectsList,fieldAndDummytext);
                    showsavebtn = true;
                }
            }else{
                ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'Move the list fields to the right');
                ApexPages.addMessage(myMsg);
            }
        }catch (exception e){
            system.debug(e);
        }

        rightselected = new list<string>();
    }
    
    // Saves the Choosen fields as comma seperated string. 
    // The relevant dummy value as field-dummyvalue pair( fieldname:dummytext) seperated by comman
    public PageReference savePIIMaster(){
        try{
            system.debug('objfieldmap ' + objfieldmap);
            // Iterate objfieldmap and save them in the pii master object
            for(String objname : objfieldmap.keyset()){
            
                String dummytextpair;
                String fieldpair;
                Integer counter =0;
                
                system.debug('Object name is ' + objname);
                PIIMaster__c piirecord = new PIIMaster__c();
                piirecord.Object_API_Name__c = objname;
                map<string,string> objfieldlst = objfieldmap.get(objname);
                system.debug('objfieldlst is' + objfieldlst);
                for(String fieldname: objfieldlst.keyset()){
                    system.debug('Field name is ' + fieldname + 'Pair is ' + fieldpair + ' - ' + String.isnotBlank(fieldpair));
                    system.debug('dummy name is ' + objfieldlst.get(fieldname) + 'Pair is ' + dummytextpair);
                    
                    if(String.isnotBlank(fieldpair)){
                        fieldpair = fieldpair + fieldname;
                    }else{
                        fieldpair = fieldname;
                    }
                    
                    if(String.isnotBlank(dummytextpair)){
                        dummytextpair = dummytextpair + fieldname + ':' + objfieldlst.get(fieldname);
                    }else{
                        dummytextpair = fieldname + ':' + objfieldlst.get(fieldname);
                    }
                    if(isUniquefield(objname, fieldname)){
                        dummytextpair = dummytextpair +'{count}';
                    }
                    
                    if(counter < objfieldlst.size()-1){
                        fieldpair = fieldpair + ',';
                        dummytextpair = dummytextpair + ',';
                    }
                    counter++;
                }
                piirecord.Field_Names__c = fieldpair;
                piirecord.PreferredDummyText__c = dummytextpair;
                system.debug(piirecord);
                if(addedPII == null){
                    addedPII = new list<PIIMaster__c>();
                }
                addedPII.add(piirecord);
            }
            
            insert addedpii;
            piimasterlist = [SELECT Id, Field_Names__c, Object_API_Name__c, PreferredDummyText__c, Status__c, Exception__c FROM PIIMaster__c];
            
            objfieldmap = new map<string, map<string,string>>();
            
            ApexPages.Message succMesg = new ApexPages.Message(ApexPages.Severity.CONFIRM,'Successfully saved!');
            ApexPages.addMessage(succMesg); 
            
        }catch(Exception e){
            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,e.getMessage());
            ApexPages.addMessage(myMsg); 
        
        }
        return null;
    }
    
    public void getAllFields() {
        ApexPages.getmessages().clear();
        fieldNameToString = new List<String>();
        fieldNames = new List<SelectOption>();
        if(AllObjectsList != null){
            CorrespondingFields = new list<String>();
            rightselected = new list<String>();
            rightvalues = new set<String>();
            Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
            Schema.SObjectType ObjectSchema = schemaMap.get(AllObjectsList);
            Map<String, Schema.SObjectField> fieldMap = ObjectSchema.getDescribe().fields.getMap();
            
            for(String fieldName: fieldMap.keySet()) {
                fieldNames.add(new SelectOption(fieldName,fieldName));
                fieldNameToString.add(fieldName);
            }
        }
    }
    
    public List<SelectOption> getAllObjects() {
        List<Schema.sObjectType> gd = Schema.getGlobalDescribe().Values();
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('','--------Select--------'));
        for(Schema.sObjectType gd1 : gd){
          options.add(new SelectOption(gd1.getDescribe().getName(), gd1.getDescribe().getName() +' (' + gd1.getDescribe().getlabel() + ') '));  
          }
        options.sort();
        return options;
    }

    public void doUpdateAll(){
        system.debug('Update all PII Data');
        ApexPages.getmessages().clear();
        polleractive = true;
        if(piimasterlist == null){
            piimasterlist = [SELECT Id, Field_Names__c, Object_API_Name__c, PreferredDummyText__c, Status__c, Exception__c FROM PIIMaster__c];
        }
        
        try{
            for(PIIMaster__c piimaster: piimasterlist){
                piimaster.Status__c = 'InProgress';
            }
            update piimasterlist;
            if(piimasterlist.size() < 90){
                map<string,string> fieldvaluepair;
                for(PIIMaster__c pii: piimasterlist ){
                    fieldvaluepair = new map<string,string>();
                    List<string> prefDummytextlist = pii.PreferredDummyText__c.split(',');
                    if(prefDummytextlist.size() > 0){
                        for(String fielddummytxtpair: prefDummytextlist){
                            if(String.isNotBlank(fielddummytxtpair) && fielddummytxtpair.contains(':')){
                                fieldvaluepair.put(fielddummytxtpair.split(':')[0],fielddummytxtpair.split(':')[1]);
                            }
                        }
                        ID job = Database.executeBatch(new maskPIIData(pii.Object_API_Name__c,fieldvaluepair));
                        objectJobIdmap.put(pii.Object_API_Name__c, job);
                    }
                }
                ApexPages.Message myCnfMsg = new ApexPages.Message(ApexPages.Severity.CONFIRM,'Batch initiated, status will be updated shortly');
                ApexPages.addMessage(myCnfMsg);
            }else{
                ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'More than 90 batches are required, Contact ARTL team.');
                ApexPages.addMessage(myMsg);     
            }
                
        }catch(Exception e){
            system.debug(e);
        }
    }
    
    public void doUpdate(){
        polleractive = true;
        ApexPages.getmessages().clear();
        String Objectapiname = apexpages.currentpage().getparameters().get('Objectapiname');
        system.debug('Param is ' + Objectapiname);
        map<string,string> fieldvaluepair;
        for(PIIMaster__c pii: [SELECT Id, Field_Names__c, Object_API_Name__c, PreferredDummyText__c, Status__c, Exception__c FROM PIIMaster__c where Object_API_Name__c=:Objectapiname limit 1]){
            pii.Status__c = 'InProgress';
            fieldvaluepair = new map<string,string>();
            List<string> prefDummytextlist = pii.PreferredDummyText__c.split(',');
            if(prefDummytextlist.size() > 0){
                for(String fielddummytxtpair: prefDummytextlist){
                    if(String.isNotBlank(fielddummytxtpair) && fielddummytxtpair.contains(':')){
                        fieldvaluepair.put(fielddummytxtpair.split(':')[0],fielddummytxtpair.split(':')[1]);
                    }
                }
                Id singlejobid = Database.executeBatch(new maskPIIData(pii.Object_API_Name__c,fieldvaluepair));
                objectJobIdmap.put(pii.Object_API_Name__c, singlejobid);
            }
        }
        
        ApexPages.Message CnfMsg = new ApexPages.Message(ApexPages.Severity.CONFIRM,'Batch initiated, status will be updated shortly');
        ApexPages.addMessage(CnfMsg);
    }
    
    public PageReference checkJobsStatus(){
        ApexPages.getmessages().clear();
        system.debug(objectJobIdmap);
        List<AsyncApexJob> joblist = [Select Id, Status, NumberOfErrors, JobItemsProcessed, TotalJobItems from AsyncApexJob where Id = :objectJobIdmap.values()];
        system.debug(joblist);
        map<id,string> jobstatus = new map<id,string>();
        Integer completedjobcount = 0;
        for(AsyncApexJob a: joblist){
            jobstatus.put(a.id, a.status);
            if(a.status.equalsignorecase('Completed')){
                completedjobcount++;
                piimasterlist = [SELECT Id, Field_Names__c, Object_API_Name__c, PreferredDummyText__c, Status__c, Exception__c FROM PIIMaster__c];
            }
        }
        
        if(completedjobcount == joblist.size()){
            polleractive = false;
        }
        
        for(Piimaster__c p: piimasterlist){
            p.status__c = jobstatus.get(objectJobIdmap.get(p.Object_API_Name__c));
            system.debug(p.status__c);
        }
        
        return null;
    }
    
    // Is field unique
    public boolean isUniquefield(String objname, String fieldname){
        Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
        Schema.SObjectType ObjectSchema = schemaMap.get(objname);
        Map<String, Schema.SObjectField> fieldMap = ObjectSchema.getDescribe().fields.getMap();
        return fieldMap.get(fieldname).getDescribe().isUnique();
    }
    
    // Is field number?
    public boolean isNumberfield(String objname, String fieldname){
        Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
        Schema.SObjectType ObjectSchema = schemaMap.get(objname);
        Map<String, Schema.SObjectField> fieldMap = ObjectSchema.getDescribe().fields.getMap();
        return fieldMap.get(fieldname).getDescribe().getType() == Schema.DisplayType.Integer;
    }
}