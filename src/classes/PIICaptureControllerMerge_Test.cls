@isTest
private class PIICaptureControllerMerge_Test {
    
    @testSetup static void testdata() {
       /* PIIMaster__c piidata = new PIIMaster__c();
        piidata.Field_Names__c ='BillingAddress,Name';
        piidata.Object_API_Name__c ='Account';
        piidata.PreferredDummyText__c = 'BillingAddress:Dummy Text,Name:a';*/
        
        PIIMaster__c piidata1 = new PIIMaster__c();
        piidata1.Field_Names__c ='Name,title';
        piidata1.Object_API_Name__c ='Contact';
        piidata1.PreferredDummyText__c = 'Name:a,title:mr';
        
        List<Account> acclist = new list<Account>();
        Account acc = new Account();
        acc.name='Account 1';
        acc.BillingPostalCode  = 'Street Address';
        acclist.add(acc);
        Account acc1 = new Account();
        acc1.name='Account 2';
        acc1.BillingPostalCode  = 'Street Address 2';
        acclist.add(acc1);
        
        Test.startTest();
       // insert piidata;
        insert piidata1;
        insert acclist;
        Test.stopTest();
    }
    
    @isTest static void testmaskdata() {
                
        map<string,string> fieldvaluepair = new map<string,string>();
        fieldvaluepair.put('name','test');
        maskPIIData pii = new maskPIIData('Account',fieldvaluepair);
        Database.executeBatch(new maskPIIData('Account',fieldvaluepair));
        pii.isNumberfield('Contact','email');

        
        PIICaptureControllerMerge  controller = new PIICaptureControllerMerge();
        
        controller.getAllObjects();
        controller.AllObjectsList ='Account';
        controller.getAllFields();
        controller.loadPiimaster();
        
        List<string> selectField = new List<string>();
        selectField.add('BilingPostalCode');
        selectField.add('BillingState');
        controller.CorrespondingFields= selectField;
        
        Pagereference p = controller.selectclick();
        
        List<string> unselectlist = new list<String>();
        unselectlist.add('BillingState');
        
        controller.rightselected = unselectlist;
        p = controller.unselectclick();
        
        List<selectoption> so = controller.getunSelectedValues();
        so=controller.getSelectedValues();
        controller.addfieldstothelist();
        pagereference pgref = controller.savePIIMaster();

        Test.startTest();     
        controller.doUpdateAll();
        controller.isNumberfield('Account', 'Name');
        controller.checkJobsStatus();
        Test.setCurrentPageReference(new PageReference('Page.PIICapture')); 
        System.currentPageReference().getParameters().put('Objectapiname', 'Contact');
        controller.doUpdate();
        Test.stopTest();
    }
    
}