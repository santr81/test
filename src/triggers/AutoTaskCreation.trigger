Trigger AutoTaskCreation on Contact(after insert, before update)
{ Task t;
    if (Trigger.old[0].email != null)
    { if (Trigger.old[0].email != '')
        {
          if ((Trigger.new[0].email != '') && (Trigger.old[0].email != Trigger.new[0].email))
          t = new task(OwnerId = UserInfo.getUserId(),Subject = Trigger.new[0].email,ActivityDate = system.today(),Status = 'Not Started');
          Insert t;
          system.debug('task '+ t.id);
          system.debug('User '+ UserInfo.getUserId());
        }
       
       else
       { if (Trigger.new[0].email != '')
           t= new task(OwnerId = UserInfo.getUserId(),Subject = Trigger.new[0].email,ActivityDate = system.today(),WhatId = Trigger.new[0].id,Status = 'Not Started');
           Insert t;
           system.debug(t.id);
       }
    
    
    }
}