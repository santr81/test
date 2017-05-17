public class postrefreshUpdate{
    
    /* Sample class to update the key settings like custom label, named credential and remote site settings. 
    * Ensure the current org domain is saved in the remote site settings
    * 
    * Class will be usefull as part of post refresh update 
    */
    
    
    public string SERVER_URL = 'https://na34.salesforce.com/';
    
    // Update single custom label
    public void CustomLabelUpdate(String customLabel){
        
        HttpRequest req = new HttpRequest(); 
        
        //Set HTTPRequest Method
        req.setMethod('GET');
        req.setHeader('Authorization',' OAuth ' + userinfo.getSessionId());
        req.setHeader('X-User-Agent','MyClient');
        req.setHeader('content-type', 'application/json');
        req.setEndpoint(SERVER_URL+'/services/data/v36.0/sobjects/'+ customLabel);
        
        Http http = new Http();
        
        try {
            if(!Test.isRunningTest()){
            HTTPResponse res  = http.send(req); 
            
            Map<String, Object> m = (Map<String, Object>)JSON.deserializeUntyped(res.getBody());
            // Process the response and send the needed id to the next method UpdateCustomLabel
            // UpdateCustomLabel('%ID%');
            }
        } catch(System.CalloutException e) {
            System.debug(' CalloutException  ==> ' + e );
            //Exception handling goes here....
        }       
        
    } 
    
    Public Void UpdateCustomLabel(String recId){ 
        
        List<MetadataService.CustomLabel> customLabels = new List<MetadataService.CustomLabel> ();
        MetadataService.CustomLabel cLabel = new MetadataService.CustomLabel();
        cLabel.fullName = 'Test';
        cLabel.language = '%en_US%';
        cLabel.protected_x = false;
        cLabel.categories= '%Text%';
        cLabel.shortDescription = '%Text%' ;
        cLabel.value =   '%VALUE%';  
        customLabels.add(cLabel); 
        
        MetadataService.CustomLabels  labelslist = new MetadataService.CustomLabels();
        labelslist.labels = customLabels ;
        labelslist.fullName = '%Text%' ;
        if(!Test.isRunningTest()){
        MetadataService.MetadataPort service = createService ();                                                    
        List<MetadataService.UpsertResult> results =  service.upsertMetadata( new MetadataService.Metadata[] { labelslist  });                
        handleSaveResults(results[0]);
        
        System.Debug(' results are ==> ' + results[0]);
        }
    }
    
    
    // Update named credentials
    Public Void UpdateNamedCredentials(){ 
        
        MetadataService.NamedCredential  NamedCredential  = new MetadataService.NamedCredential ();
        NamedCredential.fullName = '%Text%' ;
        NamedCredential.authProvider = '%Text%' ;
        NamedCredential.endpoint = '%Text%' ;
        NamedCredential.label = '%Text%' ;
        NamedCredential.oauthRefreshToken = '%Text%' ;
        NamedCredential.oauthScope = '%Text%' ;
        NamedCredential.oauthToken = '%Text%' ;
        NamedCredential.password = '%Text%' ;
        NamedCredential.principalType = '%Text%' ;
        NamedCredential.protocol = '%Text%' ;
        NamedCredential.username  = '%Text%' ;
        if(!Test.isRunningTest()){
        MetadataService.MetadataPort service = createService ();
        List<MetadataService.UpsertResult> results =  service.upsertMetadata( new MetadataService.Metadata[] { NamedCredential });                
        handleSaveResults(results[0]);
        }
    }
    
    // Update remote site settings
    Public Void UpdateRemoteSiteSettings(){ 
        
        MetadataService.RemoteSiteSetting RemoteSiteSetting = new MetadataService.RemoteSiteSetting();
        RemoteSiteSetting.fullName = '%Text%' ;
        RemoteSiteSetting.description = '%Text%' ; 
        RemoteSiteSetting.disableProtocolSecurity = false;
        RemoteSiteSetting.isActive = true;
        RemoteSiteSetting.url = '%Text%' ; 
        if(!Test.isRunningTest()){
        MetadataService.MetadataPort service = createService();
        List<MetadataService.UpsertResult> results =  service.upsertMetadata( new MetadataService.Metadata[] { RemoteSiteSetting });                
        handleSaveResults(results[0]);
        }
    }
    
    
    // Update multiple custom labels
    Public static void UpdateCustomLabels(){ 
        
        List<MetadataService.CustomLabel> customLabels = new List<MetadataService.CustomLabel> ();
        MetadataService.CustomLabel cLabel = new MetadataService.CustomLabel();
        cLabel.fullName = 'Test';
        cLabel.language = 'en_US';
        cLabel.protected_x = false;
        cLabel.categories= '%Text%' ;
        cLabel.shortDescription = '%Text%' ;
        cLabel.value =   '%Text%' ;  
        customLabels.add(cLabel); 
        MetadataService.CustomLabels  labelslist = new MetadataService.CustomLabels();
        labelslist.labels = customLabels ;
        labelslist.fullName = '%Text%' ;
        if(!Test.isRunningTest()){
        MetadataService.MetadataPort service = createService();
        
        List<MetadataService.UpsertResult> results =  service.upsertMetadata( new MetadataService.Metadata[] { labelslist  });                
        handleSaveResults(results[0]);
        }
    }
    
    // Handle exceptions
    public class MetadataServiceExamplesException extends Exception { }
    
    // Creates metadata service. Ensure metadataservice class is present
    public static MetadataService.MetadataPort createService()
    {
        if(!Test.isRunningTest()){
        MetadataService.MetadataPort service = new MetadataService.MetadataPort();
        service.SessionHeader = new MetadataService.SessionHeader_element();
        service.SessionHeader.sessionId = UserInfo.getSessionId();
        return service;
        }else{
        return null;
        }
    }
    
    
    public static void handleSaveResults(MetadataService.UpsertResult saveResult) {
        if(saveResult==null || saveResult.success)
            return;
        // Construct error message and throw an exception
        if(saveResult.errors!=null) 
        {
            List<String> messages = new List<String>();
            messages.add(
                (saveResult.errors.size()==1 ? 'Error ' : 'Errors ') + 
                'occured processing component ' + saveResult.fullName + '.');
            for(MetadataService.Error error : saveResult.errors)
                messages.add(
                    error.message + ' (' + error.statusCode + ').' + 
                    ( error.fields!=null && error.fields.size()>0 ? 
                     ' Fields ' + String.join(error.fields, ',') + '.' : '' ) );
            if(messages.size()>0)
                throw new MetadataServiceExamplesException(String.join(messages, ' '));
        }
        if(!saveResult.success)
            throw new MetadataServiceExamplesException('Request failed with no specified error.');
    }    
}