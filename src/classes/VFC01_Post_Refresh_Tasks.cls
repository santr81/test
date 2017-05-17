/**     CREATED BY                  CREATED DATE        DESCRIRIPTION
        Ranjeet Singh Chouhan       01/31/2013          Controller class to handle requests to mask email addresses, abort scheduled jobs and deactivate remote site settings
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------                             
        UPDATED BY                  UPDATED DATE        DESCRIPTION
        
**/

public class VFC01_Post_Refresh_Tasks {

        
    public Boolean areComponentsRetrieved {get; private set;}
    
    // List to store email address fields information 
    public List<AP08_EmailFieldsWrapper> emailFieldsWrapperList = new List<AP08_EmailFieldsWrapper>();
    public Integer emailFieldsCount {get; set;}
    
    // List to store scheduled jobs information
    public List<ScheduledJobsWrapper> scheduledJobsWrapperList = new List<ScheduledJobsWrapper>();
    public Integer schJobsCount {get; set;}
    
    // List to store remote site settings information
    public List<AP02_RemoteSiteSettingsWrapper> remoteSiteSettingsWrapperList = new List<AP02_RemoteSiteSettingsWrapper>();
    public Integer rssCount {get; set;}
    
    // These variables are used in retrieving remote site settings information
    public AP01_MetadataUtils.AsyncResult AsyncResult {get; private set;}
    private Boolean isRetrievingMetadata {get; set;}
    private Boolean isStoringStaticResource {get; set;}
    private Boolean isStaticResourceStored {get; set;}
    
    private List<String> remoteSiteSettingNames = new List<String>();
    private Set<String> objectsSet = new Set<String>();
    
    public String orgNameSpacePrefix {get; set;}
    private String lastRowColor = 'white';
    
    public Boolean isProductionOrg {get; set;}
    public String salesforceServerName {get; set;}
    
    public String emailAddressSuffix {get; set;}
    public String replaceOrSuffix {get; set;}
    
