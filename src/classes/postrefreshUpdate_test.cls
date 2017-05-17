@isTest(SeeAllData=true)
public class postrefreshUpdate_test{

    static testmethod void test() {

        postrefreshUpdate testupdate = new postrefreshUpdate();
        testupdate.CustomLabelUpdate('Test');
        testupdate.UpdateCustomLabel('10161000009ztsN');
        testupdate.UpdateNamedCredentials();
        testupdate.UpdateRemoteSiteSettings();
    }
}