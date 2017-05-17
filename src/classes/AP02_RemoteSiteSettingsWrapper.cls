/**     CREATED BY                  CREATED DATE        DESCRIRIPTION
        Ranjeet Singh Chouhan       01/31/2013          Wrapper class to store remote site settings information
----------------------------------------------------------------------------------------------------------------                       
		UPDATED BY                  UPDATED DATE        DESCRIPTION
		
**/

global class AP02_RemoteSiteSettingsWrapper implements Comparable {
	
    public Boolean checked {get; set;}
    public String name {get; set;}
    public String url {get;set;}
    public Boolean disableProtocolSecurity {get; set;}
    public Boolean isActive {get; set;}
    
    public AP02_RemoteSiteSettingsWrapper() {
        this.name = '';
        this.url = '';
        this.checked = true;
        this.disableProtocolSecurity = false;
        this.isActive = false;
    }
    
    public AP02_RemoteSiteSettingsWrapper(String name, String url, Boolean disableProtocolSecurity, Boolean isActive, Boolean checked) {
        this.name = name;
        this.url = url;
        this.checked = checked;
        this.disableProtocolSecurity = disableProtocolSecurity;
        this.isActive = isActive;
    }
    
    // This method is used by List.sort() method to sort remote site settings on name field
    global Integer compareTo(Object otherObj) {
        AP02_RemoteSiteSettingsWrapper otherRSSObj = (AP02_RemoteSiteSettingsWrapper)otherObj;
        if(this.name > otherRSSObj.name)
            return 1;
        else if(this.name < otherRSSObj.name)
            return -1;
        else
            return 0;
    }

}