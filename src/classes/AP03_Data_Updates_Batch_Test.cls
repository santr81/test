@isTest
public class AP03_Data_Updates_Batch_Test {
	
   @testSetup static void data() {
       integer i=5;
       Contact c;
       list<Contact> clist = new list<contact>();
       for(i=5;i>=0;i--){
           c = new Contact();
           c.lastname='Alpha'+i;
           clist.add(c);
       }
       
       Test.startTest();
        insert clist;   
       Test.stopTest();
       
   }
    
   static testmethod void test() {
      
      Test.startTest();
	  List<string> strlist = new List<String>();
      strlist.add('email');
      list<AP03_Data_Updates_Batch> sample = new list<AP03_Data_Updates_Batch>();
      sample.add(new AP03_Data_Updates_Batch('Contact',strlist,'@test.com','@replace.com'));
      Database.executeBatch(new AP03_Data_Updates_Batch('Contact',strlist,'@test.com','@replace.com'));
       
      AP04_Data_Updates_Sch dataupdate = new AP04_Data_Updates_Sch();
   //   dataupdate.reschedulePostRefreshDataUpdates();
      dataupdate.resetWaitingTime();
   //   dataupdate.deleteEmailMaskingSchJobs();
      dataupdate.sendCompleteNotification();
      Test.stopTest();
   }
}