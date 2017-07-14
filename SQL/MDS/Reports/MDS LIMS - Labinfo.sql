-- *****************************
-- *** MDS LA Labinfo LIMS
-- *****************************

USE [EdenMDS-PRD]

SELECT DISTINCT
	ORGSSO.Name					AS	[Organisation Name]
	, ORGSSO.Code				AS	[Org Code]
	, ORT.StaticName_ort		AS	[Organisation Type]
	, LIM.Name_lim				AS	[LIMS Name]
	, LIM.Description_lim		AS	[LIMS Description]
	, LIM.InstallationId_lim
	, MAX(ULD.UploadDate_uld)	AS	[Last Upload From LIMS]

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
LEFT JOIN	dbo.tblUpload_uld						ULD		ON ULD.TargetLims_uld			= LIM.InstallationId_lim

WHERE	ORT.StaticName_ort	=	'LocalAuthority'
AND		(
		LIM.Description_lim LIKE '%LABINFO%'
		OR
		LIM.Name_lim		LIKE '%LABINFO%'
		)
AND		YEAR(ULD.UploadDate_uld) = 2016

GROUP BY
	 ORGSSO.Name
	 , ORGSSO.Code
	 , ORT.StaticName_ort
	 , LIM.Name_lim
	 , LIM.Description_lim
	 , LIM.InstallationId_lim

ORDER BY	[Organisation Type], [Organisation Name]






/*
	--, ADDSSO.AddressLine1
	--, ADDSSO.AddressLine2
	--, ADDSSO.AddressLine3
	--, ADDSSO.Phone
	--, ADDSSO.Fax
	--, ADDSSO.PostCode
	--, CNTSSO.Name				AS	[County]
	--, CTRYSSO.CountryName		AS	[Country]
	--, LIM.LastUpdateDate_lim

--*/