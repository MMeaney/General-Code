-- *****************************
-- *** MDS Organisation Details
-- *****************************

USE [EdenMDS-PRD]

SELECT DISTINCT
	 ORGSSO.Name				AS	[Organisation Name]
	 , ORGSSO.Code				AS	[Org Code]
	 , ORT.StaticName_ort		AS	[Organisation Type]
	 , ADDSSO.AddressLine1
	 , ADDSSO.AddressLine2
	 , ADDSSO.AddressLine3
	 , ADDSSO.Phone
	 , ADDSSO.Fax
	 , ADDSSO.PostCode
	 , CNTSSO.Name				AS	[County]
	 , CTRYSSO.CountryName		AS	[Country]
	 , ORG.OrganisationId_org

FROM		dbo.tblOrganisation_org					ORG
LEFT JOIN	dbo.tblOrganisationAddress_oad			OAD		ON OAD.OrganisationId_org		= ORG.OrganisationId_org
LEFT JOIN	dbo.tblStringDefinition_std				STD1	ON STD1.StringID_stg			= ORG.Name_stg
LEFT JOIN	dbo.tblOrganisationType_ort				ORT		ON ORT.OrganisationTypeId_ort	= ORG.OrganisationTypeId_ort
LEFT JOIN	dbo.tblGeoEntity_gen					GEN		ON GEN.ObjectID_gen				= ORG.OrganisationId_org
LEFT JOIN	dbo.tblGeoLayer_gla						GLA		ON GLA.LayerID_gla				= GEN.LayerID_gla
LEFT JOIN	dbo.tblGeoLayerType_glt					GLT		ON GLT.LayerTypeID_glt			= GLA.LayerTypeID_glt
LEFT JOIN	dbo.tblStringDefinition_std				STD2	ON STD2.StringID_stg			= GLT.Name_stg
LEFT JOIN	dbo.tblCounty_cnt						CNT		ON CNT.CountyId_cnt				= OAD.CountyId_cnt
LEFT JOIN	dbo.tblStringDefinition_std				STD3	ON STD3.StringID_stg			= CNT.Name_stg
LEFT JOIN	[EdenSSO-PRD].dbo.Organisation			ORGSSO	ON ORGSSO.Code					= ORG.StaticName_org
LEFT JOIN	[EdenSSO-PRD].dbo.OrganisationAddress	ADDSSO	ON ADDSSO.OrganisationId		= ORGSSO.OrganisationId
LEFT JOIN	[EdenSSO-PRD].dbo.County				CNTSSO	ON ADDSSO.CountyId				= CNTSSO.CountyId
LEFT JOIN	[EdenSSO-PRD].dbo.Country				CTRYSSO	ON ADDSSO.CountryId				= CTRYSSO.CountryId
LEFT JOIN	dbo.tblLimsInstallations_lim			LIM		ON LIM.OwnerOrganisationId_org	= ORG.OrganisationId_org

WHERE	STD1.LanguageID_lan =  '1'
AND		STD2.LanguageID_lan =  '1'

ORDER BY	[Organisation Type], [Organisation Name]







/*
-- ****************************

/*

	 , COUNTY.StaticName		AS	[County2]
	 --, ORG.StaticName_org
	 --, STD1.Content_std			AS	[Organisation Name]
	 --, STD2.Content_std
	 --, OAD.OrganisationId_org
	 --, OAD.AddressLine1_oad
	 --, OAD.AddressLine2_oad
	 --, OAD.AddressLine3_oad
	 --, CNT.StaticName_cnt
	 --, OAD.Phone_oad
	 --, OAD.Fax_oad
	 --, OAD.PostCode_oad
	 --, OAD.Country_oad
*/


--SELECT * FROM [EdenSSO-PRD].dbo.Organisation

	 --, OAD.CountyId_cnt
	 --, ORG.OrganisationTypeId_ort
	 --, ORG.Name_stg
	 --, ORG.LastUpdatedBy_usr
	 --, ORG.LastUpdateDate_org
	 --, ORG.LastUpdatedOn_org
	 --, ORG.OrgCrmID_org
	 --, STD1.StringID_stg
	 --, STD1.LanguageID_lan
	 --, STD1.LastUpdateDate_std
	 --, STD1.LastUpdatedBy_usr
	 --, ORT.OrganisationTypeId_ort
	 --, ORT.Name_stg
	 --, ORT.LastUpdatedBy_usr
	 --, ORT.LastUpdateDate_ort
	 --, GEN.ObjectID_gen
	 --, GEN.LayerID_gla
	 --, GEN.LastUpdatedBy_usr
	 --, GEN.LastUpdateDate_gen	 
	 --, GLA.LayerID_gla
	 --, GLA.LayerTypeID_glt
	 --, GLA.LastUpdatedBy_usr
	 --, GLA.LastUpdateDate_gla
	 --, GLT.LayerTypeID_glt
	 --, GLT.Name_stg
    --, GLT.StaticName_glt
	 --, STD2.StringID_stg
	 --, STD2.LanguageID_lan
	 --, STD2.LastUpdateDate_std
	 --, STD2.LastUpdatedBy_usr
	 --, OAD.LastUpdatedOn_oad

--SELECT  DISTINCT
--	 CNT.CountyId_cnt
--	 , CNT.StaticName_cnt
--	 , CNT.Name_stg
--	 , CNT.CrmOptionSetValue_cnt
--	 , STD3.Content_std
--FROM			dbo.tblCounty_cnt					  CNT
--LEFT JOIN	dbo.tblStringDefinition_std	  STD3 ON STD3.StringID_stg			  = CNT.Name_stg



--SELECT DISTINCT 
--	 OAR.OrganisationAccessRequestID_oar
--	 , OAR.FromOrganisationId_org
--	 , OAR.TargetOrganisationId_org
--	 , OAR.DataType_met
--	 , OAR.RequestDate_oar
--	 , OAR.RequestedBy_usr
--	 , OAR.Reason_oar
--FROM dbo.tblOrganisationAccessRequest_oar OAR

--SELECT DISTINCT
--	 PER.GivingOrganisationId_gen
--	 , PER.ReceivingOrganisationId_gen
--	 , PER.DataType_gla
--	 , PER.AuthorizationPurposeID_aup
--	 , PER.LastUpdateDate_per
--	 , PER.LastUpdatedBy_per
--FROM [EdenMDS-PRD].dbo.tblOrganisationPermission_per	  PER

--*/