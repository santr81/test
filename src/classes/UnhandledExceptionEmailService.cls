/**
  * @author        Urmi Chatterjee
  * @date		   10/10/2013
  * @description   This Class is invoked in the event of an Email being sent due to an Unhandled Exception thrown by any running class and is used to call method from UTIL_LoggingService class to create the ExceptionLog__c record.
  */

global class UnhandledExceptionEmailService implements Messaging.InboundEmailHandler {
    
    /**
      * @description       This method fetches the Inbound email and calls the logUnhandledException method from UTIL_LoggingService class, passing it the email to log an ExceptionLog__c record.
      * @param             email A reference to the Messaging.InboundEmail object
      * @param             envelope A reference to the Messaging.InboundEnvelope object
      * @return            Messaging.InboundEmailResult
      * @throws 		   NA
      */
    global Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email, Messaging.InboundEnvelope envelope){
        Messaging.InboundEmailResult result = new Messaging.InboundEmailresult();        
        UTIL_LoggingService.logUnhandledException(email);
        return result;
    }
}