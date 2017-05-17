/**
  * @author       : Urmi Chatterjee
  * @date         : 22/11/2013
  * @description  : This class is a Utility class which consists of constants that are used
                    across the De-Duplication framework classes such as UTIL_DeDuper,
                    UTIL_PhoneticSearch, VFC_Merge, VFC_RuleCreateEditController and VFC_DuplicateSearch
  */


public with sharing class UTIL_DuplicateConstants {

    //Variables to hold Class constants
    public static final String EQUALS_OP = '=';
    public static final String EQUALS_TEXT = 'equals to';
    public static final String NOT_EQUALS_OP = '!=';
    public static final String NOT_EQUALS_TEXT = 'not equal to';
    public static final String LIKE_OP = 'LIKE';
    public static final String IN_OP = 'IN';
    public static final String NOT_IN_OP = 'NOT IN';
    public static final String AND_LOGIC_OP = 'AND';
    public static final String OR_LOGIC_OP = 'OR';
    public static final String NONE = '--None--';
    public static final String NEXT = 'NEXT';
    public static final String PREVIOUS = 'PREVIOUS';
    
    public static final String BLANK_SPACE = '';
    public static final String WIDE_BLANK_SPACE = ' ';
    public static final String COMMA = ',';
    public static final String APOSTROPHE = '\'';
    public static final String PERCENT = '%';
    public static final String OPEN_BRACKET = '(';
    public static final String CLOSE_BRACKET = ')';
    
    public static final String SELECT_STRING = 'SELECT';
    public static final String FROM_STRING = 'FROM';
    public static final String URL_PARAM = '&id_';
    public static final String URL_STRING = '/apex/VFP_Merge?obj=';
    
    public static final String NAME_FIELD ='Name';
    public static final String ID_FIELD = 'Id';
    public static final String CREATEDBYID_FIELD = 'CreatedById';
    public static final String CREATEDBY_LABEL = 'Created By';
    public static final String CUSTOM_SETTING_RECORD = 'DuplicateSearch';
    public static final String CUSTOM_SETTING_RECORD_LIMIT = 'RecordLimit';
    public static final String RECORD_SEARCH_TAB = 'recSrch';
    public static final String DUPLICATE_SEARCH_TAB = 'dupSrch';
    
    public static final String IN_ERROR_MSG = 'Please enter atleast 2 values seperated by comma(,) for comparison '+ 
                                              ' OR  a query that provides Id values for comparison';
    public static final String OP_BLANK_ERROR = 'Please select an operator';
    public static final String COMPVAL_BLANK_ERROR = 'Please enter a single value without comma(,) '+
                                                         'or apostrophe(;) for comparison';
    public static final String IN_LAST_OP_ERROR = 'Cannot have another clause for comparison after an \'IN\' clause';
    
    //   UTIL_DeDuper Class 
    public static final string ACTION_LOG_DUPLICATE = 'Log Duplicate';
    public static final String SEMI_COLON = ';';
    public static final String WHERE_STRING = ' WHERE ';
    public static final String EQUAL_STRING = ' = \'';
    public static final string DUPE_ERROR = 'Duplicate Record Exists. Following duplicates found : ';
    public static final String ANCHOR_START = '<a href=\'';
    public static final String ANCHOR_END = '\'>';
    public static final String ANCHOR_CLOSE = '</a> ; ';
    
    //  VFC_Merge 
    public static final String MASTER_KEY = '$MASTER$';
    public static final string OBJ_POSTFIX = '__c';
    public static final string OBJ = 'obj';
    public static final string HEADER = 'header';
    public static final string SEPARATOR = 'separator';
    public static final string MASTER_RECORD = 'Master Record';
    public static final string LASTMODIFIED_DATE = 'lastModifiedDate';
    public static final string LASTMODIFIEDBYID_FIELD = 'LastModifiedById';
    public static final string CREATEDBY = 'createdby';
    public static final string CREATED_DATE = 'createdDate';
    public static final string LASTMODIFIEDEDBY = 'lastModifiedBy';
    public static final string LASTMODIFIEDBY_LABEL = 'Last Modified By';
    public static final string STANDARD_FIELDS = 'Standard Fields';
    public static final string CUSTOM_FIELDS = 'Custom Fields';
    public static final string SYSTEM_FIELDS = 'System Fields';
    public static final string INVALID_OBJECT = 'Invalid Object';
    public static final string ID_ONE = 'id_1';
    public static final string ID_TWO = 'id_2';
    public static final string ID_THREE = 'id_3';
    public static final string ID_FOUR = 'id_4';
    public static final string ID_FIVE = 'id_5';
    public static final string MIN_RECORD_ERROR = 'Atleast Two Records Required For Merge';
    public static final string RECORD_LOCK_ERROR = 'Failed to lock all the records for merging.';
    public static final string MERGE_ERROR = 'Failed to merge the records : ';
    public static final string SAME_OBJ_ERROR = 'Only Records of same sObject can be merged';
    public static final string QUERY_ALL_ERROR = 'Failed to query all the selected records.';
    public static final string QUERY_DETAIL_ERROR = 'Failed to query record information :';
    public static final string RECORDID = 'recordId';
    public static final String NAME_COMMA ='.name,';
    public static final String SYSTEM_FIELDS_LIST = 'createdby.name, createddate, LastModifiedBy.name, LastModifiedDate';
    public static final String WHERE_CLAUSE = ' WHERE Id IN : recordIds';
    public static final String WHERE_CLAUSE_LOSER = ' WHERE Id IN : loserIds';
    public static final String SELECT_FROM = 'SELECT Id FROM ';
    public static final String WHERE_CLAUSE_LOCK = ' WHERE id IN : allRecords FOR UPDATE';
    public static final String SELECT_RECORD_INFO = ' Please select a master record for merging.';
    public static final string FORWARD_SLASH = '/';
    public static final string DOT_EXT = '...';
    public static final String SELECT_ID = 'SELECT Id ';
    public static final String SELECT_SUB= ',(SELECT ';
    public static final string NOTES = 'Notes';
    public static final string ATTACHMENTS = 'Attachments';
    
    //  VFC_RuleCreateEditController 
    public static final string ID = 'id';
    public static final string ACCOUNT_OBJ = 'Account';
    public static final string CONTACT_OBJ = 'Contact';
    public static final string CONTRACT_OBJ = 'Contract';
    public static final string OPPORTUNITY_OBJ = 'Opportunity';
    public static final string CAMPAIGN_OBJ = 'Campaign';
    public static final string CASE_OBJ = 'Case';
    public static final string SOLUTION_OBJ = 'Solution';
    public static final string CAMPAIGNMEMBER_OBJ = 'CampaignMember';
    public static final string TASK_OBJ = 'Task';
    public static final string EVENT_OBJ = 'Event';
    public static final string LEAD_OBJ = 'Lead';
    public static final string STRING_TYPE = 'STRING';
    public static final string PICKLIST_TYPE = 'PICKLIST';
    public static final string RULE_SAVE_ERROR = 'Error Saving Rule & Rule Criterias. Please Try Again.';
    public static final string SAVE_NEW_URL = '/apex/VFP_RuleCreateEdit';
    
    
    //  UTIL_PhoneticSearch 
    public static final String LETTER_C = 'C';
    public static final String LETTER_A = 'A';
    public static final String LETTER_E = 'E';
    public static final String LETTER_I = 'I';
    public static final String LETTER_O = 'O';
    public static final String LETTER_U = 'U';
    public static final String LETTER_B = 'B';
    public static final String LETTER_H = 'H';
    public static final String LETTER_K = 'K';
    public static final String LETTER_X = 'X';
    public static final String LETTER_S = 'S';
    public static final String LETTER_Y = 'Y';
    public static final String LETTER_D = 'D';
    public static final String LETTER_Q = 'Q';
    public static final String LETTER_T = 'T';
    public static final String LETTER_Z = 'Z';
    public static final String LETTER_M = 'M';
    public static final String LETTER_N = 'N';
    public static final String LETTER_V = 'V';
    public static final String LETTER_W = 'W';
    public static final String LETTER_R = 'R';
    public static final String LETTER_P = 'P';
    public static final String LETTER_J = 'J';
    public static final String LETTER_L = 'L';
    public static final String LETTER_F = 'F';
    public static final String LETTER_G = 'G';
    
    public static final String WORD_KN = 'KN';
    public static final String WORD_PN = 'PN';
    public static final String WORD_AE = 'AE';
    public static final String WORD_WR = 'WR';
    public static final String WORD_MB = 'MB';
    public static final String WORD_IA = 'IA';
    public static final String WORD_GE = 'GE';
    public static final String WORD_GY = 'GY';
    public static final String WORD_GI = 'GI';
    public static final String WORD_GN = 'GN';
    public static final String WORD_IO = 'IO';
    public static final String WORD_CH = 'CH';
    public static final String WORD_KS = 'KS';
    public static final String WORD_GNED = 'GNED';
    public static final String ZERO = '0';
    
}