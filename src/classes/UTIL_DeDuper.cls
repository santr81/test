/**
  * @author        Nandan Narasappa
  * @date          08/11/2013
  * @description   This class consists exclusively of static methods that operate on list
                   of sObject. It contains methods using phonetic and levenshtein algorithm
                   to find the duplicates for the sObject list based on the active rule on
                   the sObject, which return a map of sObject and list of duplicates. 
                   It also contains method using exact match to find the duplicates. Based on 
                   the action on the active rule, the duplicates will be logged in an 
                   intermediate table for 'Log Duplicate' and will prevent creation of 
                   record for 'Prevent' action.                                        
  */  
public with sharing class UTIL_DeDuper{   
    
    /**
      * @description       This method finds the duplicates for list of sObject based on the active
                           rule and its rule criterias using phonetic and levenshtein algorithm, 
                           which return a map of sObject and list of duplicates. In case of 'Prevent'
                           action on the active rule, error message will be displayed to the user with
                           the links to duplicate records. In case of 'Log Duplicate', duplicates will
                           be logged in an intermediate table.
      * @param             recordList     list of sobject record in context to find the duplicates against 
      * @return            Map<Id,List<sObject>>
      * @throws            Method might throw exception which is handled by try-catch block
      */    
    public static Map<Id,List<sObject>> findDuplicates(List<sObject> recordList){
            
        String objectType ; 
        List<sObject> duplicateRecords = new List<sObject>();   
        Set<Id> logRuleIdsSet = new Set<Id>();      
        Map<Id,List<sObject>> ruleDupeMap = new Map<Id,List<sObject>>();
        Map<Id,PotentialDuplicates__c> potDupeMap = new Map<Id,PotentialDuplicates__c>();           
        Map<Id,List<sObject>> dupeRecordsMap = new Map<Id,List<sObject>>();
        
        Savepoint sp = Database.setSavepoint();
        try{
            Map<Id,DuplicateLog__c> dupeLogMap = getDuplicateLogs(recordList);
            Map<String,List<Rule__c>> ruleMap = getActiveRules();
            List<DuplicateLog__c> dupeInsertList = new List<DuplicateLog__c>();
                
            for(sObject record : recordList){
                duplicateRecords.clear();                
                objectType = String.valueOf(record.getSObjectType());                 
                ruleDupeMap.putAll(fetchDuplicatesForActiveRules(record,ruleMap.get(objectType),logRuleIdsSet));   
                for(Id ruleId : ruleDupeMap.keyset()){
                    duplicateRecords.addALL(ruleDupeMap.get(ruleId));
                }      
                dupeRecordsMap.put(record.Id,duplicateRecords);                
                if(!logRuleIdsSet.isEmpty()){
                    potDupeMap = handleDuplicateLogs(dupeLogMap,record,dupeInsertList);
                }
                else{            
                    if(dupeRecordsMap.get(record.Id) != null && !dupeRecordsMap.get(record.Id).isEmpty() ){
                        record.addError(UTIL_DuplicateConstants.DUPE_ERROR + buildDuplicatesLink(dupeRecordsMap.get(record.Id)) ,false);
                    }
                }                   
            }
            if(!dupeInsertList.isEmpty()){
                handlePotentialDuplicates(dupeInsertList,potDupeMap,logRuleIdsSet,ruleDupeMap);       
            }
        }
        catch(Exception exp){
            Database.rollBack(sp);
        } 
        return dupeRecordsMap;
    }
    
    /**
      * @description       This method builds the URL to access list of duplicates in case of 'Prevent'
                           action on active rule, which returns the string of the links to duplicate
                           records. The returned string is used in the error message displayed to the user
                           for the possible duplicates for the record being created.
      * @param             dupeRecords     list of duplicates for the record in context
      * @return            String
      * @throws            NA
      */    
    public static String buildDuplicatesLink(List<sObject> dupeRecords){
        String link = UTIL_DuplicateConstants.ANCHOR_START + URL.getSalesforceBaseUrl().toExternalForm() + UTIL_DuplicateConstants.FORWARD_SLASH;
        String fullLink = link;
        for(sObject obj : dupeRecords){
            if(obj != null && !fullLink.contains(obj.id)){
                fullLink += obj.id + UTIL_DuplicateConstants.ANCHOR_END + 
                            obj.get(UTIL_DuplicateConstants.NAME_FIELD) + UTIL_DuplicateConstants.ANCHOR_CLOSE;
                fullLink += link;
            }
        }
        return fullLink;
    }
    
    /**
      * @description       This method queries all the DuplicateLogs available in the organization for 
                           the list of sObject, which returns the collection of duplicate logs.                       
      * @param             recordList    list of sobject record in context to find the duplicates against 
      * @return            Map<Id,DuplicateLog__c>
      * @throws            NA
      */    
    public static Map<Id,DuplicateLog__c> getDuplicateLogs(List<sObject> recordList){
        Set<String> recScope = new Set<String>();
        Map<Id,DuplicateLog__c> logMap = new Map<Id,DuplicateLog__c>(); 
        for(sObject rec : recordList){
            recScope.add(rec.Id);
        }
        for(DuplicateLog__c log : [SELECT RecordInScope__c,Object__c,
                                  (SELECT RulesFired__c,DuplicateLog__c,
                                   DuplicateLog__r.RecordInScope__c,DuplicateRecord__c
                                   FROM PotentialDuplicate__r) 
                                   FROM DuplicateLog__c WHERE RecordInScope__c IN: recScope ]){
            logMap.put(log.RecordInScope__c,log);        
        }        
        return logMap;
    }
    
    /**
      * @description       This method queries all the active rules available in the organization 
                           which returns the map of sObject name and the list of active rules for 
                           that sObject.                   
      * @param             NA
      * @return            Map<String,List<Rule__c>>
      * @throws            NA
      */    
    public static Map<String,List<Rule__c>> getActiveRules(){
        Map<String,List<Rule__c>> ruleMap = new Map<String,List<Rule__c>>();
        List<Rule__c> tmpRuleList = new List<Rule__c>();
        for(Rule__c rule : [SELECT Object__c,Action__c,IsActive__c,
                           (SELECT Field__c,IsFuzzy__c,IsPhonetic__c FROM RuleCriterias__r) 
                            FROM Rule__c WHERE IsActive__c = True]){
            if(ruleMap.keyset().contains(rule.Object__c)){
                tmpRuleList = ruleMap.get(rule.Object__c);
                tmpRuleList.add(rule);                
                ruleMap.put(rule.Object__c,tmpRuleList);                
            }
            else{
                ruleMap.put(rule.Object__c,new List<Rule__c>{rule});                
            }                     
        }        
        return ruleMap ;
    }
    
    /**
      * @description       This method queries the duplicates for the sObject based on the active
                           rule and its rule criterias using phonetic and levenshtein algorithm, 
                           which return a map of sObject and list of duplicates. It also populates
                           the set with rules for which the duplicates will be logged.                   
      * @param             record                 record in context to find the duplicates against
      * @param             ruleList               List of active rules for the sobject type
      * @param             logRuleIdsSet          set of active rules for which duplicates will be logged
      * @return            Map<Id,List<sObject>>
      * @throws            NA
      */    
    public static Map<Id,List<sObject>> fetchDuplicatesForActiveRules(sObject record,List<Rule__c> ruleList,Set<Id> logRuleIdsSet){
		Boolean isFuzzy = false;
		Boolean isPhonetic = false;
		Set<Id> dupeIdsSet = new Set<Id>();
		List<sObject> dupeRecords = new List<sObject>();
		Map<Id,sObject> dupeExactMap = new Map<Id,sObject>();
		Map<Id,sObject> dupePhoneticMap = new Map<Id,sObject>();
		Map<Id,sObject> dupeFuzzyMap = new Map<Id,sObject>();
		Map<Id,List<sObject>> ruleDupeMap = new Map<Id,List<sObject>>();
		List<RuleCriteria__c> phoneticCriterias = new List<RuleCriteria__c>();
		List<RuleCriteria__c> fuzzyCriterias = new List<RuleCriteria__c>();
		List<RuleCriteria__c> exactCriterias = new List<RuleCriteria__c>();
		Integer preventCount = 0;
		for(Rule__c rule: ruleList){
			phoneticCriterias.clear();
			fuzzyCriterias.clear();
			exactCriterias.clear();
			dupeRecords.clear();
			if(UTIL_DuplicateConstants.ACTION_LOG_DUPLICATE.equalsIgnoreCase(rule.Action__c)){
				logRuleIdsSet.add(rule.Id);
			}
			else{
				preventCount ++;
			}
			for(RuleCriteria__c criteria : rule.RuleCriterias__r){
				if(criteria.isPhonetic__c && criteria.isFuzzy__c){
					isPhonetic = true;
					isFuzzy = true;
					phoneticCriterias.add(criteria);
					fuzzyCriterias.add(criteria);				
				}
				else if(criteria.isPhonetic__c){
					isPhonetic = true;
					phoneticCriterias.add(criteria);
				}
				else if(criteria.isFuzzy__c){
					isFuzzy = true;
					fuzzyCriterias.add(criteria);				
				}
				else{
					exactCriterias.add(criteria);				
				}
			} 
			if(!exactCriterias.isEmpty()){
				dupeExactMap = findExactDuplicates(record,exactCriterias);
			}
			if(!phoneticCriterias.isEmpty()){
				dupePhoneticMap = findDuplicatesByPhonetic(record,phoneticCriterias);
			}
			if(!fuzzyCriterias.isEmpty()){
				dupeFuzzyMap = findDuplicatesByFuzzyLogic(record,fuzzyCriterias);
			}
			dupeIdsSet.addALL(dupeExactMap.keyset());            
			if(dupeIdsSet.isEmpty() && isPhonetic){
				dupeIdsSet.addAll(dupePhoneticMap.keyset());                      
			}
			else if(isPhonetic){
				dupeIdsSet.retainAll(dupePhoneticMap.keyset());
			}
			if(dupeIdsSet.isEmpty() && isFuzzy){
				dupeIdsSet.addAll(dupeFuzzyMap.keyset());   
			}
			else if(isFuzzy){
				dupeIdsSet.retainAll(dupeFuzzyMap.keyset());
			}
			List<sObject> tmpRecords = new List<sObject>();
			for(Id recId : dupeIdsSet){            
				tmpRecords.add(dupePhoneticMap.get(recId) != null ? dupePhoneticMap.get(recId) : 
								dupeExactMap.get(recId) != null ? dupeExactMap.get(recId) : dupeFuzzyMap.get(recId) );    
			} 
			dupeRecords = tmpRecords;   
			ruleDupeMap.put(rule.id,dupeRecords);
		} 
		if(preventCount > 0 ){
			logRuleIdsSet.clear();
		}       
		return ruledupeMap;
	}
    
    /**
      * @description       This method creates an map of record id in context and the potential duplicate
                           instance of DuplicateLogs and potential duplicates to be created, which is returned
                           to findDuplicates method for DML. It also creates an instance of Duplicate log
                           if it doesn't exist in  the org.
      * @param             dupeLogMap                        map of record with its duplicate logs 
      * @param             record                            record in context for which duplicates need to be found
      * @param             dupeInsertList                    list of duplicate logs to be created
      * @return            Map<Id,PotentialDuplicates__c>
      * @throws            NA
      */    
    public static Map<Id,PotentialDuplicates__c> handleDuplicateLogs(Map<Id,DuplicateLog__c> dupeLogMap,sObject record,List<DuplicateLog__c> dupeInsertList){
        DuplicateLog__c log = new DuplicateLog__c();
        Map<Id,PotentialDuplicates__c> potDupeMap = new Map<Id,PotentialDuplicates__c>();
        if(dupeLogMap.get(record.Id) != null){               
            for(PotentialDuplicates__c dupe : dupeLogMap.get(record.Id).PotentialDuplicate__r){
                potDupeMap.put(dupe.DuplicateRecord__c,dupe );    
            }     
        }
        else{
            if(record.id != null){
                log = new DuplicateLog__c();
                log.RecordInScope__c = record.Id;
                log.Object__c = String.valueOf(record.getsObjectType());
                dupeInsertList.add(log);                
            }
        }
        return potDupeMap;
    }
    
    /**
      * @description       This method creates an map of record id in context and the potential duplicate
                           instance of DuplicateLogs and potential duplicates, updates existing potential
                           duplicate incase of for same rule and the record new duplicate is found.                    
      * @param             dupeInsertList        list of duplicate logs to be created
      * @param             potDupeMap            map of potential duplicate record with record id in context
      * @param             logRuleIdsSet         set of rules for duplicates to be logged
      * @param             ruleDupeMap           map of duplicates for the rule fired 
      * @return            void
      * @throws            NA
      */    
    public static void handlePotentialDuplicates(List<DuplicateLog__c> dupeInsertList,Map<Id,PotentialDuplicates__c> potDupeMap,Set<Id> logRuleIdsSet,Map<Id,List<sObject>> ruleDupeMap){
        PotentialDuplicates__c potDupe = null;
        Database.SaveResult[] saveResults = Database.insert(dupeInsertList,false);        
        for(Database.SaveResult result : saveResults){
            if(result.isSuccess()){
                for(Id ruleId : logRuleIdsSet){
                    for(sObject obj : ruleDupeMap.get(ruleId)){
                        if(potDupeMap.keyset().contains(obj.id)){
                            potDupe = potDupeMap.get(obj.id);
                            if(!potDupe.RulesFired__c.contains(ruleId)){
                                potDupe.RulesFired__c += ruleId + UTIL_DuplicateConstants.SEMI_COLON;
                            }
                            potDupeMap.put(obj.Id,potDupe);
                        }
                        else{
                            potDupe = new PotentialDuplicates__c(DuplicateLog__c = result.getId(),DuplicateRecord__c = obj.Id,
                                                                 RulesFired__c = ruleId + UTIL_DuplicateConstants.SEMI_COLON);
                            potDupeMap.put(obj.Id,potDupe);
                        }
                    }
                }                    
            }
        }        
        Database.upsertResult[] saveResult = Database.upsert(potDupeMap.values(),true);        
    }
    
    /**
      * @description       This method finds the duplicates for an sObject based on the rule criterias
                           for the active rule using the exact value of the field in rule criteria, which
                           returns the map of duplicate record to findDuplicates method. 
      * @param             record        sobject record in context to find the duplicates against    
      * @param             criteriaList  list of rule criteria on sObject to find the exact match for the record in context
      * @return            Map<Id,sObject>
      * @throws            NA
      */    
	public static Map<Id,sObject> findExactDuplicates(sObject record,List<RuleCriteria__c> criteriaList){		
		String qString = UTIL_DuplicateConstants.SELECT_STRING + UTIL_DuplicateConstants.WIDE_BLANK_SPACE ;	
		for(RuleCriteria__c criteria : criteriaList){
			qString += criteria.Field__c + UTIL_DuplicateConstants.COMMA ;
		}
		if(!qString.containsIgnoreCase(UTIL_DuplicateConstants.NAME_FIELD)){
			qString += UTIL_DuplicateConstants.NAME_FIELD + UTIL_DuplicateConstants.COMMA;		
		}
		qString = qString.substring(0,qString.lastIndexOf(UTIL_DuplicateConstants.COMMA));
		
		qString += 	UTIL_DuplicateConstants.WIDE_BLANK_SPACE + UTIL_DuplicateConstants.FROM_STRING +
					UTIL_DuplicateConstants.WIDE_BLANK_SPACE + String.valueOf(record.getSObjectType()) +
					UTIL_DuplicateConstants.WIDE_BLANK_SPACE +  UTIL_DuplicateConstants.WHERE_STRING ;
					
		for(RuleCriteria__c criteria : criteriaList){
			qString += UTIL_DuplicateConstants.WIDE_BLANK_SPACE + criteria.Field__c + UTIL_DuplicateConstants.EQUAL_STRING +
					   record.get(criteria.Field__c) + UTIL_DuplicateConstants.APOSTROPHE + UTIL_DuplicateConstants.WIDE_BLANK_SPACE + 
					   UTIL_DuplicateConstants.AND_LOGIC_OP ;
		}
		qString +=  UTIL_DuplicateConstants.WIDE_BLANK_SPACE + UTIL_DuplicateConstants.ID_FIELD +
				    UTIL_DuplicateConstants.NOT_EQUALS_OP + UTIL_DuplicateConstants.APOSTROPHE + 
					record.id  + UTIL_DuplicateConstants.APOSTROPHE;         
		Map<Id,sObject> dupeMap = new Map<Id,sObject>(Database.query(qString));
		return dupeMap ;
	}
    
    /**
      * @description       This method queries all the records for the sObject, converts the field value in
                           the rule criteria to phonetic code using Metaphone algorithm by calling convertCode
                           method from UTIL_PhoneticSearch; checks the value with the record for which duplicates
                           need to be found, creates a map of it and returned to findDuplicates method.
      * @param             record           sobject record in context to find the duplicates against 
      * @param             criteriaList     list of rule criteria on sObject to find the phonetic match for the record in context
      * @return            Map<Id,sObject>
      * @throws            NA
      */  
    public static Map<Id,sObject> findDuplicatesByPhonetic(sObject record,List<RuleCriteria__c> criteriaList){
		Integer count ;
		String fieldName;
		String phoneticValue ;	
		Map<Id,sObject> dupeMap = new Map<Id,sObject>();	
		Map<String,String> fieldValMap = new Map<String,String>();
		String qString = UTIL_DuplicateConstants.SELECT_STRING + UTIL_DuplicateConstants.WIDE_BLANK_SPACE ;
		for(RuleCriteria__c criteria: criteriaList){
			fieldName = criteria.Field__c;
			phoneticValue = UTIL_PhoneticSearch.convertToCode((String)record.get(fieldName)); 	
			fieldValMap.put(fieldName,phoneticValue);
			qString += fieldName + UTIL_DuplicateConstants.COMMA;
		} 
		if(!fieldValMap.keyset().contains(UTIL_DuplicateConstants.NAME_FIELD)){
			qString += UTIL_DuplicateConstants.NAME_FIELD + UTIL_DuplicateConstants.COMMA;		
		}   
		qString = qString.substring(0,qString.lastIndexOf(UTIL_DuplicateConstants.COMMA));
		qString += 	UTIL_DuplicateConstants.WIDE_BLANK_SPACE + UTIL_DuplicateConstants.FROM_STRING +
					UTIL_DuplicateConstants.WIDE_BLANK_SPACE + String.valueOf(record.getSObjectType()) +
					UTIL_DuplicateConstants.WIDE_BLANK_SPACE + UTIL_DuplicateConstants.WHERE_STRING + 
				    UTIL_DuplicateConstants.WIDE_BLANK_SPACE + UTIL_DuplicateConstants.ID_FIELD + 
				    UTIL_DuplicateConstants.NOT_EQUALS_OP + UTIL_DuplicateConstants.APOSTROPHE + 
				    record.id  + UTIL_DuplicateConstants.APOSTROPHE;    
		
		for(sObject objRecord : Database.query(qString)){    
			String convertedCode = UTIL_DuplicateConstants.BLANK_SPACE;
			count = 0;
			for(String field : fieldValMap.keyset()){
				convertedCode = UTIL_PhoneticSearch.convertToCode((String)objRecord.get(field));
				if(convertedCode.equalsIgnoreCase(fieldValMap.get(field))){
					count ++;
				}
				else{
					break;
				}
			}
			if(count == fieldValMap.size()){
				dupeMap.put(objRecord.id,objRecord);
			}			         
		}     
		return dupeMap ;
	}
    
    /**
      * @description       This method queries all the records for the sObject, finds duplicates using
                           levenshtein distance algorithm for the field in rule criteria with a threhold
                           of 2 (Defined in the Custom Label - LEVENSHTEIN_THRESHOLD), which means insertion
                           or deletion or substitution of 2 characters to the value of the field; returns
                           a map of duplicates to findDuplicates method.       
      * @param             record        sobject record in context to find the duplicates against 
      * @param             criteriaList  list of rule criteria on sObject to find the fuzzy match for the record in context
      * @return            Map<Id,sObject>
      * @throws            NA
      */ 
    public static Map<Id,sObject> findDuplicatesByFuzzyLogic(sObject record,List<RuleCriteria__c> criteriaList){
		Integer count ;
		String fieldName ;
		String fieldValue ;
		Map<String,String> fieldValMap = new Map<String,String>();
		Map<Id,sObject> dupeMap = new Map<Id,sObject>();
		String qString = UTIL_DuplicateConstants.SELECT_STRING + UTIL_DuplicateConstants.WIDE_BLANK_SPACE ;
		for(RuleCriteria__c criteria: criteriaList){
			fieldName = criteria.Field__c;
			fieldValue = (String)record.get(fieldName);	
			fieldValMap.put(fieldName,fieldValue);
			qString += fieldName + UTIL_DuplicateConstants.COMMA;
		}
		if(!fieldValMap.keyset().contains(UTIL_DuplicateConstants.NAME_FIELD)){
			qString += UTIL_DuplicateConstants.NAME_FIELD + UTIL_DuplicateConstants.COMMA;		
		}
		qString = qString.substring(0,qString.lastIndexOf(UTIL_DuplicateConstants.COMMA));
		qString += 	UTIL_DuplicateConstants.WIDE_BLANK_SPACE + UTIL_DuplicateConstants.FROM_STRING +
					UTIL_DuplicateConstants.WIDE_BLANK_SPACE + String.valueOf(record.getSObjectType()) +
					UTIL_DuplicateConstants.WIDE_BLANK_SPACE + UTIL_DuplicateConstants.WHERE_STRING + 
				    UTIL_DuplicateConstants.WIDE_BLANK_SPACE + UTIL_DuplicateConstants.ID_FIELD + 
				    UTIL_DuplicateConstants.NOT_EQUALS_OP + UTIL_DuplicateConstants.APOSTROPHE + 
				    record.id  + UTIL_DuplicateConstants.APOSTROPHE;    
	
		for(sObject objRecord : Database.query(qString)){
			count = 0;
			for(String field : fieldValMap.keyset()){
				String fieldVal = fieldValMap.get(field);
				if(fieldVal != null && 
				   fieldVal.getLevenshteinDistance((String)objRecord.get(field)) <= Integer.ValueOf(Label.LEVENSHTEIN_THRESHOLD)){
					count ++;
				}
				else{
					break;
				}
			}		
			if(count == fieldValMap.size()){
				dupeMap.put(objRecord.id,objRecord);
			}		
		}
		return dupeMap ;
	}
}