@isTest
private class ParkLocatorTest {
    @isTest static void testCallout() {              
        // This causes a fake response to be generated
        System.Test.setMock(WebServiceMock.class, new ParkServiceMock());
        String[] test = ParkLocator.country('Rome');
        String[] res = new String[]{'none'}; 
        System.assertEquals(res, test);
    }
}