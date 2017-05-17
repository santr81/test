/**
 * Copyright (c) 2012, FinancialForce.com, inc
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without modification, 
 *   are permitted provided that the following conditions are met:
 *
 * - Redistributions of source code must retain the above copyright notice, 
 *      this list of conditions and the following disclaimer.
 * - Redistributions in binary form must reproduce the above copyright notice, 
 *      this list of conditions and the following disclaimer in the documentation 
 *      and/or other materials provided with the distribution.
 * - Neither the name of the FinancialForce.com, inc nor the names of its contributors 
 *      may be used to endorse or promote products derived from this software without 
 *      specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND 
 *  ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES 
 *  OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL 
 *  THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, 
 *  EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
 *  OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY
 *  OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 *  ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
**/

/**
 * This is a dummy test class to obtain 100% coverage for the generated WSDL2Apex code, it is not a funcitonal test class
 **/ 
@isTest  
private class MetadataServiceTest
{    
    /**
     * Dummy Metadata API web service mock class (see MetadataCreateJobTest.cls for a better example)
     **/
    private class WebServiceMockImpl implements WebServiceMock 
    {
        public void doInvoke(
            Object stub, Object request, Map<String, Object> response,
            String endpoint, String soapAction, String requestName,
            String responseNS, String responseName, String responseType) 
        {
            if(request instanceof MetadataService.retrieve_element)
                response.put('response_x', new MetadataService.retrieveResponse_element());
            else if(request instanceof MetadataService.checkDeployStatus_element)
                response.put('response_x', new MetadataService.checkDeployStatusResponse_element());
            else if(request instanceof MetadataService.listMetadata_element)
                response.put('response_x', new MetadataService.listMetadataResponse_element());
            else if(request instanceof MetadataService.checkRetrieveStatus_element)
                response.put('response_x', new MetadataService.checkRetrieveStatusResponse_element());
            else if(request instanceof MetadataService.describeMetadata_element)
                response.put('response_x', new MetadataService.describeMetadataResponse_element());
            else if(request instanceof MetadataService.deploy_element)
                response.put('response_x', new MetadataService.deployResponse_element());
            else if(request instanceof MetadataService.updateMetadata_element)
                response.put('response_x', new MetadataService.updateMetadataResponse_element());
            else if(request instanceof MetadataService.renameMetadata_element)
                response.put('response_x', new MetadataService.renameMetadataResponse_element());
            else if(request instanceof  MetadataService.cancelDeploy_element)
                response.put('response_x', new MetadataService.cancelDeployResponse_element());
            else if(request instanceof  MetadataService.deleteMetadata_element)
                response.put('response_x', new MetadataService.deleteMetadataResponse_element());
            else if(request instanceof  MetadataService.upsertMetadata_element)
                response.put('response_x', new MetadataService.upsertMetadataResponse_element());
            else if(request instanceof  MetadataService.createMetadata_element)
                response.put('response_x', new MetadataService.createMetadataResponse_element());
            else if(request instanceof  MetadataService.deployRecentValidation_element)
                response.put('response_x', new MetadataService.deployRecentValidationResponse_element());
            else if(request instanceof MetadataService.describeValueType_element)
                response.put('response_x', new MetadataService.describeValueTypeResponse_element());
            else if(request instanceof MetadataService.checkRetrieveStatus_element)
                response.put('response_x', new MetadataService.checkRetrieveStatusResponse_element());
            return;
        }
    }    
        
    @IsTest
    private static void coverGeneratedCodeCRUDOperations()
    {   
        // Null Web Service mock implementation
        System.Test.setMock(WebServiceMock.class, new WebServiceMockImpl());
        // Only required to workaround a current code coverage bug in the platform
        MetadataService metaDataService = new MetadataService();
        // Invoke operations         
        MetadataService.MetadataPort metaDataPort = new MetadataService.MetadataPort();
    }
    
    @IsTest
    private static void coverGeneratedCodeFileBasedOperations1()
    {       
        // Null Web Service mock implementation
        System.Test.setMock(WebServiceMock.class, new WebServiceMockImpl());
        // Only required to workaround a current code coverage bug in the platform
        MetadataService metaDataService = new MetadataService();
        // Invoke operations         
        MetadataService.MetadataPort metaDataPort = new MetadataService.MetadataPort();
        metaDataPort.retrieve(null);
        metaDataPort.checkDeployStatus(null, false);
        metaDataPort.listMetadata(null, null);
        metaDataPort.describeMetadata(null);
        metaDataPort.deploy(null, null);
        metaDataPort.checkDeployStatus(null, false);
        metaDataPort.updateMetadata(null);
        metaDataPort.renameMetadata(null, null, null);
        metaDataPort.cancelDeploy(null);
    }

