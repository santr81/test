/**
  * @author        Urmi Chatterjee
  * @date          30/10/2013
  * @description   UTIL Class for creation of common Data used in Test Classes.
  */
  
public with sharing class UTIL_TestMethods{
    
    /**
      * @description       Method for defining User object record to be created for use in Test Class. 
      * @param             aliasId the Alias Id of the User record is to be created
      * @param             profileName the profile for which the User record is to be created
      * @return            User
      * @throws            NA
      */
    public static User runningUser(String aliasId, String profileName){
        Id profId = [SELECT Id FROM Profile WHERE Name=: profileName].Id;
        User userData = new User(FirstName=aliasId, LastName=aliasId, Alias=aliasId, IsActive=True, Email=aliasId+'@test.com',
                                 ProfileId=profId, Username=aliasId+'@test.com', EmailEncodingKey='UTF-8', CommunityNickname='Test',
                                 LanguageLocaleKey='en_US', LocaleSidKey='en_US', TimeZoneSidKey='GMT');
        return userData;
    }
    
    /**
      * @description       Method for setting the Custom Setting Value to display fixed records on a Visualforce page
                           for use in Test Class.
      * @param             custName the Custom Setting name
      * @param             num the number of records value
      * @return            void
      * @throws            NA
      */
    public static void createCustomSetting(String custName, Integer num){
        PaginationRecords__c noOfRecs = new PaginationRecords__c(Name=custName, NumberofRecords__c=num);
        insert noOfRecs;
    }
}