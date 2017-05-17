@isTest
public class Teamview_Test {
    
public static testMethod void Teamview(){   
  
    Test.startTest();
        PageReference pageRef = Page.VFP_TeamView; 
        Test.setCurrentPage(pageRef);
        Cls_TeamView controller = new Cls_TeamView();
        controller.getTrainValues();
        controller.getTeamValues();
    Test.stopTest(); 
} 
}