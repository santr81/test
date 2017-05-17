public class Util_Test_Methods {
    private static final String USER_ALIAS = 'standt';
    private static final String USER_EMAIL = '@unitest.com';
    private static final String USER_UTF = 'UTF-8';
    private static final String USER_LNAME= 'UnitTest';
    private static final String USER_LAN_LOCALKEY= 'en_US';
    private static final String USER_TIMEZONEKEY= 'America/Los_Angeles';
    private static final String USER_PHONE = '1234567891';
    private static final String USER_MPHONE = '1111111111';
    
    
    public static Agile_Release__c createRelease(String releaseName){
        Agile_Release__c release = new Agile_Release__c();
        release.Name = releaseName;
        return release;
    }

    public static Agile_Milestone__c createMilesStone(String mileStoneName,String releaseId){
        Agile_Milestone__c mileStone = new Agile_Milestone__c();
        mileStone.Status__c = 'Red';
        mileStone.Start_Date__c = Date.today();
        mileStone.Planned_Start_Date__c = Date.today().addMonths(1);
        mileStone.Planned_End_Date__c = Date.today().addMonths(4);
        mileStone.Progress__c = 'Not Started';
        mileStone.Milestone_Name__c = mileStoneName;
        mileStone.Release__c = releaseId;
        return mileStone;
    }
    
    public static Agile_Sprint__c createSprint(String sprintName,String milestoneId){
        Agile_Sprint__c sprint = new Agile_Sprint__c();
        sprint.Name = sprintName;
        sprint.Milestone_Sprint__c = milestoneId;
        return sprint;
    }
    
    public static Agile_Feature__c createFeature(String featureName,String milestoneId,string description){
        Agile_Feature__c objFea = new Agile_Feature__c();
        objFea.Name = featureName;
        objFea.Milestone_Feature__c = milestoneId;
        objFea.Description__c = description;
        return objFea;
    }
    
     public static Agile_Story__c createstory(String storyName,String sprintId,string featureid){
        Agile_Story__c objStr = new Agile_Story__c();    
         objStr.Name = storyName;
         objStr.Sprint_Story__c = sprintId;
         objStr.Feature_Story__c = featureid;
         objStr.Release_Train__c = 'ReleaseTrain1';
         objstr.Team_Story__c = 'ReleaseTrain1Team1';
         objstr.Status__c = 'In Progress';
        return objStr;
    }
    
     public static AgileViewFilter__c createagileviewfilter(string Name,String Release,String Milestone,string Sprint,string user){
         AgileViewFilter__c avf = new AgileViewFilter__c();
                avf.Name = Name;
                avf.Release__c = Release;
                avf.MilesStone__c = Milestone;
                avf.Sprint__c = Sprint;
                avf.Status__c = 'In Progress';
                avf.Priority__c = 'High';
                avf.Owner__c = user;
                avf.StoryReleaseTrain__c = 'ReleaseTrain1';
                avf.StoryTeam__c = 'ReleaseTrain1Team1';
                return avf;
     }
       
    public static User createUser(String profileName, String uName){
        Profile prof = [select Id from Profile where Name =:profileName LIMIT 1];
        User newUser = new User(alias = USER_ALIAS, email=uName+USER_EMAIL, emailencodingkey=USER_UTF, lastname=USER_LNAME
                        , languagelocalekey=USER_LAN_LOCALKEY, localesidkey=USER_LAN_LOCALKEY, profileid = prof.Id, timezonesidkey=USER_TIMEZONEKEY
                        , username= uName+USER_EMAIL
                        , isActive=true);
        newUser.Phone = USER_PHONE;
        newUser.MobilePhone =USER_MPHONE; 
        return newUser;
    }
}