    @IsTest
    private static void coverGeneratedCodeFileBasedOperations2()
    {       
        // Null Web Service mock implementation
        System.Test.setMock(WebServiceMock.class, new WebServiceMockImpl());
        // Only required to workaround a current code coverage bug in the platform
        MetadataService metaDataService = new MetadataService();
        // Invoke operations         
        MetadataService.MetadataPort metaDataPort = new MetadataService.MetadataPort();
        metaDataPort.deleteMetadata(null, null);
        metaDataPort.upsertMetadata(null);
        metaDataPort.createMetadata(null);
        metaDataPort.deployRecentValidation(null);
        metaDataPort.describeValueType(null);
        metaDataPort.checkRetrieveStatus(null, null);
    }
        
    @IsTest
    private static void coverGeneratedCodeTypes()
    {              
        // Reference types
        new MetadataService();
        new MetadataService.listMetadataResponse_element();
        new MetadataService.checkDeployStatus_element();
        new MetadataService.CodeCoverageWarning();
        new MetadataService.CustomDataType();
        new MetadataService.DescribeMetadataResult();
        new MetadataService.RecordType();
        new MetadataService.FilterItem();
        new MetadataService.Profile();
        new MetadataService.PermissionSetApexClassAccess();
        new MetadataService.LogInfo();
        new MetadataService.ObjectNameCaseValue();
        new MetadataService.CallOptions_element();
        new MetadataService.describeMetadataResponse_element();
        new MetadataService.DeployMessage();
        new MetadataService.CodeCoverageResult();
        new MetadataService.RecordTypePicklistValue();
        new MetadataService.describeMetadata_element();
        new MetadataService.DashboardFilterColumn();
        new MetadataService.ProfileObjectPermissions();
        new MetadataService.RetrieveResult();
        new MetadataService.retrieve_element();
        new MetadataService.DescribeMetadataObject();
        new MetadataService.RunTestSuccess();
        new MetadataService.CustomField();
        new MetadataService.deployResponse_element();
        new MetadataService.FileProperties();
        new MetadataService.BusinessProcess();
        new MetadataService.ListView();
        new MetadataService.AsyncResult();
        new MetadataService.ArticleTypeChannelDisplay();
        new MetadataService.checkRetrieveStatus_element();
        new MetadataService.ProfileLayoutAssignment();
        new MetadataService.RelatedListItem();
        new MetadataService.RetrieveRequest();
        new MetadataService.ListMetadataQuery();
        new MetadataService.FieldSet();
        new MetadataService.ProfileApexClassAccess();
        new MetadataService.DebuggingHeader_element();
        new MetadataService.CustomLabel();
        new MetadataService.RunTestFailure();
        new MetadataService.Picklist();
        new MetadataService.listMetadata_element();
        new MetadataService.MetadataWithContent();
        new MetadataService.Metadata();
        new MetadataService.RetrieveMessage();
        new MetadataService.SessionHeader_element();
        new MetadataService.DeployOptions();
        new MetadataService.ProfileApplicationVisibility();
        new MetadataService.CustomApplicationComponents();
        new MetadataService.ProfileTabVisibility();
        new MetadataService.ActionOverride();
        new MetadataService.PermissionSetApexPageAccess();
        new MetadataService.CustomObject();
        new MetadataService.CustomLabels();
        new MetadataService.PackageTypeMembers();
        new MetadataService.PicklistValue();
        new MetadataService.RemoteSiteSetting();
        new MetadataService.deploy_element();
        new MetadataService.retrieveResponse_element();
        new MetadataService.ArticleTypeTemplate();
        new MetadataService.ObjectRelationship();
        new MetadataService.ListPlacement();
        new MetadataService.CustomTab();
        new MetadataService.ProfileRecordTypeVisibility();
        new MetadataService.PackageVersion();
        new MetadataService.checkRetrieveStatusResponse_element();
        new MetadataService.ProfileFieldLevelSecurity();
        new MetadataService.RunTestsResult();
        new MetadataService.ProfileLoginHours();
        new MetadataService.CodeLocation();
        new MetadataService.FieldSetItem();
        new MetadataService.CustomDataTypeComponent();
        new MetadataService.DebuggingInfo_element();
        new MetadataService.Package_x();
        new MetadataService.SessionSettings();
        new MetadataService.DeployResult();
        new MetadataService.ProfileApexPageAccess();
        new MetadataService.checkDeployStatusResponse_element();
        new MetadataService.ProfileExternalDataSourceAccess();
        new MetadataService.AuthProvider();
        new MetadataService.State();
        new MetadataService.ApprovalPageField();
        new MetadataService.ApprovalStepRejectBehavior();
        new MetadataService.ApprovalEntryCriteria();                                
        new MetadataService.SamlSsoConfig();
        new MetadataService.ApprovalSubmitter();
        new MetadataService.ConnectedAppOauthConfig();
        new MetadataService.renameMetadata_element();
        new MetadataService.deleteMetadataResponse_element();
        new MetadataService.ConnectedAppIpRange();
        new MetadataService.Error();
        new MetadataService.SaveResult();
        new MetadataService.readMetadataResponse_element();
        new MetadataService.deleteMetadata_element();
        new MetadataService.AccountSettings();
        new MetadataService.ProfileUserPermission();
        new MetadataService.createMetadataResponse_element();
        new MetadataService.updateMetadata_element();
        new MetadataService.LookupFilter();
        new MetadataService.updateMetadataResponse_element();
        new MetadataService.ConnectedAppSamlConfig();
        new MetadataService.createMetadata_element();
        new MetadataService.readMetadata_element();
        new MetadataService.ReadCustomLabelResult();
        new MetadataService.readCustomLabelResponse_element();
        new MetadataService.ReadCustomDataTypeResult();
        new MetadataService.readCustomDataTypeResponse_element();
        new MetadataService.ReadProfileResult();
        new MetadataService.readProfileResponse_element();
        new MetadataService.ReadCustomObjectResult();
        new MetadataService.readCustomObjectResponse_element();
        new MetadataService.ReadCustomLabelsResult();
        new MetadataService.readCustomLabelsResponse_element();
        new MetadataService.ReadPicklistValueResult();
        new MetadataService.readPicklistValueResponse_element();
        new MetadataService.ReadRemoteSiteSettingResult();
        new MetadataService.readRemoteSiteSettingResponse_element();
        new MetadataService.ReadCustomFieldResult();
        new MetadataService.readCustomFieldResponse_element();
        new MetadataService.ReadPackageResult();
        new MetadataService.readPackageResponse_element();
        new MetadataService.ReadFieldSetResult();
        new MetadataService.readFieldSetResponse_element();
        new MetadataService.DeployDetails();
        new MetadataService.renameMetadataResponse_element();
        new MetadataService.cancelDeploy_element();
        new MetadataService.CancelDeployResult();
        new MetadataService.cancelDeployResponse_element();
        new MetadataService.CompactLayout();
        new MetadataService.DeleteResult();
        new MetadataService.CustomMetadata();
        new MetadataService.RelatedList();
        new MetadataService.CustomPermission();
        new MetadataService.upsertMetadata_element();
        new MetadataService.ProfileCustomPermissions();
        new MetadataService.upsertMetadataResponse_element();
        new MetadataService.ReadCustomPermissionResult();
        new MetadataService.readCustomPermissionResponse_element();
        new MetadataService.ReadCustomMetadataResult();
        new MetadataService.readCustomMetadataResponse_element();
        new MetadataService.ReadNameSettingsResult();
        new MetadataService.readNameSettingsResponse_element();
        new MetadataService.NameSettings();
        new MetadataService.VisualizationType();
        new MetadataService.CustomMetadataValue();
        new MetadataService.HistoryRetentionPolicy();
        new MetadataService.UpsertResult();
        new MetadataService.StandardFieldTranslation();
        new MetadataService.FieldValue();
        new MetaDataService.deployRecentValidationResponse_element();
        new MetaDataService.describeValueType_element();
        new MetaDataService.deployRecentValidation_element();
        new MetaDataService.NamedCredential();
        new MetaDataService.DescribeValueTypeResult();
        new MetaDataService.ReadNamedCredentialResult();
        new MetaDataService.readNamedCredentialResponse_element();
        new MetaDataService.PicklistEntry();
        new MetaDataService.ValueTypeField();
        
    }

