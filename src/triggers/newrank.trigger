trigger newrank on Agile_Story__c (before insert, before update) {

List<RecordType> rtypes = [Select Name, Id From RecordType 
                  where sObjectType='Agile_Story__c' and isActive=true];
List<Agile_Story__c> ContactIds = new list <Agile_Story__c>();

    Map<decimal, Agile_Story__c> ContactMap = new Map<decimal, Agile_Story__c>();
    //Map<String, Agile_Story__c> LastNameMap = new Map<String, Agile_Story__c>();
    Map<String, Agile_Story__c> contactRecordTypes = new Map<String, Agile_Story__c>{};
     

system.debug('RTMap: ' + contactrecordtypes);
    for (Agile_Story__c C : System.Trigger.new) {
    
        // Make sure we don't treat an email address that
        // isn't changing during an update as a duplicate.
        if ((C.Rank__c != null) && ((System.Trigger.isInsert ) || (C.Rank__c != System.Trigger.oldMap.get(C.Id).Rank__c) || 
        (C.Sprint_Story__c != System.Trigger.oldMap.get(C.Id).Sprint_Story__c) )
         ){
    system.debug('Contact Email: ' + C.Rank__c);
    system.debug('Contact RT: ' + C.Sprint_Story__c);
   
            // Make sure another new Contact isn't also a duplicate
            if (ContactMap.containsKey(C.Rank__c) & contactrecordtypes.containsKey(C.Sprint_Story__c) ) {
                C.Rank__c.addError('Another new Contact in your business has the same email address and last name. ID = ' + C.Sprint_Story__c);
            } else {
                ContactMap.put(C.Rank__c, C);
                contactrecordtypes.put(C.Sprint_Story__c, C);
                //LastNameMap.put(C.LastName, C);
                system.debug('ContactMap: ' + ContactMap);
               // system.debug('LastNameMap: ' + LastNameMap);
                
            }
        }
    }
    
    // Using a single database query, find all the Contacts in
    // the database that have the same email address as any
    // of the Contacts being inserted or updated.
    for (Agile_Story__c contact : [SELECT Name, Sprint_Story__c, Rank__c FROM Agile_Story__c WHERE Rank__c IN : ContactMap.KeySet() 
        AND (Sprint_Story__c IN:  contactrecordtypes.KeySet())
        ])
       {
        Agile_Story__c NewContact = ContactMap.get(contact.Rank__c);
        
        
        system.debug('Contact: ' + NewContact);
                  NewContact.Rank__c.addError('A Agile Story with this Sprint and Rank already exists. Story = ' + Contact.Name);
    }
    
}