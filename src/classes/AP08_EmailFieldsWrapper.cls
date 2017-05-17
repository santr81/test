/**     CREATED BY                  CREATED DATE        DESCRIRIPTION
        Ranjeet Singh Chouhan       02/22/2013          // Wrapper class to store email address fields information
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------                             
		UPDATED BY                  UPDATED DATE        DESCRIPTION
		
**/

global class AP08_EmailFieldsWrapper implements Comparable {
	
	public Boolean checked {get; set;}
    public String label {get; set;}
    public String apiName {get;set;}
    public String objectName {get; set;}
    public String rowBGStyle {get; set;}
    
    public AP08_EmailFieldsWrapper() {
        this.label = '';
        this.apiName = '';
        this.objectName = '';
        this.checked = false;
        this.rowBGStyle = 'background-color:#FFFFFF;';
    }
    
    public AP08_EmailFieldsWrapper(String label, String apiName, String objectName, Boolean checked) {
        this.label = label;
        this.apiName = apiName;
        this.objectName = objectName;
        this.checked = checked;
    }
	
	// This method is used by List.sort() method to sort remote site settings on name field
    global Integer compareTo(Object otherObj) {
        AP08_EmailFieldsWrapper otherRSSObj = (AP08_EmailFieldsWrapper)otherObj;
        if(this.objectName > otherRSSObj.objectName)
            return 1;
        else if(this.objectName < otherRSSObj.objectName)
            return -1;
        else
            return 0;
    }
    
}