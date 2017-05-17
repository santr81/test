public class MetadataService {
    
    public class DomainWhitelist {
        public String[] domain;
        private String[] domain_type_info = new String[]{'domain','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'domain'};
    }
    
    public class SaveResult {
        public MetadataService.Error[] errors;
        public String fullName;
        public Boolean success;
        private String[] errors_type_info = new String[]{'errors','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
        private String[] fullName_type_info = new String[]{'fullName','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] success_type_info = new String[]{'success','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'errors','fullName','success'};
    }
    public class SessionSettings {
        public Boolean disableTimeoutWarning;
        public Boolean enableCSPOnEmail;
        public Boolean enableCSRFOnGet;
        public Boolean enableCSRFOnPost;
        public Boolean enableCacheAndAutocomplete;
        public Boolean enableClickjackNonsetupSFDC;
        public Boolean enableClickjackNonsetupUser;
        public Boolean enableClickjackNonsetupUserHeaderless;
        public Boolean enableClickjackSetup;
        public Boolean enablePostForSessions;
        public Boolean enableSMSIdentity;
        public Boolean enforceIpRangesEveryRequest;
        public Boolean forceLogoutOnSessionTimeout;
        public Boolean forceRelogin;
        public Boolean lockSessionsToDomain;
        public Boolean lockSessionsToIp;
        public String logoutURL;
        public Boolean securityCentralKillSession;
        public String sessionTimeout;
        private String[] disableTimeoutWarning_type_info = new String[]{'disableTimeoutWarning','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] enableCSPOnEmail_type_info = new String[]{'enableCSPOnEmail','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] enableCSRFOnGet_type_info = new String[]{'enableCSRFOnGet','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] enableCSRFOnPost_type_info = new String[]{'enableCSRFOnPost','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] enableCacheAndAutocomplete_type_info = new String[]{'enableCacheAndAutocomplete','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] enableClickjackNonsetupSFDC_type_info = new String[]{'enableClickjackNonsetupSFDC','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] enableClickjackNonsetupUser_type_info = new String[]{'enableClickjackNonsetupUser','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] enableClickjackNonsetupUserHeaderless_type_info = new String[]{'enableClickjackNonsetupUserHeaderless','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] enableClickjackSetup_type_info = new String[]{'enableClickjackSetup','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] enablePostForSessions_type_info = new String[]{'enablePostForSessions','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] enableSMSIdentity_type_info = new String[]{'enableSMSIdentity','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] enforceIpRangesEveryRequest_type_info = new String[]{'enforceIpRangesEveryRequest','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] forceLogoutOnSessionTimeout_type_info = new String[]{'forceLogoutOnSessionTimeout','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] forceRelogin_type_info = new String[]{'forceRelogin','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] lockSessionsToDomain_type_info = new String[]{'lockSessionsToDomain','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] lockSessionsToIp_type_info = new String[]{'lockSessionsToIp','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] logoutURL_type_info = new String[]{'logoutURL','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] securityCentralKillSession_type_info = new String[]{'securityCentralKillSession','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] sessionTimeout_type_info = new String[]{'sessionTimeout','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'disableTimeoutWarning','enableCSPOnEmail','enableCSRFOnGet','enableCSRFOnPost','enableCacheAndAutocomplete','enableClickjackNonsetupSFDC','enableClickjackNonsetupUser','enableClickjackNonsetupUserHeaderless','enableClickjackSetup','enablePostForSessions','enableSMSIdentity','enforceIpRangesEveryRequest','forceLogoutOnSessionTimeout','forceRelogin','lockSessionsToDomain','lockSessionsToIp','logoutURL','securityCentralKillSession','sessionTimeout'};
    }
    
    public class readMetadataResponse_element {
        public MetadataService.ReadResult result;
        private String[] result_type_info = new String[]{'result','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'result'};
    }
    
    public class FieldValue {
        public String name;
        public String value;
        private String[] name_type_info = new String[]{'name','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] value_type_info = new String[]{'value','http://soap.sforce.com/2006/04/metadata',null,'1','1','true'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'name','value'};
    }
    
    public class UpsertResult {
        public Boolean created;
        public MetadataService.Error[] errors;
        public String fullName;
        public Boolean success;
        private String[] created_type_info = new String[]{'created','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] errors_type_info = new String[]{'errors','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
        private String[] fullName_type_info = new String[]{'fullName','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] success_type_info = new String[]{'success','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'created','errors','fullName','success'};
    }

    public class CustomDataTypeComponent {
        public String developerSuffix;
        public Boolean enforceFieldRequiredness;
        public String label;
        public Integer length;
        public Integer precision;
        public Integer scale;
        public String sortOrder;
        public Integer sortPriority;
        public String type_x;
        private String[] developerSuffix_type_info = new String[]{'developerSuffix','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] enforceFieldRequiredness_type_info = new String[]{'enforceFieldRequiredness','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] label_type_info = new String[]{'label','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] length_type_info = new String[]{'length','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] precision_type_info = new String[]{'precision','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] scale_type_info = new String[]{'scale','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] sortOrder_type_info = new String[]{'sortOrder','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] sortPriority_type_info = new String[]{'sortPriority','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] type_x_type_info = new String[]{'type','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'developerSuffix','enforceFieldRequiredness','label','length','precision','scale','sortOrder','sortPriority','type_x'};
    }
    
    public class retrieve_element {
        public MetadataService.RetrieveRequest retrieveRequest;
        private String[] retrieveRequest_type_info = new String[]{'retrieveRequest','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'retrieveRequest'};
    }
    
    public class DeleteResult {
        public MetadataService.Error[] errors;
        public String fullName;
        public Boolean success;
        private String[] errors_type_info = new String[]{'errors','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
        private String[] fullName_type_info = new String[]{'fullName','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] success_type_info = new String[]{'success','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'errors','fullName','success'};
    }
    
    public class ProfileApplicationVisibility {
        public String application;
        public Boolean default_x;
        public Boolean visible;
        private String[] application_type_info = new String[]{'application','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] default_x_type_info = new String[]{'default','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] visible_type_info = new String[]{'visible','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'application','default_x','visible'};
    }
    
    public class RelatedListItem {
        public String[] customButtons;
        public String[] excludeButtons;
        public String[] fields;
        public String relatedList;
        public String sortField;
        public String sortOrder;
        private String[] customButtons_type_info = new String[]{'customButtons','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
        private String[] excludeButtons_type_info = new String[]{'excludeButtons','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
        private String[] fields_type_info = new String[]{'fields','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
        private String[] relatedList_type_info = new String[]{'relatedList','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] sortField_type_info = new String[]{'sortField','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] sortOrder_type_info = new String[]{'sortOrder','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'customButtons','excludeButtons','fields','relatedList','sortField','sortOrder'};
    }
    
    public class PackageVersion {
        public Integer majorNumber;
        public Integer minorNumber;
        public String namespace;
        private String[] majorNumber_type_info = new String[]{'majorNumber','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] minorNumber_type_info = new String[]{'minorNumber','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] namespace_type_info = new String[]{'namespace','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'majorNumber','minorNumber','namespace'};
    }
    public class DescribeMetadataObject {
        public String[] childXmlNames;
        public String directoryName;
        public Boolean inFolder;
        public Boolean metaFile;
        public String suffix;
        public String xmlName;
        private String[] childXmlNames_type_info = new String[]{'childXmlNames','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
        private String[] directoryName_type_info = new String[]{'directoryName','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] inFolder_type_info = new String[]{'inFolder','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] metaFile_type_info = new String[]{'metaFile','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] suffix_type_info = new String[]{'suffix','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] xmlName_type_info = new String[]{'xmlName','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'childXmlNames','directoryName','inFolder','metaFile','suffix','xmlName'};
    }
    
    public class AllOrNoneHeader_element {
        public Boolean allOrNone;
        private String[] allOrNone_type_info = new String[]{'allOrNone','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'allOrNone'};
    }
   
    public class listMetadata_element {
        public MetadataService.ListMetadataQuery[] queries;
        public Double asOfVersion;
        private String[] queries_type_info = new String[]{'queries','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
        private String[] asOfVersion_type_info = new String[]{'asOfVersion','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'queries','asOfVersion'};
    }
   
    public class ActionOverride {
        public String actionName;
        public String comment;
        public String content;
        public String formFactor;
        public Boolean skipRecordTypeSelect;
        public String type_x;
        private String[] actionName_type_info = new String[]{'actionName','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] comment_type_info = new String[]{'comment','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] content_type_info = new String[]{'content','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] formFactor_type_info = new String[]{'formFactor','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] skipRecordTypeSelect_type_info = new String[]{'skipRecordTypeSelect','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] type_x_type_info = new String[]{'type','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'actionName','comment','content','formFactor','skipRecordTypeSelect','type_x'};
    }
    
    public class CustomApplicationComponents {
        public String alignment;
        public String[] customApplicationComponent;
        private String[] alignment_type_info = new String[]{'alignment','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] customApplicationComponent_type_info = new String[]{'customApplicationComponent','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'alignment','customApplicationComponent'};
    }
    
    public class NamedCredential extends Metadata {
        public String type = 'NamedCredential';
        public String fullName;
        private String[] fullName_type_info = new String[]{'fullName','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        public String authProvider;
        public String certificate;
        public String endpoint;
        public String label;
        public String oauthRefreshToken;
        public String oauthScope;
        public String oauthToken;
        public String password;
        public String principalType;
        public String protocol;
        public String username;
        private String[] authProvider_type_info = new String[]{'authProvider','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] certificate_type_info = new String[]{'certificate','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] endpoint_type_info = new String[]{'endpoint','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] label_type_info = new String[]{'label','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] oauthRefreshToken_type_info = new String[]{'oauthRefreshToken','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] oauthScope_type_info = new String[]{'oauthScope','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] oauthToken_type_info = new String[]{'oauthToken','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] password_type_info = new String[]{'password','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] principalType_type_info = new String[]{'principalType','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] protocol_type_info = new String[]{'protocol','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] username_type_info = new String[]{'username','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] type_att_info = new String[]{'xsi:type'};
        private String[] field_order_type_info = new String[]{'fullName', 'authProvider','certificate','endpoint','label','oauthRefreshToken','oauthScope','oauthToken','password','principalType','protocol','username'};
    }
    
    public class ObjectNameCaseValue {
        public String article;
        public String caseType;
        public Boolean plural;
        public String possessive;
        public String value;
        private String[] article_type_info = new String[]{'article','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] caseType_type_info = new String[]{'caseType','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] plural_type_info = new String[]{'plural','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] possessive_type_info = new String[]{'possessive','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] value_type_info = new String[]{'value','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'article','caseType','plural','possessive','value'};
    }

    public class State {
        public Boolean active;
        public String integrationValue;
        public String isoCode;
        public String label;
        public Boolean standard;
        public Boolean visible;
        private String[] active_type_info = new String[]{'active','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] integrationValue_type_info = new String[]{'integrationValue','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] isoCode_type_info = new String[]{'isoCode','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] label_type_info = new String[]{'label','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] standard_type_info = new String[]{'standard','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] visible_type_info = new String[]{'visible','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'active','integrationValue','isoCode','label','standard','visible'};
    }
    
    public class describeValueTypeResponse_element {
        public MetadataService.DescribeValueTypeResult result;
        private String[] result_type_info = new String[]{'result','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'result'};
    }
    
    public class CustomMetadata extends Metadata {
        public String type = 'CustomMetadata';
        public String fullName;
        private String[] fullName_type_info = new String[]{'fullName','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        public String description;
        public String label;
        public Boolean protected_x;
        public MetadataService.CustomMetadataValue[] values;
        private String[] description_type_info = new String[]{'description','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] label_type_info = new String[]{'label','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] protected_x_type_info = new String[]{'protected','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] values_type_info = new String[]{'values','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] type_att_info = new String[]{'xsi:type'};
        private String[] field_order_type_info = new String[]{'fullName', 'description','label','protected_x','values'};
    }
    
    public class FileProperties {
        public String createdById;
        public String createdByName;
        public DateTime createdDate;
        public String fileName;
        public String fullName;
        public String id;
        public String lastModifiedById;
        public String lastModifiedByName;
        public DateTime lastModifiedDate;
        public String manageableState;
        public String namespacePrefix;
        public String type_x;
        private String[] createdById_type_info = new String[]{'createdById','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] createdByName_type_info = new String[]{'createdByName','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] createdDate_type_info = new String[]{'createdDate','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] fileName_type_info = new String[]{'fileName','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] fullName_type_info = new String[]{'fullName','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] id_type_info = new String[]{'id','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] lastModifiedById_type_info = new String[]{'lastModifiedById','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] lastModifiedByName_type_info = new String[]{'lastModifiedByName','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] lastModifiedDate_type_info = new String[]{'lastModifiedDate','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] manageableState_type_info = new String[]{'manageableState','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] namespacePrefix_type_info = new String[]{'namespacePrefix','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] type_x_type_info = new String[]{'type','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'createdById','createdByName','createdDate','fileName','fullName','id','lastModifiedById','lastModifiedByName','lastModifiedDate','manageableState','namespacePrefix','type_x'};
    }

    public class FilterItem {
        public String field;
        public String operation;
        public String value;
        public String valueField;
        private String[] field_type_info = new String[]{'field','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] operation_type_info = new String[]{'operation','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] value_type_info = new String[]{'value','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] valueField_type_info = new String[]{'valueField','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'field','operation','value','valueField'};
    }
    
    public class deployResponse_element {
        public MetadataService.AsyncResult result;
        private String[] result_type_info = new String[]{'result','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'result'};
    }
   
    public class DebuggingInfo_element {
        public String debugLog;
        private String[] debugLog_type_info = new String[]{'debugLog','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'debugLog'};
    }
    
    public class CustomLabels extends Metadata {
        public String type = 'CustomLabels';
        public String fullName;
        private String[] fullName_type_info = new String[]{'fullName','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        public MetadataService.CustomLabel[] labels;
        private String[] labels_type_info = new String[]{'labels','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] type_att_info = new String[]{'xsi:type'};
        private String[] field_order_type_info = new String[]{'fullName', 'labels'};
    }
  
    public class RunTestsResult {
        public String apexLogId;
        public MetadataService.CodeCoverageResult[] codeCoverage;
        public MetadataService.CodeCoverageWarning[] codeCoverageWarnings;
        public MetadataService.RunTestFailure[] failures;
        public Integer numFailures;
        public Integer numTestsRun;
        public MetadataService.RunTestSuccess[] successes;
        public Double totalTime;
        private String[] apexLogId_type_info = new String[]{'apexLogId','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] codeCoverage_type_info = new String[]{'codeCoverage','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
        private String[] codeCoverageWarnings_type_info = new String[]{'codeCoverageWarnings','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
        private String[] failures_type_info = new String[]{'failures','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
        private String[] numFailures_type_info = new String[]{'numFailures','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] numTestsRun_type_info = new String[]{'numTestsRun','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] successes_type_info = new String[]{'successes','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
        private String[] totalTime_type_info = new String[]{'totalTime','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'apexLogId','codeCoverage','codeCoverageWarnings','failures','numFailures','numTestsRun','successes','totalTime'};
    }
    
    public class DeployDetails {
        public MetadataService.DeployMessage[] componentFailures;
        public MetadataService.DeployMessage[] componentSuccesses;
        public MetadataService.RetrieveResult retrieveResult;
        public MetadataService.RunTestsResult runTestResult;
        private String[] componentFailures_type_info = new String[]{'componentFailures','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
        private String[] componentSuccesses_type_info = new String[]{'componentSuccesses','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
        private String[] retrieveResult_type_info = new String[]{'retrieveResult','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] runTestResult_type_info = new String[]{'runTestResult','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'componentFailures','componentSuccesses','retrieveResult','runTestResult'};
    }
    
    
    public class SessionHeader_element {
        public String sessionId;
        private String[] sessionId_type_info = new String[]{'sessionId','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'sessionId'};
    }
    
    
    public class deployRecentValidationResponse_element {
        public String result;
        private String[] result_type_info = new String[]{'result','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'result'};
    }
    public class IpRange {
        public String description;
        public String end_x;
        public String start;
        private String[] description_type_info = new String[]{'description','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] end_x_type_info = new String[]{'end','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] start_type_info = new String[]{'start','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'description','end_x','start'};
    }
    public class deployRecentValidation_element {
        public String validationId;
        private String[] validationId_type_info = new String[]{'validationId','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'validationId'};
    }
    
    public class Profile extends Metadata {
        public String type = 'Profile';
        public String fullName;
        private String[] fullName_type_info = new String[]{'fullName','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        public MetadataService.ProfileApplicationVisibility[] applicationVisibilities;
        public MetadataService.ProfileApexClassAccess[] classAccesses;
        public Boolean custom;
        public MetadataService.ProfileCustomPermissions[] customPermissions;
        public String description;
        public MetadataService.ProfileExternalDataSourceAccess[] externalDataSourceAccesses;
        public MetadataService.ProfileFieldLevelSecurity[] fieldPermissions;
        public MetadataService.ProfileLayoutAssignment[] layoutAssignments;
        public MetadataService.ProfileLoginHours loginHours;
        public MetadataService.ProfileLoginIpRange[] loginIpRanges;
        public MetadataService.ProfileObjectPermissions[] objectPermissions;
        public MetadataService.ProfileApexPageAccess[] pageAccesses;
        public MetadataService.ProfileRecordTypeVisibility[] recordTypeVisibilities;
        public MetadataService.ProfileTabVisibility[] tabVisibilities;
        public String userLicense;
        public MetadataService.ProfileUserPermission[] userPermissions;
        private String[] applicationVisibilities_type_info = new String[]{'applicationVisibilities','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
        private String[] classAccesses_type_info = new String[]{'classAccesses','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
        private String[] custom_type_info = new String[]{'custom','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] customPermissions_type_info = new String[]{'customPermissions','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
        private String[] description_type_info = new String[]{'description','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] externalDataSourceAccesses_type_info = new String[]{'externalDataSourceAccesses','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
        private String[] fieldPermissions_type_info = new String[]{'fieldPermissions','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
        private String[] layoutAssignments_type_info = new String[]{'layoutAssignments','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
        private String[] loginHours_type_info = new String[]{'loginHours','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] loginIpRanges_type_info = new String[]{'loginIpRanges','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
        private String[] objectPermissions_type_info = new String[]{'objectPermissions','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
        private String[] pageAccesses_type_info = new String[]{'pageAccesses','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
        private String[] recordTypeVisibilities_type_info = new String[]{'recordTypeVisibilities','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
        private String[] tabVisibilities_type_info = new String[]{'tabVisibilities','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
        private String[] userLicense_type_info = new String[]{'userLicense','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] userPermissions_type_info = new String[]{'userPermissions','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] type_att_info = new String[]{'xsi:type'};
        private String[] field_order_type_info = new String[]{'fullName', 'applicationVisibilities','classAccesses','custom','customPermissions','description','externalDataSourceAccesses','fieldPermissions','layoutAssignments','loginHours','loginIpRanges','objectPermissions','pageAccesses','recordTypeVisibilities','tabVisibilities','userLicense','userPermissions'};
    }
    
    public class ArticleTypeChannelDisplay {
        public MetadataService.ArticleTypeTemplate[] articleTypeTemplates;
        private String[] articleTypeTemplates_type_info = new String[]{'articleTypeTemplates','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'articleTypeTemplates'};
    }
    public class ArticleTypeTemplate {
        public String channel;
        public String page_x;
        public String template;
        private String[] channel_type_info = new String[]{'channel','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] page_x_type_info = new String[]{'page','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] template_type_info = new String[]{'template','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'channel','page_x','template'};
    }
    public class DeployOptions {
        public Boolean allowMissingFiles;
        public Boolean autoUpdatePackage;
        public Boolean checkOnly;
        public Boolean ignoreWarnings;
        public Boolean performRetrieve;
        public Boolean purgeOnDelete;
        public Boolean rollbackOnError;
        public String[] runTests;
        public Boolean singlePackage;
        public String testLevel;
        private String[] allowMissingFiles_type_info = new String[]{'allowMissingFiles','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] autoUpdatePackage_type_info = new String[]{'autoUpdatePackage','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] checkOnly_type_info = new String[]{'checkOnly','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] ignoreWarnings_type_info = new String[]{'ignoreWarnings','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] performRetrieve_type_info = new String[]{'performRetrieve','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] purgeOnDelete_type_info = new String[]{'purgeOnDelete','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] rollbackOnError_type_info = new String[]{'rollbackOnError','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] runTests_type_info = new String[]{'runTests','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
        private String[] singlePackage_type_info = new String[]{'singlePackage','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] testLevel_type_info = new String[]{'testLevel','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'allowMissingFiles','autoUpdatePackage','checkOnly','ignoreWarnings','performRetrieve','purgeOnDelete','rollbackOnError','runTests','singlePackage','testLevel'};
    }
    public class FieldSet extends Metadata {
        public String type = 'FieldSet';
        public String fullName;
        private String[] fullName_type_info = new String[]{'fullName','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        public MetadataService.FieldSetItem[] availableFields;
        public String description;
        public MetadataService.FieldSetItem[] displayedFields;
        public String label;
        private String[] availableFields_type_info = new String[]{'availableFields','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
        private String[] description_type_info = new String[]{'description','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] displayedFields_type_info = new String[]{'displayedFields','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
        private String[] label_type_info = new String[]{'label','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] type_att_info = new String[]{'xsi:type'};
        private String[] field_order_type_info = new String[]{'fullName', 'availableFields','description','displayedFields','label'};
    }
    public class ProfileLoginHours {
        public String fridayEnd;
        public String fridayStart;
        public String mondayEnd;
        public String mondayStart;
        public String saturdayEnd;
        public String saturdayStart;
        public String sundayEnd;
        public String sundayStart;
        public String thursdayEnd;
        public String thursdayStart;
        public String tuesdayEnd;
        public String tuesdayStart;
        public String wednesdayEnd;
        public String wednesdayStart;
        private String[] fridayEnd_type_info = new String[]{'fridayEnd','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] fridayStart_type_info = new String[]{'fridayStart','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] mondayEnd_type_info = new String[]{'mondayEnd','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] mondayStart_type_info = new String[]{'mondayStart','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] saturdayEnd_type_info = new String[]{'saturdayEnd','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] saturdayStart_type_info = new String[]{'saturdayStart','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] sundayEnd_type_info = new String[]{'sundayEnd','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] sundayStart_type_info = new String[]{'sundayStart','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] thursdayEnd_type_info = new String[]{'thursdayEnd','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] thursdayStart_type_info = new String[]{'thursdayStart','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] tuesdayEnd_type_info = new String[]{'tuesdayEnd','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] tuesdayStart_type_info = new String[]{'tuesdayStart','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] wednesdayEnd_type_info = new String[]{'wednesdayEnd','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] wednesdayStart_type_info = new String[]{'wednesdayStart','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'fridayEnd','fridayStart','mondayEnd','mondayStart','saturdayEnd','saturdayStart','sundayEnd','sundayStart','thursdayEnd','thursdayStart','tuesdayEnd','tuesdayStart','wednesdayEnd','wednesdayStart'};
    }
    
    public class RetrieveRequest {
        public Double apiVersion;
        public String[] packageNames;
        public Boolean singlePackage;
        public String[] specificFiles;
        public MetadataService.Package_x unpackaged;
        private String[] apiVersion_type_info = new String[]{'apiVersion','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] packageNames_type_info = new String[]{'packageNames','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
        private String[] singlePackage_type_info = new String[]{'singlePackage','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] specificFiles_type_info = new String[]{'specificFiles','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
        private String[] unpackaged_type_info = new String[]{'unpackaged','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'apiVersion','packageNames','singlePackage','specificFiles','unpackaged'};
    }
    public class ObjectRelationship {
        public MetadataService.ObjectRelationship join_x;
        public Boolean outerJoin;
        public String relationship;
        private String[] join_x_type_info = new String[]{'join','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] outerJoin_type_info = new String[]{'outerJoin','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] relationship_type_info = new String[]{'relationship','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'join_x','outerJoin','relationship'};
    }

    public class CompactLayout extends Metadata {
        public String type = 'CompactLayout';
        public String fullName;
        private String[] fullName_type_info = new String[]{'fullName','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        public String[] fields;
        public String label;
        private String[] fields_type_info = new String[]{'fields','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
        private String[] label_type_info = new String[]{'label','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] type_att_info = new String[]{'xsi:type'};
        private String[] field_order_type_info = new String[]{'fullName', 'fields','label'};
    }
    public class VisualizationType {
        public String description;
        public String developerName;
        public String icon;
        public String masterLabel;
        public String scriptBootstrapMethod;
        private String[] description_type_info = new String[]{'description','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] developerName_type_info = new String[]{'developerName','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] icon_type_info = new String[]{'icon','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] masterLabel_type_info = new String[]{'masterLabel','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] scriptBootstrapMethod_type_info = new String[]{'scriptBootstrapMethod','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'description','developerName','icon','masterLabel','scriptBootstrapMethod'};
    }
    
    public class AuthProvider extends Metadata {
        public String type = 'AuthProvider';
        public String fullName;
        private String[] fullName_type_info = new String[]{'fullName','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        public String authorizeUrl;
        public String consumerKey;
        public String consumerSecret;
        public String customMetadataTypeRecord;
        public String defaultScopes;
        public String errorUrl;
        public String executionUser;
        public String friendlyName;
        public String iconUrl;
        public String idTokenIssuer;
        public Boolean includeOrgIdInIdentifier;
        public String logoutUrl;
        public String plugin;
        public String portal;
        public String providerType;
        public String registrationHandler;
        public Boolean sendAccessTokenInHeader;
        public Boolean sendClientCredentialsInHeader;
        public String tokenUrl;
        public String userInfoUrl;
        private String[] authorizeUrl_type_info = new String[]{'authorizeUrl','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] consumerKey_type_info = new String[]{'consumerKey','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] consumerSecret_type_info = new String[]{'consumerSecret','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] customMetadataTypeRecord_type_info = new String[]{'customMetadataTypeRecord','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] defaultScopes_type_info = new String[]{'defaultScopes','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] errorUrl_type_info = new String[]{'errorUrl','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] executionUser_type_info = new String[]{'executionUser','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] friendlyName_type_info = new String[]{'friendlyName','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] iconUrl_type_info = new String[]{'iconUrl','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] idTokenIssuer_type_info = new String[]{'idTokenIssuer','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] includeOrgIdInIdentifier_type_info = new String[]{'includeOrgIdInIdentifier','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] logoutUrl_type_info = new String[]{'logoutUrl','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] plugin_type_info = new String[]{'plugin','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] portal_type_info = new String[]{'portal','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] providerType_type_info = new String[]{'providerType','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] registrationHandler_type_info = new String[]{'registrationHandler','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] sendAccessTokenInHeader_type_info = new String[]{'sendAccessTokenInHeader','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] sendClientCredentialsInHeader_type_info = new String[]{'sendClientCredentialsInHeader','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] tokenUrl_type_info = new String[]{'tokenUrl','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] userInfoUrl_type_info = new String[]{'userInfoUrl','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] type_att_info = new String[]{'xsi:type'};
        private String[] field_order_type_info = new String[]{'fullName', 'authorizeUrl','consumerKey','consumerSecret','customMetadataTypeRecord','defaultScopes','errorUrl','executionUser','friendlyName','iconUrl','idTokenIssuer','includeOrgIdInIdentifier','logoutUrl','plugin','portal','providerType','registrationHandler','sendAccessTokenInHeader','sendClientCredentialsInHeader','tokenUrl','userInfoUrl'};
    }
    
    public class CustomMetadataValue {
        public String field;
        public String value;
        private String[] field_type_info = new String[]{'field','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] value_type_info = new String[]{'value','http://soap.sforce.com/2006/04/metadata',null,'1','1','true'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'field','value'};
    }
    
    public class AsyncResult {
        public Boolean done;
        public String id;
        public String message;
        public String state;
        public String statusCode;
        private String[] done_type_info = new String[]{'done','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] id_type_info = new String[]{'id','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] message_type_info = new String[]{'message','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] state_type_info = new String[]{'state','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] statusCode_type_info = new String[]{'statusCode','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'done','id','message','state','statusCode'};
    }
    public class XOrgHub extends Metadata {
        public String type = 'XOrgHub';
        public String fullName;
        private String[] fullName_type_info = new String[]{'fullName','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        public String label;
        public Boolean lockSharedObjects;
        public String[] permissionSets;
        public MetadataService.XOrgHubSharedObject[] sharedObjects;
        private String[] label_type_info = new String[]{'label','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] lockSharedObjects_type_info = new String[]{'lockSharedObjects','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] permissionSets_type_info = new String[]{'permissionSets','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
        private String[] sharedObjects_type_info = new String[]{'sharedObjects','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] type_att_info = new String[]{'xsi:type'};
        private String[] field_order_type_info = new String[]{'fullName', 'label','lockSharedObjects','permissionSets','sharedObjects'};
    }
    public class CustomLabel extends Metadata {
        public String type = 'CustomLabel';
        public String fullName;
        private String[] fullName_type_info = new String[]{'fullName','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        public String categories;
        public String language;
        public Boolean protected_x;
        public String shortDescription;
        public String value;
        private String[] categories_type_info = new String[]{'categories','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] language_type_info = new String[]{'language','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] protected_x_type_info = new String[]{'protected','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] shortDescription_type_info = new String[]{'shortDescription','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] value_type_info = new String[]{'value','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] type_att_info = new String[]{'xsi:type'};
        private String[] field_order_type_info = new String[]{'fullName', 'categories','language','protected_x','shortDescription','value'};
    }
    public class NameSettings extends Metadata {
        public String type = 'NameSettings';
        public String fullName;
        private String[] fullName_type_info = new String[]{'fullName','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        public Boolean enableMiddleName;
        public Boolean enableNameSuffix;
        private String[] enableMiddleName_type_info = new String[]{'enableMiddleName','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] enableNameSuffix_type_info = new String[]{'enableNameSuffix','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] type_att_info = new String[]{'xsi:type'};
        private String[] field_order_type_info = new String[]{'fullName', 'enableMiddleName','enableNameSuffix'};
    }
    
    public class checkRetrieveStatusResponse_element {
        public MetadataService.RetrieveResult result;
        private String[] result_type_info = new String[]{'result','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'result'};
    }
    
    public class ConnectedAppIpRange {
        public String description;
        public String end_x;
        public String start;
        private String[] description_type_info = new String[]{'description','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] end_x_type_info = new String[]{'end','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] start_type_info = new String[]{'start','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'description','end_x','start'};
    }
    
    public class retrieveResponse_element {
        public MetadataService.AsyncResult result;
        private String[] result_type_info = new String[]{'result','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'result'};
    }
    
    public class ApprovalSubmitter {
        public String submitter;
        public String type_x;
        private String[] submitter_type_info = new String[]{'submitter','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] type_x_type_info = new String[]{'type','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'submitter','type_x'};
    }
    
    public class upsertMetadataResponse_element {
        public MetadataService.UpsertResult[] result;
        private String[] result_type_info = new String[]{'result','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'result'};
    }
    
    public class cancelDeploy_element {
        public String String_x;
        private String[] String_x_type_info = new String[]{'String','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'String_x'};
    }
    
    
    public class RunTestFailure {
        public String id;
        public String message;
        public String methodName;
        public String name;
        public String namespace;
        public String packageName;
        public Boolean seeAllData;
        public String stackTrace;
        public Double time_x;
        public String type_x;
        private String[] id_type_info = new String[]{'id','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] message_type_info = new String[]{'message','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] methodName_type_info = new String[]{'methodName','http://soap.sforce.com/2006/04/metadata',null,'1','1','true'};
        private String[] name_type_info = new String[]{'name','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] namespace_type_info = new String[]{'namespace','http://soap.sforce.com/2006/04/metadata',null,'1','1','true'};
        private String[] packageName_type_info = new String[]{'packageName','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] seeAllData_type_info = new String[]{'seeAllData','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] stackTrace_type_info = new String[]{'stackTrace','http://soap.sforce.com/2006/04/metadata',null,'1','1','true'};
        private String[] time_x_type_info = new String[]{'time','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] type_x_type_info = new String[]{'type','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'id','message','methodName','name','namespace','packageName','seeAllData','stackTrace','time_x','type_x'};
    }
    public class PermissionSetApexClassAccess {
        public String apexClass;
        public Boolean enabled;
        private String[] apexClass_type_info = new String[]{'apexClass','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] enabled_type_info = new String[]{'enabled','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'apexClass','enabled'};
    }
    public class CustomTab extends Metadata {
        public String type = 'CustomTab';
        public String fullName;
        private String[] fullName_type_info = new String[]{'fullName','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        public String auraComponent;
        public Boolean customObject;
        public String description;
        public String flexiPage;
        public Integer frameHeight;
        public Boolean hasSidebar;
        public String icon;
        public String label;
        public Boolean mobileReady;
        public String motif;
        public String page_x;
        public String scontrol;
        public String splashPageLink;
        public String url;
        public String urlEncodingKey;
        private String[] auraComponent_type_info = new String[]{'auraComponent','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] customObject_type_info = new String[]{'customObject','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] description_type_info = new String[]{'description','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] flexiPage_type_info = new String[]{'flexiPage','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] frameHeight_type_info = new String[]{'frameHeight','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] hasSidebar_type_info = new String[]{'hasSidebar','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] icon_type_info = new String[]{'icon','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] label_type_info = new String[]{'label','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] mobileReady_type_info = new String[]{'mobileReady','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] motif_type_info = new String[]{'motif','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] page_x_type_info = new String[]{'page','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] scontrol_type_info = new String[]{'scontrol','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] splashPageLink_type_info = new String[]{'splashPageLink','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] url_type_info = new String[]{'url','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] urlEncodingKey_type_info = new String[]{'urlEncodingKey','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] type_att_info = new String[]{'xsi:type'};
        private String[] field_order_type_info = new String[]{'fullName', 'auraComponent','customObject','description','flexiPage','frameHeight','hasSidebar','icon','label','mobileReady','motif','page_x','scontrol','splashPageLink','url','urlEncodingKey'};
    }
   
    public class ProfileTabVisibility {
        public String tab;
        public String visibility;
        private String[] tab_type_info = new String[]{'tab','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] visibility_type_info = new String[]{'visibility','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'tab','visibility'};
    }
   
    public class LookupFilter {
        public Boolean active;
        public String booleanFilter;
        public String description;
        public String errorMessage;
        public MetadataService.FilterItem[] filterItems;
        public String infoMessage;
        public Boolean isOptional;
        private String[] active_type_info = new String[]{'active','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] booleanFilter_type_info = new String[]{'booleanFilter','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] description_type_info = new String[]{'description','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] errorMessage_type_info = new String[]{'errorMessage','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] filterItems_type_info = new String[]{'filterItems','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
        private String[] infoMessage_type_info = new String[]{'infoMessage','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] isOptional_type_info = new String[]{'isOptional','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'active','booleanFilter','description','errorMessage','filterItems','infoMessage','isOptional'};
    }
    
    public class Error {
        public String[] fields;
        public String message;
        public String statusCode;
        private String[] fields_type_info = new String[]{'fields','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
        private String[] message_type_info = new String[]{'message','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] statusCode_type_info = new String[]{'statusCode','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'fields','message','statusCode'};
    }
    public class Territory2RuleItem {
        public String field;
        public String operation;
        public String value;
        private String[] field_type_info = new String[]{'field','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] operation_type_info = new String[]{'operation','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] value_type_info = new String[]{'value','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'field','operation','value'};
    }
    
    public class updateMetadata_element {
        public MetadataService.Metadata[] metadata;
        private String[] metadata_type_info = new String[]{'metadata','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'metadata'};
    }
    public class AccountSettings extends Metadata {
        public String type = 'AccountSettings';
        public String fullName;
        private String[] fullName_type_info = new String[]{'fullName','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        public Boolean enableAccountOwnerReport;
        public Boolean enableAccountTeams;
        public Boolean enableSharedContacts;
        public Boolean showViewHierarchyLink;
        private String[] enableAccountOwnerReport_type_info = new String[]{'enableAccountOwnerReport','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] enableAccountTeams_type_info = new String[]{'enableAccountTeams','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] enableSharedContacts_type_info = new String[]{'enableSharedContacts','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] showViewHierarchyLink_type_info = new String[]{'showViewHierarchyLink','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] type_att_info = new String[]{'xsi:type'};
        private String[] field_order_type_info = new String[]{'fullName', 'enableAccountOwnerReport','enableAccountTeams','enableSharedContacts','showViewHierarchyLink'};
    }
    public class CancelDeployResult {
        public Boolean done;
        public String id;
        private String[] done_type_info = new String[]{'done','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] id_type_info = new String[]{'id','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'done','id'};
    }
    
    public class DashboardFilterColumn {
        public String column;
        private String[] column_type_info = new String[]{'column','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'column'};
    }
    
    public class PlatformActionListItem {
        public String actionName;
        public String actionType;
        public Integer sortOrder;
        public String subtype;
        private String[] actionName_type_info = new String[]{'actionName','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] actionType_type_info = new String[]{'actionType','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] sortOrder_type_info = new String[]{'sortOrder','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] subtype_type_info = new String[]{'subtype','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'actionName','actionType','sortOrder','subtype'};
    }
    public class CallOptions_element {
        public String client;
        private String[] client_type_info = new String[]{'client','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'client'};
    }
    public class ApprovalEntryCriteria {
        public String booleanFilter;
        public MetadataService.FilterItem[] criteriaItems;
        public String formula;
        private String[] booleanFilter_type_info = new String[]{'booleanFilter','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] criteriaItems_type_info = new String[]{'criteriaItems','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
        private String[] formula_type_info = new String[]{'formula','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'booleanFilter','criteriaItems','formula'};
    }
    
    public class upsertMetadata_element {
        public MetadataService.Metadata[] metadata;
        private String[] metadata_type_info = new String[]{'metadata','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'metadata'};
    }
    public class ProfileExternalDataSourceAccess {
        public Boolean enabled;
        public String externalDataSource;
        private String[] enabled_type_info = new String[]{'enabled','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] externalDataSource_type_info = new String[]{'externalDataSource','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'enabled','externalDataSource'};
    }
    public class ValueTypeField {
        public MetadataService.ValueTypeField[] fields;
        public String[] foreignKeyDomain;
        public Boolean isForeignKey;
        public Boolean isNameField;
        public Integer minOccurs;
        public String name;
        public MetadataService.PicklistEntry[] picklistValues;
        public String soapType;
        public Boolean valueRequired;
        private String[] fields_type_info = new String[]{'fields','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
        private String[] foreignKeyDomain_type_info = new String[]{'foreignKeyDomain','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
        private String[] isForeignKey_type_info = new String[]{'isForeignKey','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] isNameField_type_info = new String[]{'isNameField','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] minOccurs_type_info = new String[]{'minOccurs','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] name_type_info = new String[]{'name','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] picklistValues_type_info = new String[]{'picklistValues','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
        private String[] soapType_type_info = new String[]{'soapType','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] valueRequired_type_info = new String[]{'valueRequired','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'fields','foreignKeyDomain','isForeignKey','isNameField','minOccurs','name','picklistValues','soapType','valueRequired'};
    }
    
    public class renameMetadata_element {
        public String type_x;
        public String oldFullName;
        public String newFullName;
        private String[] type_x_type_info = new String[]{'type','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] oldFullName_type_info = new String[]{'oldFullName','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] newFullName_type_info = new String[]{'newFullName','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'type_x','oldFullName','newFullName'};
    }
    
    public class PicklistValue extends Metadata {
        public String type = 'PicklistValue';
        public String fullName;
        private String[] fullName_type_info = new String[]{'fullName','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        public Boolean allowEmail;
        public Boolean closed;
        public String color;
        public String[] controllingFieldValues;
        public Boolean converted;
        public Boolean cssExposed;
        public Boolean default_x;
        public String description;
        public String forecastCategory;
        public Boolean highPriority;
        public Integer probability;
        public String reverseRole;
        public Boolean reviewed;
        public Boolean won;
        private String[] allowEmail_type_info = new String[]{'allowEmail','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] closed_type_info = new String[]{'closed','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] color_type_info = new String[]{'color','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] controllingFieldValues_type_info = new String[]{'controllingFieldValues','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
        private String[] converted_type_info = new String[]{'converted','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] cssExposed_type_info = new String[]{'cssExposed','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] default_x_type_info = new String[]{'default','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] description_type_info = new String[]{'description','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] forecastCategory_type_info = new String[]{'forecastCategory','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] highPriority_type_info = new String[]{'highPriority','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] probability_type_info = new String[]{'probability','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] reverseRole_type_info = new String[]{'reverseRole','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] reviewed_type_info = new String[]{'reviewed','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] won_type_info = new String[]{'won','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] type_att_info = new String[]{'xsi:type'};
        private String[] field_order_type_info = new String[]{'fullName', 'allowEmail','closed','color','controllingFieldValues','converted','cssExposed','default_x','description','forecastCategory','highPriority','probability','reverseRole','reviewed','won'};
    }
    
    public virtual class Metadata {
        public String fullName;
    }
    public class DebuggingHeader_element {
        public MetadataService.LogInfo[] categories;
        public String debugLevel;
        private String[] categories_type_info = new String[]{'categories','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
        private String[] debugLevel_type_info = new String[]{'debugLevel','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'categories','debugLevel'};
    }
    public class ApprovalPageField {
        public String[] field;
        private String[] field_type_info = new String[]{'field','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'field'};
    }
    public class PermissionSetApexPageAccess {
        public String apexPage;
        public Boolean enabled;
        private String[] apexPage_type_info = new String[]{'apexPage','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] enabled_type_info = new String[]{'enabled','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'apexPage','enabled'};
    }
    
    public class describeMetadata_element {
        public Double asOfVersion;
        private String[] asOfVersion_type_info = new String[]{'asOfVersion','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'asOfVersion'};
    }
    
    public class RunTestSuccess {
        public String id;
        public String methodName;
        public String name;
        public String namespace;
        public Boolean seeAllData;
        public Double time_x;
        private String[] id_type_info = new String[]{'id','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] methodName_type_info = new String[]{'methodName','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] name_type_info = new String[]{'name','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] namespace_type_info = new String[]{'namespace','http://soap.sforce.com/2006/04/metadata',null,'1','1','true'};
        private String[] seeAllData_type_info = new String[]{'seeAllData','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] time_x_type_info = new String[]{'time','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'id','methodName','name','namespace','seeAllData','time_x'};
    }
    public class PermissionSetExternalDataSourceAccess {
        public Boolean enabled;
        public String externalDataSource;
        private String[] enabled_type_info = new String[]{'enabled','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] externalDataSource_type_info = new String[]{'externalDataSource','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'enabled','externalDataSource'};
    }
    public class CustomDataType extends Metadata {
        public String type = 'CustomDataType';
        public String fullName;
        private String[] fullName_type_info = new String[]{'fullName','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        public MetadataService.CustomDataTypeComponent[] customDataTypeComponents;
        public String description;
        public String displayFormula;
        public Boolean editComponentsOnSeparateLines;
        public String label;
        public Boolean rightAligned;
        public Boolean supportComponentsInReports;
        private String[] customDataTypeComponents_type_info = new String[]{'customDataTypeComponents','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
        private String[] description_type_info = new String[]{'description','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] displayFormula_type_info = new String[]{'displayFormula','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] editComponentsOnSeparateLines_type_info = new String[]{'editComponentsOnSeparateLines','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] label_type_info = new String[]{'label','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] rightAligned_type_info = new String[]{'rightAligned','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] supportComponentsInReports_type_info = new String[]{'supportComponentsInReports','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] type_att_info = new String[]{'xsi:type'};
        private String[] field_order_type_info = new String[]{'fullName', 'customDataTypeComponents','description','displayFormula','editComponentsOnSeparateLines','label','rightAligned','supportComponentsInReports'};
    }
    
    public class ListMetadataQuery {
        public String folder;
        public String type_x;
        private String[] folder_type_info = new String[]{'folder','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] type_x_type_info = new String[]{'type','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'folder','type_x'};
    }
    public class LogInfo {
        public String category;
        public String level;
        private String[] category_type_info = new String[]{'category','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] level_type_info = new String[]{'level','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'category','level'};
    }
   
    public class ProfileLayoutAssignment {
        public String layout;
        public String recordType;
        private String[] layout_type_info = new String[]{'layout','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] recordType_type_info = new String[]{'recordType','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'layout','recordType'};
    }
    
    
    public class createMetadataResponse_element {
        public MetadataService.SaveResult[] result;
        private String[] result_type_info = new String[]{'result','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'result'};
    }
    
    public class CodeCoverageResult {
        public MetadataService.CodeLocation[] dmlInfo;
        public String id;
        public MetadataService.CodeLocation[] locationsNotCovered;
        public MetadataService.CodeLocation[] methodInfo;
        public String name;
        public String namespace;
        public Integer numLocations;
        public Integer numLocationsNotCovered;
        public MetadataService.CodeLocation[] soqlInfo;
        public MetadataService.CodeLocation[] soslInfo;
        public String type_x;
        private String[] dmlInfo_type_info = new String[]{'dmlInfo','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
        private String[] id_type_info = new String[]{'id','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] locationsNotCovered_type_info = new String[]{'locationsNotCovered','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
        private String[] methodInfo_type_info = new String[]{'methodInfo','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
        private String[] name_type_info = new String[]{'name','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] namespace_type_info = new String[]{'namespace','http://soap.sforce.com/2006/04/metadata',null,'1','1','true'};
        private String[] numLocations_type_info = new String[]{'numLocations','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] numLocationsNotCovered_type_info = new String[]{'numLocationsNotCovered','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] soqlInfo_type_info = new String[]{'soqlInfo','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
        private String[] soslInfo_type_info = new String[]{'soslInfo','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
        private String[] type_x_type_info = new String[]{'type','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'dmlInfo','id','locationsNotCovered','methodInfo','name','namespace','numLocations','numLocationsNotCovered','soqlInfo','soslInfo','type_x'};
    }
    public class RecordTypePicklistValue {
        public String picklist;
        public MetadataService.PicklistValue[] values;
        private String[] picklist_type_info = new String[]{'picklist','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] values_type_info = new String[]{'values','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'picklist','values'};
    }
    
    
    public class readMetadata_element {
        public String type_x;
        public String[] fullNames;
        private String[] type_x_type_info = new String[]{'type','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] fullNames_type_info = new String[]{'fullNames','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'type_x','fullNames'};
    }
    
    public class updateMetadataResponse_element {
        public MetadataService.SaveResult[] result;
        private String[] result_type_info = new String[]{'result','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'result'};
    }
    
    public class DescribeValueTypeResult {
        public Boolean apiCreatable;
        public Boolean apiDeletable;
        public Boolean apiReadable;
        public Boolean apiUpdatable;
        public MetadataService.ValueTypeField parentField;
        public MetadataService.ValueTypeField[] valueTypeFields;
        private String[] apiCreatable_type_info = new String[]{'apiCreatable','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] apiDeletable_type_info = new String[]{'apiDeletable','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] apiReadable_type_info = new String[]{'apiReadable','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] apiUpdatable_type_info = new String[]{'apiUpdatable','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] parentField_type_info = new String[]{'parentField','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] valueTypeFields_type_info = new String[]{'valueTypeFields','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'apiCreatable','apiDeletable','apiReadable','apiUpdatable','parentField','valueTypeFields'};
    }
    
    
    public class deleteMetadata_element {
        public String type_x;
        public String[] fullNames;
        private String[] type_x_type_info = new String[]{'type','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] fullNames_type_info = new String[]{'fullNames','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'type_x','fullNames'};
    }
    
    public class ListPlacement {
        public Integer height;
        public String location;
        public String units;
        public Integer width;
        private String[] height_type_info = new String[]{'height','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] location_type_info = new String[]{'location','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] units_type_info = new String[]{'units','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] width_type_info = new String[]{'width','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'height','location','units','width'};
    }
    public class PicklistEntry {
        public Boolean active;
        public Boolean defaultValue;
        public String label;
        public String validFor;
        public String value;
        private String[] active_type_info = new String[]{'active','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] defaultValue_type_info = new String[]{'defaultValue','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] label_type_info = new String[]{'label','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] validFor_type_info = new String[]{'validFor','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] value_type_info = new String[]{'value','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'active','defaultValue','label','validFor','value'};
    }
    
    public class CodeCoverageWarning {
        public String id;
        public String message;
        public String name;
        public String namespace;
        private String[] id_type_info = new String[]{'id','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] message_type_info = new String[]{'message','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] name_type_info = new String[]{'name','http://soap.sforce.com/2006/04/metadata',null,'1','1','true'};
        private String[] namespace_type_info = new String[]{'namespace','http://soap.sforce.com/2006/04/metadata',null,'1','1','true'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'id','message','name','namespace'};
    }
    
    
    
    public class renameMetadataResponse_element {
        public MetadataService.SaveResult result;
        private String[] result_type_info = new String[]{'result','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'result'};
    }
    public class RelatedList {
        public Boolean hideOnDetail;
        public String name;
        private String[] hideOnDetail_type_info = new String[]{'hideOnDetail','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] name_type_info = new String[]{'name','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'hideOnDetail','name'};
    }
   
    public class ProfileRecordTypeVisibility {
        public Boolean default_x;
        public Boolean personAccountDefault;
        public String recordType;
        public Boolean visible;
        private String[] default_x_type_info = new String[]{'default','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] personAccountDefault_type_info = new String[]{'personAccountDefault','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] recordType_type_info = new String[]{'recordType','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] visible_type_info = new String[]{'visible','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'default_x','personAccountDefault','recordType','visible'};
    }
    
    public interface IReadResult {
        MetadataService.Metadata[] getRecords();
    }
    public interface IReadResponseElement {
        IReadResult getResult();
    }
    
    public class ReadCustomFieldResult implements IReadResult {
        public MetadataService.CustomField[] records;
        public MetadataService.Metadata[] getRecords() { return records; }
        private String[] records_type_info = new String[]{'records','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'records'};
    }
    public class readCustomFieldResponse_element implements IReadResponseElement {
        public MetadataService.ReadCustomFieldResult result;
        public IReadResult getResult() { return result; }
        private String[] result_type_info = new String[]{'result','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'result'};
    }
    public class ReadFieldSetResult implements IReadResult {
        public MetadataService.FieldSet[] records;
        public MetadataService.Metadata[] getRecords() { return records; }
        private String[] records_type_info = new String[]{'records','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'records'};
    }
    public class readFieldSetResponse_element implements IReadResponseElement {
        public MetadataService.ReadFieldSetResult result;
        public IReadResult getResult() { return result; }
        private String[] result_type_info = new String[]{'result','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'result'};
    }
    public class ReadPicklistValueResult implements IReadResult {
        public MetadataService.PicklistValue[] records;
        public MetadataService.Metadata[] getRecords() { return records; }
        private String[] records_type_info = new String[]{'records','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'records'};
    }
    public class readPicklistValueResponse_element implements IReadResponseElement {
        public MetadataService.ReadPicklistValueResult result;
        public IReadResult getResult() { return result; }
        private String[] result_type_info = new String[]{'result','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'result'};
    }
   
    
    public class ReadCustomObjectResult implements IReadResult {
        public MetadataService.CustomObject[] records;
        public MetadataService.Metadata[] getRecords() { return records; }
        private String[] records_type_info = new String[]{'records','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'records'};
    }
    public class readCustomObjectResponse_element implements IReadResponseElement {
        public MetadataService.ReadCustomObjectResult result;
        public IReadResult getResult() { return result; }
        private String[] result_type_info = new String[]{'result','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'result'};
    }
    
    public class ReadCustomLabelsResult implements IReadResult {
        public MetadataService.CustomLabels[] records;
        public MetadataService.Metadata[] getRecords() { return records; }
        private String[] records_type_info = new String[]{'records','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'records'};
    }
    public class readCustomLabelsResponse_element implements IReadResponseElement {
        public MetadataService.ReadCustomLabelsResult result;
        public IReadResult getResult() { return result; }
        private String[] result_type_info = new String[]{'result','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'result'};
    }
    public class ReadCustomLabelResult implements IReadResult {
        public MetadataService.CustomLabel[] records;
        public MetadataService.Metadata[] getRecords() { return records; }
        private String[] records_type_info = new String[]{'records','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'records'};
    }
    public class readCustomLabelResponse_element implements IReadResponseElement {
        public MetadataService.ReadCustomLabelResult result;
        public IReadResult getResult() { return result; }
        private String[] result_type_info = new String[]{'result','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'result'};
    }
    
    public class ReadCustomDataTypeResult implements IReadResult {
        public MetadataService.CustomDataType[] records;
        public MetadataService.Metadata[] getRecords() { return records; }
        private String[] records_type_info = new String[]{'records','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'records'};
    }
    public class readCustomDataTypeResponse_element implements IReadResponseElement {
        public MetadataService.ReadCustomDataTypeResult result;
        public IReadResult getResult() { return result; }
        private String[] result_type_info = new String[]{'result','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'result'};
    }
    
    public class ReadProfileResult implements IReadResult {
        public MetadataService.Profile[] records;
        public MetadataService.Metadata[] getRecords() { return records; }
        private String[] records_type_info = new String[]{'records','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'records'};
    }
    public class readProfileResponse_element implements IReadResponseElement {
        public MetadataService.ReadProfileResult result;
        public IReadResult getResult() { return result; }
        private String[] result_type_info = new String[]{'result','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'result'};
    }
        
    public class ReadRemoteSiteSettingResult implements IReadResult {
        public MetadataService.RemoteSiteSetting[] records;
        public MetadataService.Metadata[] getRecords() { return records; }
        private String[] records_type_info = new String[]{'records','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'records'};
    }
    public class readRemoteSiteSettingResponse_element implements IReadResponseElement {
        public MetadataService.ReadRemoteSiteSettingResult result;
        public IReadResult getResult() { return result; }
        private String[] result_type_info = new String[]{'result','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'result'};
    }
    public class ReadPackageResult implements IReadResult {
        public MetadataService.Package_x[] records;
        public MetadataService.Metadata[] getRecords() { return records; }
        private String[] records_type_info = new String[]{'records','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'records'};
    }
    public class readPackageResponse_element implements IReadResponseElement {
        public MetadataService.ReadPackageResult result;
        public IReadResult getResult() { return result; }
        private String[] result_type_info = new String[]{'result','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'result'};
    }
    
    public class ReadCustomMetadataResult implements IReadResult {
        public MetadataService.CustomMetadata[] records;
        public MetadataService.Metadata[] getRecords() { return records; }
        private String[] records_type_info = new String[]{'records','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'records'};
    }
    public class readCustomMetadataResponse_element implements IReadResponseElement {
        public MetadataService.ReadCustomMetadataResult result;
        public IReadResult getResult() { return result; }
        private String[] result_type_info = new String[]{'result','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'result'};
    }
    public class ReadNameSettingsResult implements IReadResult {
        public MetadataService.NameSettings[] records;
        public MetadataService.Metadata[] getRecords() { return records; }
        private String[] records_type_info = new String[]{'records','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'records'};
    }
    public class readNameSettingsResponse_element implements IReadResponseElement {
        public MetadataService.ReadNameSettingsResult result;
        public IReadResult getResult() { return result; }
        private String[] result_type_info = new String[]{'result','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'result'};
    }
    
    public class ReadCustomPermissionResult implements IReadResult {
        public MetadataService.CustomPermission[] records;
        public MetadataService.Metadata[] getRecords() { return records; }
        private String[] records_type_info = new String[]{'records','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'records'};
    }
    public class readCustomPermissionResponse_element implements IReadResponseElement {
        public MetadataService.ReadCustomPermissionResult result;
        public IReadResult getResult() { return result; }
        private String[] result_type_info = new String[]{'result','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'result'};
    }
    
    public class ReadNamedCredentialResult implements IReadResult {
        public MetadataService.NamedCredential[] records;
        public MetadataService.Metadata[] getRecords() { return records; }
        private String[] records_type_info = new String[]{'records','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'records'};
    }
    public class readNamedCredentialResponse_element implements IReadResponseElement {
        public MetadataService.ReadNamedCredentialResult result;
        public IReadResult getResult() { return result; }
        private String[] result_type_info = new String[]{'result','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'result'};
    }
    
    public class ReadMetadataWithContentResult implements IReadResult {
        public MetadataService.MetadataWithContent[] records;
        public MetadataService.Metadata[] getRecords() { return records; }
        private String[] records_type_info = new String[]{'records','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'records'};
    }
    public class readMetadataWithContentResponse_element implements IReadResponseElement {
        public MetadataService.ReadMetadataWithContentResult result;
        public IReadResult getResult() { return result; }
        private String[] result_type_info = new String[]{'result','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'result'};
    }
    
    public class ReadResult {
        public MetadataService.Metadata[] records;
        private String[] records_type_info = new String[]{'records','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'records'};
    }
    
    public class ProfileApexPageAccess {
        public String apexPage;
        public Boolean enabled;
        private String[] apexPage_type_info = new String[]{'apexPage','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] enabled_type_info = new String[]{'enabled','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'apexPage','enabled'};
    }
    
    public class RetrieveResult {
        public Boolean done;
        public String errorMessage;
        public String errorStatusCode;
        public MetadataService.FileProperties[] fileProperties;
        public String id;
        public MetadataService.RetrieveMessage[] messages;
        public String status;
        public Boolean success;
        public String zipFile;
        private String[] done_type_info = new String[]{'done','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] errorMessage_type_info = new String[]{'errorMessage','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] errorStatusCode_type_info = new String[]{'errorStatusCode','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] fileProperties_type_info = new String[]{'fileProperties','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
        private String[] id_type_info = new String[]{'id','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] messages_type_info = new String[]{'messages','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
        private String[] status_type_info = new String[]{'status','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] success_type_info = new String[]{'success','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] zipFile_type_info = new String[]{'zipFile','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'done','errorMessage','errorStatusCode','fileProperties','id','messages','status','success','zipFile'};
    }

    public class BusinessProcess extends Metadata {
        public String type = 'BusinessProcess';
        public String fullName;
        private String[] fullName_type_info = new String[]{'fullName','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        public String description;
        public Boolean isActive;
        public MetadataService.PicklistValue[] values;
        private String[] description_type_info = new String[]{'description','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] isActive_type_info = new String[]{'isActive','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] values_type_info = new String[]{'values','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] type_att_info = new String[]{'xsi:type'};
        private String[] field_order_type_info = new String[]{'fullName', 'description','isActive','values'};
    }
    
    public class HistoryRetentionPolicy {
        public Integer archiveAfterMonths;
        public Integer archiveRetentionYears;
        public Integer gracePeriodDays;
        public String description;
        private String[] archiveAfterMonths_type_info = new String[]{'archiveAfterMonths','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] archiveRetentionYears_type_info = new String[]{'archiveRetentionYears','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] gracePeriodDays_type_info = new String[]{'gracePeriodDays','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] description_type_info = new String[]{'description','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'archiveAfterMonths','archiveRetentionYears','gracePeriodDays','description'};
    }

    public class CustomObject extends Metadata {
        public String type = 'CustomObject';
        public String fullName;
        private String[] fullName_type_info = new String[]{'fullName','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        public MetadataService.ActionOverride[] actionOverrides;
        public Boolean allowInChatterGroups;
        public MetadataService.ArticleTypeChannelDisplay articleTypeChannelDisplay;
        public MetadataService.BusinessProcess[] businessProcesses;
        public String compactLayoutAssignment;
        public MetadataService.CompactLayout[] compactLayouts;
        public String customHelp;
        public String customHelpPage;
        public String customSettingsType;
        public String deploymentStatus;
        public Boolean deprecated;
        public String description;
        public Boolean enableActivities;
        public Boolean enableBulkApi;
        public Boolean enableDivisions;
        public Boolean enableEnhancedLookup;
        public Boolean enableFeeds;
        public Boolean enableHistory;
        public Boolean enableReports;
        public Boolean enableSearch;
        public Boolean enableSharing;
        public Boolean enableStreamingApi;
        public String externalDataSource;
        public String externalName;
        public String externalRepository;
        public String externalSharingModel;
        public MetadataService.FieldSet[] fieldSets;
        public MetadataService.CustomField[] fields;
        public String gender;
        public MetadataService.HistoryRetentionPolicy historyRetentionPolicy;
        public Boolean household;
        public String label;
        public MetadataService.ListView[] listViews;
        public MetadataService.CustomField nameField;
        public String pluralLabel;
        public Boolean recordTypeTrackFeedHistory;
        public Boolean recordTypeTrackHistory;
        public MetadataService.RecordType[] recordTypes;
    /*    public MetadataService.SearchLayouts searchLayouts;
        public String sharingModel;
        public MetadataService.SharingReason[] sharingReasons;
        public MetadataService.SharingRecalculation[] sharingRecalculations;
        public String startsWith;
        public MetadataService.ValidationRule[] validationRules;
        public String visibility;
        public MetadataService.WebLink[] webLinks; */
        private String[] actionOverrides_type_info = new String[]{'actionOverrides','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
        private String[] allowInChatterGroups_type_info = new String[]{'allowInChatterGroups','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] articleTypeChannelDisplay_type_info = new String[]{'articleTypeChannelDisplay','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] businessProcesses_type_info = new String[]{'businessProcesses','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
        private String[] compactLayoutAssignment_type_info = new String[]{'compactLayoutAssignment','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] compactLayouts_type_info = new String[]{'compactLayouts','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
        private String[] customHelp_type_info = new String[]{'customHelp','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] customHelpPage_type_info = new String[]{'customHelpPage','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] customSettingsType_type_info = new String[]{'customSettingsType','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] deploymentStatus_type_info = new String[]{'deploymentStatus','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] deprecated_type_info = new String[]{'deprecated','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] description_type_info = new String[]{'description','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] enableActivities_type_info = new String[]{'enableActivities','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] enableBulkApi_type_info = new String[]{'enableBulkApi','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] enableDivisions_type_info = new String[]{'enableDivisions','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] enableEnhancedLookup_type_info = new String[]{'enableEnhancedLookup','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] enableFeeds_type_info = new String[]{'enableFeeds','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] enableHistory_type_info = new String[]{'enableHistory','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] enableReports_type_info = new String[]{'enableReports','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] enableSearch_type_info = new String[]{'enableSearch','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] enableSharing_type_info = new String[]{'enableSharing','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] enableStreamingApi_type_info = new String[]{'enableStreamingApi','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] externalDataSource_type_info = new String[]{'externalDataSource','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] externalName_type_info = new String[]{'externalName','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] externalRepository_type_info = new String[]{'externalRepository','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] externalSharingModel_type_info = new String[]{'externalSharingModel','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] fieldSets_type_info = new String[]{'fieldSets','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
        private String[] fields_type_info = new String[]{'fields','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
        private String[] gender_type_info = new String[]{'gender','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] historyRetentionPolicy_type_info = new String[]{'historyRetentionPolicy','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] household_type_info = new String[]{'household','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] label_type_info = new String[]{'label','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] listViews_type_info = new String[]{'listViews','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
        private String[] nameField_type_info = new String[]{'nameField','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] pluralLabel_type_info = new String[]{'pluralLabel','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] recordTypeTrackFeedHistory_type_info = new String[]{'recordTypeTrackFeedHistory','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] recordTypeTrackHistory_type_info = new String[]{'recordTypeTrackHistory','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] recordTypes_type_info = new String[]{'recordTypes','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
      /*  private String[] searchLayouts_type_info = new String[]{'searchLayouts','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] sharingModel_type_info = new String[]{'sharingModel','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] sharingReasons_type_info = new String[]{'sharingReasons','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
        private String[] sharingRecalculations_type_info = new String[]{'sharingRecalculations','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
        private String[] startsWith_type_info = new String[]{'startsWith','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] validationRules_type_info = new String[]{'validationRules','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
        private String[] visibility_type_info = new String[]{'visibility','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] webLinks_type_info = new String[]{'webLinks','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] type_att_info = new String[]{'xsi:type'};
        private String[] field_order_type_info = new String[]{'fullName', 'actionOverrides','allowInChatterGroups','articleTypeChannelDisplay','businessProcesses','compactLayoutAssignment','compactLayouts','customHelp','customHelpPage','customSettingsType','deploymentStatus','deprecated','description','enableActivities','enableBulkApi','enableDivisions','enableEnhancedLookup','enableFeeds','enableHistory','enableReports','enableSearch','enableSharing','enableStreamingApi','externalDataSource','externalName','externalRepository','externalSharingModel','fieldSets','fields','gender','historyRetentionPolicy','household','label','listViews','nameField','pluralLabel','recordTypeTrackFeedHistory','recordTypeTrackHistory','recordTypes','searchLayouts','sharingModel','sharingReasons','sharingRecalculations','startsWith','validationRules','visibility','webLinks'};
   */ }
    
    public class PackageTypeMembers {
        public String[] members;
        public String name;
        private String[] members_type_info = new String[]{'members','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
        private String[] name_type_info = new String[]{'name','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'members','name'};
    }

    public class cancelDeployResponse_element {
        public MetadataService.CancelDeployResult result;
        private String[] result_type_info = new String[]{'result','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'result'};
    }
    
    public class ProfileObjectPermissions {
        public Boolean allowCreate;
        public Boolean allowDelete;
        public Boolean allowEdit;
        public Boolean allowRead;
        public Boolean modifyAllRecords;
        public String object_x;
        public Boolean viewAllRecords;
        private String[] allowCreate_type_info = new String[]{'allowCreate','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] allowDelete_type_info = new String[]{'allowDelete','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] allowEdit_type_info = new String[]{'allowEdit','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] allowRead_type_info = new String[]{'allowRead','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] modifyAllRecords_type_info = new String[]{'modifyAllRecords','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] object_x_type_info = new String[]{'object','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] viewAllRecords_type_info = new String[]{'viewAllRecords','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'allowCreate','allowDelete','allowEdit','allowRead','modifyAllRecords','object_x','viewAllRecords'};
    }
   
    public class DeployMessage {
        public Boolean changed;
        public Integer columnNumber;
        public String componentType;
        public Boolean created;
        public DateTime createdDate;
        public Boolean deleted;
        public String fileName;
        public String fullName;
        public String id;
        public Integer lineNumber;
        public String problem;
        public String problemType;
        public Boolean success;
        private String[] changed_type_info = new String[]{'changed','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] columnNumber_type_info = new String[]{'columnNumber','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] componentType_type_info = new String[]{'componentType','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] created_type_info = new String[]{'created','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] createdDate_type_info = new String[]{'createdDate','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] deleted_type_info = new String[]{'deleted','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] fileName_type_info = new String[]{'fileName','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] fullName_type_info = new String[]{'fullName','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] id_type_info = new String[]{'id','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] lineNumber_type_info = new String[]{'lineNumber','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] problem_type_info = new String[]{'problem','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] problemType_type_info = new String[]{'problemType','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] success_type_info = new String[]{'success','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'changed','columnNumber','componentType','created','createdDate','deleted','fileName','fullName','id','lineNumber','problem','problemType','success'};
    }
    public class PermissionSetObjectPermissions {
        public Boolean allowCreate;
        public Boolean allowDelete;
        public Boolean allowEdit;
        public Boolean allowRead;
        public Boolean modifyAllRecords;
        public String object_x;
        public Boolean viewAllRecords;
        private String[] allowCreate_type_info = new String[]{'allowCreate','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] allowDelete_type_info = new String[]{'allowDelete','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] allowEdit_type_info = new String[]{'allowEdit','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] allowRead_type_info = new String[]{'allowRead','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] modifyAllRecords_type_info = new String[]{'modifyAllRecords','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] object_x_type_info = new String[]{'object','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] viewAllRecords_type_info = new String[]{'viewAllRecords','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'allowCreate','allowDelete','allowEdit','allowRead','modifyAllRecords','object_x','viewAllRecords'};
    }
    public class ProfileApexClassAccess {
        public String apexClass;
        public Boolean enabled;
        private String[] apexClass_type_info = new String[]{'apexClass','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] enabled_type_info = new String[]{'enabled','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'apexClass','enabled'};
    }
    public class ProfileLoginIpRange {
        public String description;
        public String endAddress;
        public String startAddress;
        private String[] description_type_info = new String[]{'description','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] endAddress_type_info = new String[]{'endAddress','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] startAddress_type_info = new String[]{'startAddress','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'description','endAddress','startAddress'};
    }
    
    public class Package_x extends Metadata {
        public String type = 'Package_x';
        public String fullName;
        private String[] fullName_type_info = new String[]{'fullName','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        public String apiAccessLevel;
        public String description;
        public String namespacePrefix;
        public MetadataService.ProfileObjectPermissions[] objectPermissions;
        public String packageType;
        public String packageVersion;
        public String postInstallClass;
        public String setupWeblink;
        public MetadataService.PackageTypeMembers[] types;
        public String uninstallClass;
        public String version;
        private String[] apiAccessLevel_type_info = new String[]{'apiAccessLevel','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] description_type_info = new String[]{'description','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] namespacePrefix_type_info = new String[]{'namespacePrefix','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] objectPermissions_type_info = new String[]{'objectPermissions','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
        private String[] packageType_type_info = new String[]{'packageType','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] packageVersion_type_info = new String[]{'packageVersion','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] postInstallClass_type_info = new String[]{'postInstallClass','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] setupWeblink_type_info = new String[]{'setupWeblink','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] types_type_info = new String[]{'types','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
        private String[] uninstallClass_type_info = new String[]{'uninstallClass','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] version_type_info = new String[]{'version','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] type_att_info = new String[]{'xsi:type'};
        private String[] field_order_type_info = new String[]{'fullName', 'apiAccessLevel','description','namespacePrefix','objectPermissions','packageType','packageVersion','postInstallClass','setupWeblink','types','uninstallClass','version'};
    }

    public class checkRetrieveStatus_element {
        public String asyncProcessId;
        public Boolean includeZip;
        private String[] asyncProcessId_type_info = new String[]{'asyncProcessId','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] includeZip_type_info = new String[]{'includeZip','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'asyncProcessId','includeZip'};
    }
    
    public class DescribeMetadataResult {
        public MetadataService.DescribeMetadataObject[] metadataObjects;
        public String organizationNamespace;
        public Boolean partialSaveAllowed;
        public Boolean testRequired;
        private String[] metadataObjects_type_info = new String[]{'metadataObjects','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
        private String[] organizationNamespace_type_info = new String[]{'organizationNamespace','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] partialSaveAllowed_type_info = new String[]{'partialSaveAllowed','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] testRequired_type_info = new String[]{'testRequired','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'metadataObjects','organizationNamespace','partialSaveAllowed','testRequired'};
    }

    public class ListView extends Metadata {
        public String type = 'ListView';
        public String fullName;
        private String[] fullName_type_info = new String[]{'fullName','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        public String booleanFilter;
        public String[] columns;
        public String division;
        public String filterScope;
      //  public MetadataService.ListViewFilter[] filters;
        public String label;
        public String language;
        public String queue;
     //   public MetadataService.SharedTo sharedTo;
        private String[] booleanFilter_type_info = new String[]{'booleanFilter','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] columns_type_info = new String[]{'columns','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
        private String[] division_type_info = new String[]{'division','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] filterScope_type_info = new String[]{'filterScope','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
     //   private String[] filters_type_info = new String[]{'filters','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
        private String[] label_type_info = new String[]{'label','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] language_type_info = new String[]{'language','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] queue_type_info = new String[]{'queue','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
     //   private String[] sharedTo_type_info = new String[]{'sharedTo','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] type_att_info = new String[]{'xsi:type'};
        private String[] field_order_type_info = new String[]{'fullName', 'booleanFilter','columns','division','filterScope','filters','label','language','queue','sharedTo'};
    }
    
     public class RecordType extends Metadata {
        public String type = 'RecordType';
        public String fullName;
        private String[] fullName_type_info = new String[]{'fullName','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        public Boolean active;
        public String businessProcess;
        public String compactLayoutAssignment;
        public String description;
        public String label;
        public MetadataService.RecordTypePicklistValue[] picklistValues;
        private String[] active_type_info = new String[]{'active','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] businessProcess_type_info = new String[]{'businessProcess','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] compactLayoutAssignment_type_info = new String[]{'compactLayoutAssignment','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] description_type_info = new String[]{'description','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] label_type_info = new String[]{'label','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] picklistValues_type_info = new String[]{'picklistValues','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] type_att_info = new String[]{'xsi:type'};
        private String[] field_order_type_info = new String[]{'fullName', 'active','businessProcess','compactLayoutAssignment','description','label','picklistValues'};
    }

    
    public class deleteMetadataResponse_element {
        public MetadataService.DeleteResult[] result;
        private String[] result_type_info = new String[]{'result','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'result'};
    }

    public class CodeLocation {
        public Integer column;
        public Integer line;
        public Integer numExecutions;
        public Double time_x;
        private String[] column_type_info = new String[]{'column','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] line_type_info = new String[]{'line','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] numExecutions_type_info = new String[]{'numExecutions','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] time_x_type_info = new String[]{'time','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'column','line','numExecutions','time_x'};
    }
    
    public class PermissionSetApplicationVisibility {
        public String application;
        public Boolean visible;
        private String[] application_type_info = new String[]{'application','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] visible_type_info = new String[]{'visible','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'application','visible'};
    }
    public class StandardFieldTranslation {
        public String label;
        public String name;
        private String[] label_type_info = new String[]{'label','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] name_type_info = new String[]{'name','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'label','name'};
    }
    
    public class RemoteSiteSetting extends Metadata {
        public String type = 'RemoteSiteSetting';
        public String fullName;
        private String[] fullName_type_info = new String[]{'fullName','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        public String description;
        public Boolean disableProtocolSecurity;
        public Boolean isActive;
        public String url;
        private String[] description_type_info = new String[]{'description','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] disableProtocolSecurity_type_info = new String[]{'disableProtocolSecurity','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] isActive_type_info = new String[]{'isActive','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] url_type_info = new String[]{'url','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] type_att_info = new String[]{'xsi:type'};
        private String[] field_order_type_info = new String[]{'fullName', 'description','disableProtocolSecurity','isActive','url'};
    }
    public class ConnectedAppOauthConfig {
        public String callbackUrl;
        public String certificate;
        public String consumerKey;
        public String consumerSecret;
        public String[] scopes;
        private String[] callbackUrl_type_info = new String[]{'callbackUrl','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] certificate_type_info = new String[]{'certificate','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] consumerKey_type_info = new String[]{'consumerKey','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] consumerSecret_type_info = new String[]{'consumerSecret','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] scopes_type_info = new String[]{'scopes','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'callbackUrl','certificate','consumerKey','consumerSecret','scopes'};
    }
   
    public class RetrieveMessage {
        public String fileName;
        public String problem;
        private String[] fileName_type_info = new String[]{'fileName','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] problem_type_info = new String[]{'problem','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'fileName','problem'};
    }

    public class Picklist {
        public String controllingField;
        public MetadataService.PicklistValue[] picklistValues;
        public Boolean sorted;
        private String[] controllingField_type_info = new String[]{'controllingField','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] picklistValues_type_info = new String[]{'picklistValues','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
        private String[] sorted_type_info = new String[]{'sorted','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'controllingField','picklistValues','sorted'};
    }
    public class deploy_element {
        public String ZipFile;
        public MetadataService.DeployOptions DeployOptions;
        private String[] ZipFile_type_info = new String[]{'ZipFile','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] DeployOptions_type_info = new String[]{'DeployOptions','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'ZipFile','DeployOptions'};
    }
    
    public class CustomPermission extends Metadata {
        public String type = 'CustomPermission';
        public String fullName;
        private String[] fullName_type_info = new String[]{'fullName','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        public String connectedApp;
        public String description;
        public String label;
     //   public MetadataService.CustomPermissionDependencyRequired[] requiredPermission;
        private String[] connectedApp_type_info = new String[]{'connectedApp','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] description_type_info = new String[]{'description','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] label_type_info = new String[]{'label','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
     //   private String[] requiredPermission_type_info = new String[]{'requiredPermission','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] type_att_info = new String[]{'xsi:type'};
        private String[] field_order_type_info = new String[]{'fullName', 'connectedApp','description','label','requiredPermission'};
    }
    
    public class DeployResult {
        public String canceledBy;
        public String canceledByName;
        public Boolean checkOnly;
        public DateTime completedDate;
        public String createdBy;
        public String createdByName;
        public DateTime createdDate;
        public MetadataService.DeployDetails details;
        public Boolean done;
        public String errorMessage;
        public String errorStatusCode;
        public String id;
        public Boolean ignoreWarnings;
        public DateTime lastModifiedDate;
        public Integer numberComponentErrors;
        public Integer numberComponentsDeployed;
        public Integer numberComponentsTotal;
        public Integer numberTestErrors;
        public Integer numberTestsCompleted;
        public Integer numberTestsTotal;
        public Boolean rollbackOnError;
        public Boolean runTestsEnabled;
        public DateTime startDate;
        public String stateDetail;
        public String status;
        public Boolean success;
        private String[] canceledBy_type_info = new String[]{'canceledBy','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] canceledByName_type_info = new String[]{'canceledByName','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] checkOnly_type_info = new String[]{'checkOnly','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] completedDate_type_info = new String[]{'completedDate','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] createdBy_type_info = new String[]{'createdBy','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] createdByName_type_info = new String[]{'createdByName','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] createdDate_type_info = new String[]{'createdDate','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] details_type_info = new String[]{'details','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] done_type_info = new String[]{'done','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] errorMessage_type_info = new String[]{'errorMessage','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] errorStatusCode_type_info = new String[]{'errorStatusCode','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] id_type_info = new String[]{'id','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] ignoreWarnings_type_info = new String[]{'ignoreWarnings','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] lastModifiedDate_type_info = new String[]{'lastModifiedDate','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] numberComponentErrors_type_info = new String[]{'numberComponentErrors','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] numberComponentsDeployed_type_info = new String[]{'numberComponentsDeployed','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] numberComponentsTotal_type_info = new String[]{'numberComponentsTotal','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] numberTestErrors_type_info = new String[]{'numberTestErrors','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] numberTestsCompleted_type_info = new String[]{'numberTestsCompleted','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] numberTestsTotal_type_info = new String[]{'numberTestsTotal','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] rollbackOnError_type_info = new String[]{'rollbackOnError','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] runTestsEnabled_type_info = new String[]{'runTestsEnabled','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] startDate_type_info = new String[]{'startDate','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] stateDetail_type_info = new String[]{'stateDetail','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] status_type_info = new String[]{'status','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] success_type_info = new String[]{'success','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'canceledBy','canceledByName','checkOnly','completedDate','createdBy','createdByName','createdDate','details','done','errorMessage','errorStatusCode','id','ignoreWarnings','lastModifiedDate','numberComponentErrors','numberComponentsDeployed','numberComponentsTotal','numberTestErrors','numberTestsCompleted','numberTestsTotal','rollbackOnError','runTestsEnabled','startDate','stateDetail','status','success'};
    }
    
    public class ConnectedAppSamlConfig {
        public String acsUrl;
        public String certificate;
        public String encryptionCertificate;
        public String encryptionType;
        public String entityUrl;
        public String issuer;
        public String samlNameIdFormat;
        public String samlSubjectCustomAttr;
        public String samlSubjectType;
        private String[] acsUrl_type_info = new String[]{'acsUrl','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] certificate_type_info = new String[]{'certificate','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] encryptionCertificate_type_info = new String[]{'encryptionCertificate','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] encryptionType_type_info = new String[]{'encryptionType','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] entityUrl_type_info = new String[]{'entityUrl','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] issuer_type_info = new String[]{'issuer','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] samlNameIdFormat_type_info = new String[]{'samlNameIdFormat','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] samlSubjectCustomAttr_type_info = new String[]{'samlSubjectCustomAttr','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] samlSubjectType_type_info = new String[]{'samlSubjectType','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'acsUrl','certificate','encryptionCertificate','encryptionType','entityUrl','issuer','samlNameIdFormat','samlSubjectCustomAttr','samlSubjectType'};
    }
    
    public class ApprovalStepRejectBehavior {
        public String type_x;
        private String[] type_x_type_info = new String[]{'type','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'type_x'};
    }
    public class XOrgHubSharedObject {
        public String[] fields;
        public String name;
        private String[] fields_type_info = new String[]{'fields','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
        private String[] name_type_info = new String[]{'name','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'fields','name'};
    }
    public class createMetadata_element {
        public MetadataService.Metadata[] metadata;
        private String[] metadata_type_info = new String[]{'metadata','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'metadata'};
    }
    public class CustomPageWebLinkTranslation {
        public String label;
        public String name;
        private String[] label_type_info = new String[]{'label','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] name_type_info = new String[]{'name','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'label','name'};
    }
    public class describeMetadataResponse_element {
        public MetadataService.DescribeMetadataResult result;
        private String[] result_type_info = new String[]{'result','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'result'};
    }
    
    public class ProfileFieldLevelSecurity {
        public Boolean editable;
        public String field;
        public Boolean readable;
        private String[] editable_type_info = new String[]{'editable','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] field_type_info = new String[]{'field','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] readable_type_info = new String[]{'readable','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'editable','field','readable'};
    }
    public class checkDeployStatus_element {
        public String asyncProcessId;
        public Boolean includeDetails;
        private String[] asyncProcessId_type_info = new String[]{'asyncProcessId','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] includeDetails_type_info = new String[]{'includeDetails','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'asyncProcessId','includeDetails'};
    }
    public virtual class MetadataWithContent extends Metadata {
        public String content;
    }
    
    public class checkDeployStatusResponse_element {
        public MetadataService.DeployResult result;
        private String[] result_type_info = new String[]{'result','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'result'};
    }
    
    public class listMetadataResponse_element {
        public MetadataService.FileProperties[] result;
        private String[] result_type_info = new String[]{'result','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'result'};
    }
    public class SamlSsoConfig extends Metadata {
        public String type = 'SamlSsoConfig';
        public String fullName;
        private String[] fullName_type_info = new String[]{'fullName','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        public String attributeName;
        public String attributeNameIdFormat;
        public String decryptionCertificate;
        public String errorUrl;
        public String executionUserId;
        public String identityLocation;
        public String identityMapping;
        public String issuer;
        public String loginUrl;
        public String logoutUrl;
        public String name;
        public String oauthTokenEndpoint;
        public Boolean redirectBinding;
        public String requestSignatureMethod;
        public String salesforceLoginUrl;
        public String samlEntityId;
        public String samlJitHandlerId;
        public String samlVersion;
        public Boolean userProvisioning;
        public String validationCert;
        private String[] attributeName_type_info = new String[]{'attributeName','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] attributeNameIdFormat_type_info = new String[]{'attributeNameIdFormat','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] decryptionCertificate_type_info = new String[]{'decryptionCertificate','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] errorUrl_type_info = new String[]{'errorUrl','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] executionUserId_type_info = new String[]{'executionUserId','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] identityLocation_type_info = new String[]{'identityLocation','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] identityMapping_type_info = new String[]{'identityMapping','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] issuer_type_info = new String[]{'issuer','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] loginUrl_type_info = new String[]{'loginUrl','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] logoutUrl_type_info = new String[]{'logoutUrl','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] name_type_info = new String[]{'name','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] oauthTokenEndpoint_type_info = new String[]{'oauthTokenEndpoint','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] redirectBinding_type_info = new String[]{'redirectBinding','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] requestSignatureMethod_type_info = new String[]{'requestSignatureMethod','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] salesforceLoginUrl_type_info = new String[]{'salesforceLoginUrl','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] samlEntityId_type_info = new String[]{'samlEntityId','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] samlJitHandlerId_type_info = new String[]{'samlJitHandlerId','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] samlVersion_type_info = new String[]{'samlVersion','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] userProvisioning_type_info = new String[]{'userProvisioning','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] validationCert_type_info = new String[]{'validationCert','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] type_att_info = new String[]{'xsi:type'};
        private String[] field_order_type_info = new String[]{'fullName', 'attributeName','attributeNameIdFormat','decryptionCertificate','errorUrl','executionUserId','identityLocation','identityMapping','issuer','loginUrl','logoutUrl','name','oauthTokenEndpoint','redirectBinding','requestSignatureMethod','salesforceLoginUrl','samlEntityId','samlJitHandlerId','samlVersion','userProvisioning','validationCert'};
    }
    public class describeValueType_element {
        public String type_x;
        private String[] type_x_type_info = new String[]{'type','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'type_x'};
    }
    
    public class FieldSetItem {
        public String field;
        public Boolean isFieldManaged;
        public Boolean isRequired;
        private String[] field_type_info = new String[]{'field','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] isFieldManaged_type_info = new String[]{'isFieldManaged','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] isRequired_type_info = new String[]{'isRequired','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'field','isFieldManaged','isRequired'};
    }

    public class ProfileUserPermission {
        public Boolean enabled;
        public String name;
        private String[] enabled_type_info = new String[]{'enabled','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] name_type_info = new String[]{'name','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'enabled','name'};
    }
    
    public class CustomField extends Metadata {
        public String type = 'CustomField';
        public String fullName;
        private String[] fullName_type_info = new String[]{'fullName','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        public Boolean caseSensitive;
        public String customDataType;
        public String defaultValue;
        public String deleteConstraint;
        public Boolean deprecated;
        public String description;
        public String displayFormat;
        public Boolean encrypted;
        public Boolean escapeMarkup;
        public String externalDeveloperName;
        public Boolean externalId;
        public String fieldManageability;
        public String formula;
        public String formulaTreatBlanksAs;
        public String inlineHelpText;
        public Boolean isConvertLeadDisabled;
        public Boolean isFilteringDisabled;
        public Boolean isNameField;
        public Boolean isSortingDisabled;
        public String label;
        public Integer length;
        public MetadataService.LookupFilter lookupFilter;
        public String maskChar;
        public String maskType;
        public MetadataService.Picklist picklist;
        public Boolean populateExistingRows;
        public Integer precision;
        public String referenceTargetField;
        public String referenceTo;
        public String relationshipLabel;
        public String relationshipName;
        public Integer relationshipOrder;
        public Boolean reparentableMasterDetail;
        public Boolean required;
        public Boolean restrictedAdminField;
        public Integer scale;
        public Integer startingNumber;
        public Boolean stripMarkup;
        public String summarizedField;
        public MetadataService.FilterItem[] summaryFilterItems;
        public String summaryForeignKey;
        public String summaryOperation;
        public Boolean trackFeedHistory;
        public Boolean trackHistory;
        public Boolean trackTrending;
        public String type_x;
        public Boolean unique;
        public Integer visibleLines;
        public Boolean writeRequiresMasterRead;
        public Boolean displayLocationInDecimal;
        private String[] caseSensitive_type_info = new String[]{'caseSensitive','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] customDataType_type_info = new String[]{'customDataType','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] defaultValue_type_info = new String[]{'defaultValue','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] deleteConstraint_type_info = new String[]{'deleteConstraint','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] deprecated_type_info = new String[]{'deprecated','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] description_type_info = new String[]{'description','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] displayFormat_type_info = new String[]{'displayFormat','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] encrypted_type_info = new String[]{'encrypted','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] escapeMarkup_type_info = new String[]{'escapeMarkup','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] externalDeveloperName_type_info = new String[]{'externalDeveloperName','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] externalId_type_info = new String[]{'externalId','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] fieldManageability_type_info = new String[]{'fieldManageability','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] formula_type_info = new String[]{'formula','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] formulaTreatBlanksAs_type_info = new String[]{'formulaTreatBlanksAs','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] inlineHelpText_type_info = new String[]{'inlineHelpText','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] isConvertLeadDisabled_type_info = new String[]{'isConvertLeadDisabled','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] isFilteringDisabled_type_info = new String[]{'isFilteringDisabled','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] isNameField_type_info = new String[]{'isNameField','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] isSortingDisabled_type_info = new String[]{'isSortingDisabled','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] label_type_info = new String[]{'label','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] length_type_info = new String[]{'length','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] lookupFilter_type_info = new String[]{'lookupFilter','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] maskChar_type_info = new String[]{'maskChar','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] maskType_type_info = new String[]{'maskType','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] picklist_type_info = new String[]{'picklist','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] populateExistingRows_type_info = new String[]{'populateExistingRows','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] precision_type_info = new String[]{'precision','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] referenceTargetField_type_info = new String[]{'referenceTargetField','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] referenceTo_type_info = new String[]{'referenceTo','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] relationshipLabel_type_info = new String[]{'relationshipLabel','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] relationshipName_type_info = new String[]{'relationshipName','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] relationshipOrder_type_info = new String[]{'relationshipOrder','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] reparentableMasterDetail_type_info = new String[]{'reparentableMasterDetail','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] required_type_info = new String[]{'required','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] restrictedAdminField_type_info = new String[]{'restrictedAdminField','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] scale_type_info = new String[]{'scale','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] startingNumber_type_info = new String[]{'startingNumber','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] stripMarkup_type_info = new String[]{'stripMarkup','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] summarizedField_type_info = new String[]{'summarizedField','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] summaryFilterItems_type_info = new String[]{'summaryFilterItems','http://soap.sforce.com/2006/04/metadata',null,'0','-1','false'};
        private String[] summaryForeignKey_type_info = new String[]{'summaryForeignKey','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] summaryOperation_type_info = new String[]{'summaryOperation','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] trackFeedHistory_type_info = new String[]{'trackFeedHistory','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] trackHistory_type_info = new String[]{'trackHistory','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] trackTrending_type_info = new String[]{'trackTrending','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] type_x_type_info = new String[]{'type','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] unique_type_info = new String[]{'unique','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] visibleLines_type_info = new String[]{'visibleLines','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] writeRequiresMasterRead_type_info = new String[]{'writeRequiresMasterRead','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] displayLocationInDecimal_type_info = new String[]{'displayLocationInDecimal','http://soap.sforce.com/2006/04/metadata',null,'0','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] type_att_info = new String[]{'xsi:type'};
        private String[] field_order_type_info = new String[]{'fullName', 'caseSensitive','customDataType','defaultValue','deleteConstraint','deprecated','description','displayFormat','encrypted','escapeMarkup','externalDeveloperName','externalId','fieldManageability','formula','formulaTreatBlanksAs','inlineHelpText','isConvertLeadDisabled','isFilteringDisabled','isNameField','isSortingDisabled','label','length','lookupFilter','maskChar','maskType','picklist','populateExistingRows','precision','referenceTargetField','referenceTo','relationshipLabel','relationshipName','relationshipOrder','reparentableMasterDetail','required','restrictedAdminField','scale','startingNumber','stripMarkup','summarizedField','summaryFilterItems','summaryForeignKey','summaryOperation','trackFeedHistory','trackHistory','trackTrending','type_x','unique','visibleLines','writeRequiresMasterRead','displayLocationInDecimal'};
    }

    public class ProfileCustomPermissions {
        public Boolean enabled;
        public String name;
        private String[] enabled_type_info = new String[]{'enabled','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] name_type_info = new String[]{'name','http://soap.sforce.com/2006/04/metadata',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata','true','false'};
        private String[] field_order_type_info = new String[]{'enabled','name'};
    }
    
    public class MetadataPort {
        public String endpoint_x = URL.getSalesforceBaseUrl().toExternalForm() + '/services/Soap/m/36.0';
        public Map<String,String> inputHttpHeaders_x;
        public Map<String,String> outputHttpHeaders_x;
        public String clientCertName_x;
        public String clientCert_x;
        public String clientCertPasswd_x;
        public Integer timeout_x;
        public MetadataService.SessionHeader_element SessionHeader;
        public MetadataService.DebuggingInfo_element DebuggingInfo;
        public MetadataService.DebuggingHeader_element DebuggingHeader;
        public MetadataService.CallOptions_element CallOptions;
        public MetadataService.AllOrNoneHeader_element AllOrNoneHeader;
        private String SessionHeader_hns = 'SessionHeader=http://soap.sforce.com/2006/04/metadata';
        private String DebuggingInfo_hns = 'DebuggingInfo=http://soap.sforce.com/2006/04/metadata';
        private String DebuggingHeader_hns = 'DebuggingHeader=http://soap.sforce.com/2006/04/metadata';
        private String CallOptions_hns = 'CallOptions=http://soap.sforce.com/2006/04/metadata';
        private String AllOrNoneHeader_hns = 'AllOrNoneHeader=http://soap.sforce.com/2006/04/metadata';
        private String[] ns_map_type_info = new String[]{'http://soap.sforce.com/2006/04/metadata', 'MetadataService'};
        public MetadataService.DeleteResult[] deleteMetadata(String type_x,String[] fullNames) {
            MetadataService.deleteMetadata_element request_x = new MetadataService.deleteMetadata_element();
            request_x.type_x = type_x;
            request_x.fullNames = fullNames;
            MetadataService.deleteMetadataResponse_element response_x;
            Map<String, MetadataService.deleteMetadataResponse_element> response_map_x = new Map<String, MetadataService.deleteMetadataResponse_element>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
              this,
              request_x,
              response_map_x,
              new String[]{endpoint_x,
              '',
              'http://soap.sforce.com/2006/04/metadata',
              'deleteMetadata',
              'http://soap.sforce.com/2006/04/metadata',
              'deleteMetadataResponse',
              'MetadataService.deleteMetadataResponse_element'}
            );
            response_x = response_map_x.get('response_x');
            return response_x.result;
        }
        public MetadataService.SaveResult renameMetadata(String type_x,String oldFullName,String newFullName) {
            MetadataService.renameMetadata_element request_x = new MetadataService.renameMetadata_element();
            request_x.type_x = type_x;
            request_x.oldFullName = oldFullName;
            request_x.newFullName = newFullName;
            MetadataService.renameMetadataResponse_element response_x;
            Map<String, MetadataService.renameMetadataResponse_element> response_map_x = new Map<String, MetadataService.renameMetadataResponse_element>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
              this,
              request_x,
              response_map_x,
              new String[]{endpoint_x,
              '',
              'http://soap.sforce.com/2006/04/metadata',
              'renameMetadata',
              'http://soap.sforce.com/2006/04/metadata',
              'renameMetadataResponse',
              'MetadataService.renameMetadataResponse_element'}
            );
            response_x = response_map_x.get('response_x');
            return response_x.result;
        }
        public MetadataService.SaveResult[] updateMetadata(MetadataService.Metadata[] metadata) {
            MetadataService.updateMetadata_element request_x = new MetadataService.updateMetadata_element();
            request_x.metadata = metadata;
            MetadataService.updateMetadataResponse_element response_x;
            Map<String, MetadataService.updateMetadataResponse_element> response_map_x = new Map<String, MetadataService.updateMetadataResponse_element>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
              this,
              request_x,
              response_map_x,
              new String[]{endpoint_x,
              '',
              'http://soap.sforce.com/2006/04/metadata',
              'updateMetadata',
              'http://soap.sforce.com/2006/04/metadata',
              'updateMetadataResponse',
              'MetadataService.updateMetadataResponse_element'}
            );
            response_x = response_map_x.get('response_x');
            return response_x.result;
        }
        public MetadataService.DescribeMetadataResult describeMetadata(Double asOfVersion) {
            MetadataService.describeMetadata_element request_x = new MetadataService.describeMetadata_element();
            request_x.asOfVersion = asOfVersion;
            MetadataService.describeMetadataResponse_element response_x;
            Map<String, MetadataService.describeMetadataResponse_element> response_map_x = new Map<String, MetadataService.describeMetadataResponse_element>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
              this,
              request_x,
              response_map_x,
              new String[]{endpoint_x,
              '',
              'http://soap.sforce.com/2006/04/metadata',
              'describeMetadata',
              'http://soap.sforce.com/2006/04/metadata',
              'describeMetadataResponse',
              'MetadataService.describeMetadataResponse_element'}
            );
            response_x = response_map_x.get('response_x');
            return response_x.result;
        }
        public MetadataService.DeployResult checkDeployStatus(String asyncProcessId,Boolean includeDetails) {
            MetadataService.checkDeployStatus_element request_x = new MetadataService.checkDeployStatus_element();
            request_x.asyncProcessId = asyncProcessId;
            request_x.includeDetails = includeDetails;
            MetadataService.checkDeployStatusResponse_element response_x;
            Map<String, MetadataService.checkDeployStatusResponse_element> response_map_x = new Map<String, MetadataService.checkDeployStatusResponse_element>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
              this,
              request_x,
              response_map_x,
              new String[]{endpoint_x,
              '',
              'http://soap.sforce.com/2006/04/metadata',
              'checkDeployStatus',
              'http://soap.sforce.com/2006/04/metadata',
              'checkDeployStatusResponse',
              'MetadataService.checkDeployStatusResponse_element'}
            );
            response_x = response_map_x.get('response_x');
            return response_x.result;
        }
        public MetadataService.RetrieveResult checkRetrieveStatus(String asyncProcessId,Boolean includeZip) {
            MetadataService.checkRetrieveStatus_element request_x = new MetadataService.checkRetrieveStatus_element();
            request_x.asyncProcessId = asyncProcessId;
            request_x.includeZip = includeZip;
            MetadataService.checkRetrieveStatusResponse_element response_x;
            Map<String, MetadataService.checkRetrieveStatusResponse_element> response_map_x = new Map<String, MetadataService.checkRetrieveStatusResponse_element>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
              this,
              request_x,
              response_map_x,
              new String[]{endpoint_x,
              '',
              'http://soap.sforce.com/2006/04/metadata',
              'checkRetrieveStatus',
              'http://soap.sforce.com/2006/04/metadata',
              'checkRetrieveStatusResponse',
              'MetadataService.checkRetrieveStatusResponse_element'}
            );
            response_x = response_map_x.get('response_x');
            return response_x.result;
        }
        public MetadataService.AsyncResult retrieve(MetadataService.RetrieveRequest retrieveRequest) {
            MetadataService.retrieve_element request_x = new MetadataService.retrieve_element();
            request_x.retrieveRequest = retrieveRequest;
            MetadataService.retrieveResponse_element response_x;
            Map<String, MetadataService.retrieveResponse_element> response_map_x = new Map<String, MetadataService.retrieveResponse_element>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
              this,
              request_x,
              response_map_x,
              new String[]{endpoint_x,
              '',
              'http://soap.sforce.com/2006/04/metadata',
              'retrieve',
              'http://soap.sforce.com/2006/04/metadata',
              'retrieveResponse',
              'MetadataService.retrieveResponse_element'}
            );
            response_x = response_map_x.get('response_x');
            return response_x.result;
        }
        public MetadataService.CancelDeployResult cancelDeploy(String String_x) {
            MetadataService.cancelDeploy_element request_x = new MetadataService.cancelDeploy_element();
            request_x.String_x = String_x;
            MetadataService.cancelDeployResponse_element response_x;
            Map<String, MetadataService.cancelDeployResponse_element> response_map_x = new Map<String, MetadataService.cancelDeployResponse_element>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
              this,
              request_x,
              response_map_x,
              new String[]{endpoint_x,
              '',
              'http://soap.sforce.com/2006/04/metadata',
              'cancelDeploy',
              'http://soap.sforce.com/2006/04/metadata',
              'cancelDeployResponse',
              'MetadataService.cancelDeployResponse_element'}
            );
            response_x = response_map_x.get('response_x');
            return response_x.result;
        }

        public String deployRecentValidation(String validationId) {
            MetadataService.deployRecentValidation_element request_x = new MetadataService.deployRecentValidation_element();
            request_x.validationId = validationId;
            MetadataService.deployRecentValidationResponse_element response_x;
            Map<String, MetadataService.deployRecentValidationResponse_element> response_map_x = new Map<String, MetadataService.deployRecentValidationResponse_element>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
              this,
              request_x,
              response_map_x,
              new String[]{endpoint_x,
              '',
              'http://soap.sforce.com/2006/04/metadata',
              'deployRecentValidation',
              'http://soap.sforce.com/2006/04/metadata',
              'deployRecentValidationResponse',
              'MetadataService.deployRecentValidationResponse_element'}
            );
            response_x = response_map_x.get('response_x');
            return response_x.result;
        }
        public MetadataService.DescribeValueTypeResult describeValueType(String type_x) {
            MetadataService.describeValueType_element request_x = new MetadataService.describeValueType_element();
            request_x.type_x = type_x;
            MetadataService.describeValueTypeResponse_element response_x;
            Map<String, MetadataService.describeValueTypeResponse_element> response_map_x = new Map<String, MetadataService.describeValueTypeResponse_element>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
              this,
              request_x,
              response_map_x,
              new String[]{endpoint_x,
              '',
              'http://soap.sforce.com/2006/04/metadata',
              'describeValueType',
              'http://soap.sforce.com/2006/04/metadata',
              'describeValueTypeResponse',
              'MetadataService.describeValueTypeResponse_element'}
            );
            response_x = response_map_x.get('response_x');
            return response_x.result;
        }
        public MetadataService.SaveResult[] createMetadata(MetadataService.Metadata[] metadata) {
            MetadataService.createMetadata_element request_x = new MetadataService.createMetadata_element();
            request_x.metadata = metadata;
            MetadataService.createMetadataResponse_element response_x;
            Map<String, MetadataService.createMetadataResponse_element> response_map_x = new Map<String, MetadataService.createMetadataResponse_element>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
              this,
              request_x,
              response_map_x,
              new String[]{endpoint_x,
              '',
              'http://soap.sforce.com/2006/04/metadata',
              'createMetadata',
              'http://soap.sforce.com/2006/04/metadata',
              'createMetadataResponse',
              'MetadataService.createMetadataResponse_element'}
            );
            response_x = response_map_x.get('response_x');
            return response_x.result;
        }
        public MetadataService.AsyncResult deploy(String ZipFile,MetadataService.DeployOptions DeployOptions) {
            MetadataService.deploy_element request_x = new MetadataService.deploy_element();
            request_x.ZipFile = ZipFile;
            request_x.DeployOptions = DeployOptions;
            MetadataService.deployResponse_element response_x;
            Map<String, MetadataService.deployResponse_element> response_map_x = new Map<String, MetadataService.deployResponse_element>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
              this,
              request_x,
              response_map_x,
              new String[]{endpoint_x,
              '',
              'http://soap.sforce.com/2006/04/metadata',
              'deploy',
              'http://soap.sforce.com/2006/04/metadata',
              'deployResponse',
              'MetadataService.deployResponse_element'}
            );
            response_x = response_map_x.get('response_x');
            return response_x.result;
        }
        public MetadataService.IReadResult readMetadata(String type_x,String[] fullNames) {
            MetadataService.readMetadata_element request_x = new MetadataService.readMetadata_element();
            request_x.type_x = type_x;
            request_x.fullNames = fullNames;
            MetadataService.IReadResponseElement response_x;
            Map<String, MetadataService.IReadResponseElement> response_map_x = new Map<String, MetadataService.IReadResponseElement>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
              this,
              request_x,
              response_map_x,
              new String[]{endpoint_x,
              '',
              'http://soap.sforce.com/2006/04/metadata',
              'readMetadata',
              'http://soap.sforce.com/2006/04/metadata',
              'readMetadataResponse',
              'MetadataService.read' + type_x + 'Response_element'}
            );
            response_x = response_map_x.get('response_x');
            return response_x.getResult();
        }
        public MetadataService.UpsertResult[] upsertMetadata(MetadataService.Metadata[] metadata) {
            MetadataService.upsertMetadata_element request_x = new MetadataService.upsertMetadata_element();
            request_x.metadata = metadata;
            MetadataService.upsertMetadataResponse_element response_x;
            Map<String, MetadataService.upsertMetadataResponse_element> response_map_x = new Map<String, MetadataService.upsertMetadataResponse_element>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
              this,
              request_x,
              response_map_x,
              new String[]{endpoint_x,
              '',
              'http://soap.sforce.com/2006/04/metadata',
              'upsertMetadata',
              'http://soap.sforce.com/2006/04/metadata',
              'upsertMetadataResponse',
              'MetadataService.upsertMetadataResponse_element'}
            );
            response_x = response_map_x.get('response_x');
            return response_x.result;
        }
        public MetadataService.FileProperties[] listMetadata(MetadataService.ListMetadataQuery[] queries,Double asOfVersion) {
            MetadataService.listMetadata_element request_x = new MetadataService.listMetadata_element();
            request_x.queries = queries;
            request_x.asOfVersion = asOfVersion;
            MetadataService.listMetadataResponse_element response_x;
            Map<String, MetadataService.listMetadataResponse_element> response_map_x = new Map<String, MetadataService.listMetadataResponse_element>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
              this,
              request_x,
              response_map_x,
              new String[]{endpoint_x,
              '',
              'http://soap.sforce.com/2006/04/metadata',
              'listMetadata',
              'http://soap.sforce.com/2006/04/metadata',
              'listMetadataResponse',
              'MetadataService.listMetadataResponse_element'}
            );
            response_x = response_map_x.get('response_x');
            return response_x.result;
        }
    }
}