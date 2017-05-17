@isTest
private class AnimalLocatorTest {

    @isTest static  void testGetAnimalNameById() {
        // Create the mock response based on a static resource
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());

        // Call method to test
        String animalName = AnimalLocator.getAnimalNameById(1);
        //System.debug(response.getBody());
        // Verify mock response is not null
        System.assertNotEquals(null,animalName,
            'blablabla.');
        // Verify status code
        System.assertNotEquals('',animalName,
          'The name is empty.');
        // Verify content type   
                    
         
        
        System.assertEquals('chicken', animalName,
          'We don\'t have a chicken.');          
    }   

}