    // This method checks if the administrator has completed initial app setup and redirects him to main page if done otherwise redirects him to initial setup page.
    public PageReference checkInitialSetup() {
        try {
    
            // Calling retrieveZip() method, which invokes a retrieve metadata call and retrieves all active remote site settings
            if(areComponentsRetrieved == null || areComponentsRetrieved == false) {
                emailAddressSuffix = 'test';
                replaceOrSuffix = 'suffix';
                
                salesforceServerName = getSalesforceServerName();
                isProductionOrg = isProductionOrg();
                
                List<StaticResource> staticResourceList = [SELECT Id, NamespacePrefix FROM StaticResource WHERE Name = 'MetadataRetrieveZip'];
                if(!staticResourceList.isEmpty()) {
                    orgNameSpacePrefix = staticResourceList[0].NamespacePrefix;
                    if(orgNameSpacePrefix == null || orgNameSpacePrefix == '') {
                        orgNameSpacePrefix = 'c';
                    }
                    deleteMetadataZipStaticResource();
                }
                
                if(orgNameSpacePrefix == null || orgNameSpacePrefix == '') {
                    List<ApexClass> apexClassList = [Select NamespacePrefix From ApexClass Where name = 'VFC01_Post_Refresh_Tasks' limit 1];
                    if(!apexClassList.isEmpty()) {
                        orgNameSpacePrefix = apexClassList[0].NamespacePrefix;
                        if(orgNameSpacePrefix == null || orgNameSpacePrefix == '') {
                            orgNameSpacePrefix = 'c';
                        }
                    }
                }
                
                emailFieldsCount = 0;
                schJobsCount = 0;
                rssCount = 0;
                
                populateObjectsSet();
                listMetadata();
                
            }
            
            return null;
        } catch (Exception e) {
            String errorMsg = e.getMessage();
            if(errorMsg.contains('IO Exception: Unauthorized endpoint')) {
                PageReference pg = Page.VFP04_Initial_Setup;
                return pg;
            }  
            
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.Error, errorMsg));        
            return null;
        }
    }
    
    private String getSalesforceServerName() {
        String hostName = System.URL.getSalesforceBaseURL().getHost();
        
        if(hostName.contains('.visual.force.com')) {
            hostName = hostName.substringBefore('.visual.force.com');
        } else if(hostName.contains('-api.salesforce.com')) {
            hostName = hostName.substringBefore('-api.salesforce.com');
        } else {
            hostName = hostName.substringBefore('.salesforce.com');
        }
        
        return hostName.substring(hostName.lastIndexOf('.') + 1);
    }
    
    private Boolean isProductionOrg() {
        String salesforceServerName = getSalesforceServerName();
        
        if(salesforceServerName.startsWith('cs')) {
            return false;
        } else {
            return true;
        }
    }
    
    private void populateObjectsSet() {
        Map<String, Schema.SObjectType> sObjectTokenMap = Schema.getGlobalDescribe();
        
        for(Schema.SObjectType sObjectToken : sObjectTokenMap.values()) {
            Schema.DescribeSObjectResult sObjectResult = sObjectToken.getDescribe();
            Boolean isQueryable = sObjectResult.isQueryable();
            Boolean isCreateable = sObjectResult.isCreateable();
            Boolean isDeletable = sObjectResult.isDeletable();
            Boolean isSearchable = sObjectResult.isSearchable();
            
            if(isCreateable && isQueryable && isDeletable && isSearchable) {
                objectsSet.add(sObjectResult.getName());
            }
        }
        
    }
    
    // This method redirects the user to Main page
    public PageReference initialSetupCompleted() {
        PageReference pg = Page.VFP01_Post_Refresh_Tasks;
        return pg;
    }
    
    // Method to retrieve Email Address Fields, it uses describe calls to retrieve fields information
    public List<AP08_EmailFieldsWrapper> getEmailFieldsList() {
        return emailFieldsWrapperList;
    }
    
    // Method to retrieve Scheduled Jobs information, this method queries CronTrigger object to retrieve scheduled jobs
    public List<ScheduledJobsWrapper> getScheduledJobsList() {
        return scheduledJobsWrapperList;
    }
    
    // This method returns Remote Site Settings information
    public List<AP02_RemoteSiteSettingsWrapper> getRemoteSiteSettingsList() {
        return remoteSiteSettingsWrapperList;
    }
    
    // Method to set the session information
    private AP01_MetadataUtils.MetadataService createService() { 
        AP01_MetadataUtils.MetadataService service = new AP01_MetadataUtils.MetadataService();
        service.SessionHeader = new AP01_MetadataUtils.SessionHeader_element();
        service.SessionHeader.sessionId = UserInfo.getSessionId();
        return service;     
    }
    
    private void listMetadata() {
    
        AP01_MetadataUtils.MetadataService service = createService();
            
        List<AP01_MetadataUtils.ListMetadataQuery> queries = new List<AP01_MetadataUtils.ListMetadataQuery>();  
        
        AP01_MetadataUtils.ListMetadataQuery queryRSS = new AP01_MetadataUtils.ListMetadataQuery();
        queryRSS.type_x = 'RemoteSiteSetting';
        queries.add(queryRSS);
        
        AP01_MetadataUtils.ListMetadataQuery queryObj = new AP01_MetadataUtils.ListMetadataQuery();
        queryObj.type_x = 'CustomObject';
        queries.add(queryObj);
        
        AP01_MetadataUtils.FileProperties[] fileProperties = service.listMetadata(queries, 26);
        
        for(AP01_MetadataUtils.FileProperties fileProperty : fileProperties) {
            if(fileProperty.type_x == 'RemoteSiteSetting') {
                remoteSiteSettingNames.add(fileProperty.fullName);
            } else if(fileProperty.type_x == 'CustomObject') {
                if(!(fileProperty.fullName.contains('_del__c')))
                    objectsSet.add(fileProperty.fullName);
            }
        }
        
        retrieveZip();
    }
    
    // Method to make a call to retrieve remote site settings information, the retrieve call is an asynchronous call and may take some time
    private void retrieveZip() {
        
        isRetrievingMetadata = true;
        
        // Construct unmanaged package with list of desired components to retrieve in zip
        AP01_MetadataUtils.MetadataService service = createService();             
        AP01_MetadataUtils.RetrieveRequest retrieveRequest = new AP01_MetadataUtils.RetrieveRequest();
        retrieveRequest.apiVersion = 25;
        retrieveRequest.packageNames = null;
        retrieveRequest.singlePackage = false;
        retrieveRequest.specificFiles = null;
        retrieveRequest.unpackaged = new AP01_MetadataUtils.Package_x();
        retrieveRequest.unpackaged.types = getPackageTypeMembers();
        
        AsyncResult = service.retrieve(retrieveRequest);
                        
    }
     
    private List<AP01_MetadataUtils.PackageTypeMembers> getPackageTypeMembers() {
        List<AP01_MetadataUtils.PackageTypeMembers> pkgTypeMembersList = new List<AP01_MetadataUtils.PackageTypeMembers>();
        
        // Adding package type members for Remote Site Settings
        AP01_MetadataUtils.PackageTypeMembers packageTypeRSS = new AP01_MetadataUtils.PackageTypeMembers();
        packageTypeRSS.name = 'RemoteSiteSetting'; 
        packageTypeRSS.members = new String[] {'*'};
        pkgTypeMembersList.add(packageTypeRSS);
        
        // Adding package type members for Email Address Fields
        AP01_MetadataUtils.PackageTypeMembers packageTypeEmail = new AP01_MetadataUtils.PackageTypeMembers();
        packageTypeEmail.name = 'CustomObject'; 
        
        List<string> objectsList = new List<String>();
        objectsList.addAll(objectsSet);
        
        packageTypeEmail.members = objectsList;
        pkgTypeMembersList.add(packageTypeEmail);
        
        return pkgTypeMembersList;
    }
    
    // Method to check the status of retrieve call and if the call is completed successfully, this method retrieves the zip file which contains remote site setting xml files 
    // and package.xml file
    public PageReference checkAsyncRequest() {
        try {
            // Check the status of the retrieve request
            AP01_MetadataUtils.MetadataService service = createService();
            AP01_MetadataUtils.AsyncResult[] aysncResults = service.checkStatus(new String[] { AsyncResult.Id });
            
            if(aysncResults[0].done) {
                // Errors?
                if(aysncResults[0].state == 'Error') {
                    ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.Error, aysncResults[0].message));
                    AsyncResult = null;      
                    areComponentsRetrieved = true;       
                } else {
                    if(isRetrievingMetadata) {
                        // Place Base64 encoded zip data onto the page for the JSZip library to handle
                        AP01_MetadataUtils.RetrieveResult retrieveResult = service.checkRetrieveStatus(AsyncResult.id);
                        String MetaDataRetrieveZip = retrieveResult.zipFile;
                        
                        isRetrievingMetadata = false;
                        
                        storeZipFileAsStaticResource(MetaDataRetrieveZip);
                    } else if(isStoringStaticResource) {
                        isStaticResourceStored = true;
                        AsyncResult = null;
                        isStoringStaticResource = false;
                        
                        processMetadataZipStaticResource();
                    } else {
                        AsyncResult = null;
                        areComponentsRetrieved = true;
                    }
                    
                }
            }
            
        } catch (Exception e) {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.Error, 'Request timed out, please try again.'));
            AsyncResult = null;    
            areComponentsRetrieved = true;
        } 

        return null;
    }
    
    @TestVisible
    private void storeZipFileAsStaticResource(String MetaDataRetrieveZip) {
        isStoringStaticResource = true;
        
        AP01_MetadataUtils.StaticResource staticResource = new AP01_MetadataUtils.StaticResource();
        staticResource.fullName = 'MetadataRetrieveZip';
        staticResource.contentType = 'application/zip';
        staticResource.cacheControl = 'public';
        staticResource.content = MetaDataRetrieveZip;
        
        AP01_MetadataUtils.MetadataService service = createService();
        AP01_MetadataUtils.AsyncResult[] aysncResults = service.create(new AP01_MetadataUtils.Metadata[] {staticResource});
        AsyncResult = aysncResults[0];
    }
    
    @TestVisible
    private String getMetadataRetrieveZipStaticResourceUrl() {
        String url = '';
        
        List<StaticResource> staticResourceList = [SELECT Id, NamespacePrefix, SystemModStamp FROM StaticResource WHERE Name = 'MetadataRetrieveZip'];
        
        if(!staticResourceList.isEmpty()) {
            orgNameSpacePrefix = staticResourceList[0].NamespacePrefix;
            Long sysModStamp = staticResourceList[0].SystemModStamp.getTime();
            
            url = '/resource/' + sysModStamp + '/' + (orgNameSpacePrefix != null && orgNameSpacePrefix != '' ? orgNameSpacePrefix + '__' : '') + 'MetadataRetrieveZip' + '/unpackaged/';
        }
        
        return url;
    }
    
    @TestVisible
    private void processMetadataZipStaticResource() {
        String metadataRetrieveZipStaticResourceBaseUrl = getMetadataRetrieveZipStaticResourceUrl();
        
        remoteSiteSettingsWrapperList = new List<AP02_RemoteSiteSettingsWrapper>();
        emailFieldsWrapperList = new List<AP08_EmailFieldsWrapper>();
        emailFieldsWrapperList.addAll(getStandardEmailAddressFields());
        
        for(String rssName : remoteSiteSettingNames) {
            try {
                PageReference pg = new PageReference(metadataRetrieveZipStaticResourceBaseUrl + 'remoteSiteSettings/' + rssName + '.remoteSite');
                String contentAsXml;            
                if(!Test.isRunningTest()) {
                    Blob contentAsBlob = pg.getContent();
                    contentAsXml = contentAsBlob.toString();
                } else {
                    contentAsXml = '<?xml version="1.0" encoding="UTF-8"?><RemoteSiteSetting xmlns="http://soap.sforce.com/2006/04/metadata"><disableProtocolSecurity>false</disableProtocolSecurity><isActive>true</isActive><url>http://www.apexdevnet.com</url></RemoteSiteSetting>';
                }
                
                if(rssName != 'RSS01_MetadataAPI' ) {
                    AP02_RemoteSiteSettingsWrapper wrapper = parseRSSMetadataXml(rssName, contentAsXml);
                    if(wrapper.isActive) {
                        remoteSiteSettingsWrapperList.add(wrapper);
                    }
                }
            } catch (Exception e) {
                // Skip the remote site setting that does not exist in the zip file
            }
        }
        
        for(String objName : objectsSet) {
            try {
                PageReference pg = new PageReference(metadataRetrieveZipStaticResourceBaseUrl + 'objects/' + objName + '.object');
                String contentAsXml;            
                if(!Test.isRunningTest()) {
                    Blob contentAsBlob = pg.getContent();
                    contentAsXml = contentAsBlob.toString();
                    List<AP08_EmailFieldsWrapper> wrapperList = parseEmailAddMetadataXml(objName, contentAsXml);
                    emailFieldsWrapperList.addAll(wrapperList);
                } else {
                    if(objName == 'Student__c') {
                        contentAsXml = '<?xml version="1.0" encoding="UTF-8"?><CustomObject xmlns="http://soap.sforce.com/2006/04/metadata"><enableFeeds>false</enableFeeds>    <fields><fullName>EMail__c</fullName><label>Email</label><type>email</type></fields></CustomObject>';
                        List<AP08_EmailFieldsWrapper> wrapperList = parseEmailAddMetadataXml(objName, contentAsXml);
                        emailFieldsWrapperList.addAll(wrapperList);
                    }
                }
                
            } catch (Exception e) {
                // Skip the object that does not exist in the zip file
            }
            
        }
        
        remoteSiteSettingsWrapperList.sort();
        emailFieldsWrapperList.sort();
        
        populateScheduledJobsList();
        
        emailFieldsCount = emailFieldsWrapperList.size();
        rssCount = remoteSiteSettingsWrapperList.size();
        schJobsCount = scheduledJobsWrapperList.size();
        
        // The following code sets different colors for different object rows in page
        AP08_EmailFieldsWrapper prevWrapper;
        for(AP08_EmailFieldsWrapper wrapper : emailFieldsWrapperList) {
            if(prevWrapper == null || prevWrapper.objectName != wrapper.objectName) {
                toggleRowColor();
                wrapper.rowBGStyle = 'background-color:' + lastRowColor + ';';
                prevWrapper = wrapper;
            } else {
                wrapper.rowBGStyle = 'background-color:' + lastRowColor + ';';
                prevWrapper = wrapper;
            }
        }
        
        
        
        areComponentsRetrieved = true;
        
        deleteMetadataZipStaticResource();
        
    }
    
    @TestVisible
    private void populateScheduledJobsList() {
        scheduledJobsWrapperList = new List<ScheduledJobsWrapper>();
        
        List<CronTrigger> jobsList = [Select Id, NextFireTime, State From CronTrigger Where NextFireTime != null];
        
        if(!jobsList.isEmpty()) {
            for(CronTrigger job : jobsList) {
                if(job.State != 'DELETED') {
                    scheduledJobsWrapperList.add(new ScheduledJobsWrapper(job.Id, 'Scheduled Job', 'Unknown', true, job.NextFireTime, job.State));
                }
            }
        }
        
    }
    
    @TestVisible
    private void deleteMetadataZipStaticResource() {
        
        AP01_MetadataUtils.StaticResource staticResource = new AP01_MetadataUtils.StaticResource();
        staticResource.fullName = 'MetadataRetrieveZip';
        staticResource.contentType = 'application/zip';
        staticResource.cacheControl = 'public';
        
        AP01_MetadataUtils.MetadataService service = createService();
        AP01_MetadataUtils.AsyncResult[] aysncResults = service.deleteMetadata(new AP01_MetadataUtils.Metadata[] {staticResource});

    }
    
    // This method is used to parse a metadata file (xml) and it returns a remote site setting wrapper object
    private AP02_RemoteSiteSettingsWrapper parseRSSMetadataXml(String name, String xmlString) {
        
        XmlStreamReader reader = new XmlStreamReader(xmlString);
        AP02_RemoteSiteSettingsWrapper wrapper = new AP02_RemoteSiteSettingsWrapper();
        wrapper.name = name;
        
        while(reader.hasNext()) {
            if (reader.getEventType() == XmlTag.START_ELEMENT) {
                if('disableProtocolSecurity' == reader.getLocalName()) {
                    reader.next();
                    wrapper.disableProtocolSecurity = Boolean.valueOf(reader.getText());
                } else if('isActive' == reader.getLocalName()) {
                    reader.next();
                    wrapper.isActive = Boolean.valueOf(reader.getText());
                } else if('url' == reader.getLocalName()) {
                    reader.next();
                    wrapper.url = reader.getText();
                }
            }
            reader.next();
        }
        
        return wrapper; 
        
    }
    
    // This method is used to parse a metadata file (xml) and it returns a remote site setting wrapper object
    private List<AP08_EmailFieldsWrapper> parseEmailAddMetadataXml(String name, String xmlString) {
        
        Dom.Document custObjDoc = new Dom.Document();
        custObjDoc.load(xmlString);
        
        Dom.XmlNode rootElement = custObjDoc.getRootElement();
        Dom.XmlNode[] bodyElements = rootElement.getChildElements();
        
        List<AP08_EmailFieldsWrapper> emailAddressWrapperList = new List<AP08_EmailFieldsWrapper>();
        AP08_EmailFieldsWrapper emailAddressWrapper;
        
        for(Dom.XmlNode node : bodyElements) {
            
            if(node.getName() == 'fields') {
                Dom.XmlNode[] childElements = node.getChildElements();
                
                String fullName = '';
                String fieldType = '';
                String fieldLabel = '';
                
                for(Dom.XmlNode child : childElements) {
                    if(child.getName() == 'type' && child.getText() == 'Email') {
                        fieldType = 'Email';
                    } else if(child.getName() == 'fullName') {
                        fullName = child.getText();
                    } else if(child.getName() == 'label') {
                        fieldLabel = child.getText();
                    }
                }
                
                if(fieldType == 'Email') {
                    emailAddressWrapper = new AP08_EmailFieldsWrapper();
                    emailAddressWrapper.apiName = fullName;
                    emailAddressWrapper.checked = true;
                    emailAddressWrapper.label = fieldLabel;
                    emailAddressWrapper.objectName = name;
                    
                    emailAddressWrapperList.add(emailAddressWrapper);
                }
            }
            
        }
        
        if(!emailAddressWrapperList.isEmpty())
            toggleRowColor();
        
        return emailAddressWrapperList; 
        
    }
    
    private void toggleRowColor() {
        if(lastRowColor == '' || lastRowColor == 'white') {
            lastRowColor = '#FFFFE0';
        } else {
            lastRowColor = 'white';
        }
    }
    @TestVisible
    private List<AP08_EmailFieldsWrapper> getStandardEmailAddressFields() {
        List<AP08_EmailFieldsWrapper> emailFieldsList = new List<AP08_EmailFieldsWrapper>();
        
        if(isPersonAccountEnabled()) {
            emailFieldsList.add(new AP08_EmailFieldsWrapper('Email', 'PersonEmail', 'Account', true));
            toggleRowColor();
        }
        
        if(isQuoteEnabled()) {
            emailFieldsList.add(new AP08_EmailFieldsWrapper('Email', 'Email', 'Quote', true));
            toggleRowColor();
        }
        
        emailFieldsList.add(new AP08_EmailFieldsWrapper('Web Email', 'SuppliedEmail', 'Case', true));
        toggleRowColor();
        
        emailFieldsList.add(new AP08_EmailFieldsWrapper('Email', 'Email', 'Contact', true));
        toggleRowColor();
        
        emailFieldsList.add(new AP08_EmailFieldsWrapper('Email', 'Email', 'Lead', true));
        toggleRowColor();
        
        return emailFieldsList;
    }
    
    private Boolean isPersonAccountEnabled() {
        return Schema.sObjectType.Account.fields.getMap().containsKey( 'isPersonAccount' );
    }
    
    private Boolean isQuoteEnabled() {
        try {
            SObject s = Database.Query('Select Id From Quote Limit 1');
            return true;
        } catch(Exception e) {
            return false;
        }
    }
    
    // Post Refresh Task Action Methods
    // Sends the user to confirmation page
    public PageReference confirmPostRefreshTasks() {
        PageReference pg = Page.VFP02_Confirmation;
        
        return pg;
    }
    
    // Sends the user to Main page
    public PageReference cancelPostRefreshTasks() {
        PageReference pg = Page.VFP01_Post_Refresh_Tasks;
        
        return pg;
    }
    
    // This method performs the following operations:
    // Deactivates selected remote site settings
    // Aborts selected scheduled jobs
    // Schedules the masking of selected email address fields
    public PageReference schedulePostRefreshTasks() {
    
    
        PIICaptureControllerMerge piidataupdate = new PIICaptureControllerMerge();
        piidataupdate.doUpdateAll();
        
        // Deploy Remote Site Settings
        
        AP01_MetadataUtils.MetadataService service = createService();
        
        AP01_MetadataUtils.UpdateMetadata[] UpdateMetadataList = new List<AP01_MetadataUtils.UpdateMetadata>();
        
        AP01_MetadataUtils.UpdateMetadata rssUpdateMetadata;
        AP01_MetadataUtils.RemoteSiteSetting rssMetadata;
        for(AP02_RemoteSiteSettingsWrapper rss : remoteSiteSettingsWrapperList) {
            if(rss.checked == true) {
                rssUpdateMetadata = new AP01_MetadataUtils.UpdateMetadata();
                rssMetadata = new AP01_MetadataUtils.RemoteSiteSetting();
                
                rssMetadata.fullName = rss.name;
                rssMetadata.disableProtocolSecurity = false;
                rssMetadata.isActive = false;
                rssMetadata.url = rss.url;
                
                rssUpdateMetadata.currentName = rss.name;
                rssUpdateMetadata.metadata = rssMetadata;
                
                UpdateMetadataList.add(rssUpdateMetadata);
            }
        }
        
        if(!UpdateMetadataList.isEmpty())
            AP01_MetadataUtils.AsyncResult[] aysncResults = service.updateMetadata(UpdateMetadataList);     
        
        // Abort Scheduled Jobs
        
        for(ScheduledJobsWrapper job : scheduledJobsWrapperList) {
            if(job.checked == true && job.state != 'EXECUTING') {
                System.abortJob(job.jobId);
            }
        }
        
        // Email Masking
        
     /*   Map<String, List<String>> emailFieldsMap = new Map<String, List<String>>();
        List<String> emailFieldsList;
        for(AP08_EmailFieldsWrapper emailField : emailFieldsWrapperList ) {
            if(emailField.checked == true) {
                emailFieldsList = emailFieldsMap.get(emailField.objectName);
                if(emailFieldsList == null) {
                    emailFieldsList = new List<String>();
                    emailFieldsMap.put(emailField.objectName, emailFieldsList);
                }
                emailFieldsList.add(emailField.apiName);
            }
        } 
        
        if(!emailFieldsMap.isEmpty()) {
        
           List<AP03_Data_Updates_Batch> batchUpdateList = new List<AP03_Data_Updates_Batch>();
            for(String objectName : emailFieldsMap.keySet()) {
                emailFieldsList = emailFieldsMap.get(objectName);
                batchUpdateList.add(new AP03_Data_Updates_Batch(objectName, emailFieldsList, emailAddressSuffix, replaceOrSuffix));
            }
            
            AP04_Data_Updates_Sch dataUpdatesSch = new AP04_Data_Updates_Sch();
            dataUpdatesSch.dataUpdatesBatchList = batchUpdateList;
            
            DateTime scheduleDateTime = System.now().addSeconds(5);
            
            String sch = string.valueof(scheduleDateTime.second()) + ' ' + string.valueof(scheduleDateTime.minute()) + ' ' + string.valueof(scheduleDateTime.hour()) + ' ' + string.valueof(scheduleDateTime.day()) + ' ' + string.valueof(scheduleDateTime.month()) + ' ? ' + string.valueof(scheduleDateTime.year());
            
            dataUpdatesSch.cronExpList = new List<String>();
            dataUpdatesSch.cronExpList.add(sch);
            dataUpdatesSch.batchProcessIdSet = new Set<ID>();
            dataUpdatesSch.waitingTimeInSecs = 60;
            
            system.schedule('Email Masking' + sch, sch, dataUpdatesSch);
        
        } else {
            AP04_Data_Updates_Sch dataUpdatesSch = new AP04_Data_Updates_Sch();
            dataUpdatesSch.sendCompleteNotification();
        } */
        
        PageReference pg = Page.VFP03_Thank_You;
        return pg;
    }
    
    // Wrapper class to store scheduled jobs information
    @TestVisible
    class ScheduledJobsWrapper {
        public String jobId {get; set;}
        public Boolean checked {get; set;}
        public String jobName {get; set;}
        public String jobType {get;set;}
        public Datetime nextFireTime {get; set;}
        public String state {get; set;}
        
        public ScheduledJobsWrapper(String jobId, String jobName, String jobType, Boolean checked, Datetime nextFireTime, String state) {
            this.jobId = jobId;
            this.jobName = jobName;
            this.jobType = jobType;
            this.checked = checked;
            this.nextFireTime = nextFireTime;
            this.state = state;
        }
    
    }
    
}