    @IsTest
    private static void elfMissingGetRecordsTest() { // elf patch
        new MetadataService.ReadProfileResult().getRecords();
        new MetadataService.ReadRemoteSiteSettingResult().getRecords();
        new MetadataService.ReadPackageResult().getRecords();
        new MetadataService.ReadCustomMetadataResult().getRecords();
        new MetadataService.ReadNameSettingsResult().getRecords();
        new MetadataService.ReadCustomPermissionResult().getRecords();
        new MetadataService.ReadNamedCredentialResult().getRecords();
        new MetadataService.ReadMetadataWithContentResult().getRecords();
        new MetadataService.ReadCustomFieldResult().getRecords();
        new MetadataService.ReadFieldSetResult().getRecords();
        new MetadataService.ReadPicklistValueResult().getRecords();
        new MetadataService.ReadCustomObjectResult().getRecords();
        new MetadataService.ReadCustomLabelsResult().getRecords();
        new MetadataService.ReadCustomLabelResult().getRecords();
        new MetadataService.ReadCustomDataTypeResult().getRecords();
    }

    @IsTest
    private static void elfMissingGetResultTest() { // elf patch
        new MetadataService.readCustomLabelResponse_element().getResult();
        new MetadataService.readCustomDataTypeResponse_element().getResult();
        new MetadataService.readProfileResponse_element().getResult();
        new MetadataService.readCustomObjectResponse_element().getResult();
        new MetadataService.readCustomLabelsResponse_element().getResult();
        new MetadataService.readRemoteSiteSettingResponse_element().getResult();
        new MetadataService.readCustomFieldResponse_element().getResult();
        new MetadataService.readCustomMetadataResponse_element().getResult();
        new MetadataService.readNameSettingsResponse_element().getResult();
        new MetadataService.readCustomPermissionResponse_element().getResult();
        new MetadataService.readNamedCredentialResponse_element().getResult();
        new MetadataService.readMetadataWithContentResponse_element().getResult();
    }    
}