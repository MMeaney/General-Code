USE [EdenMDS-PRD]
SELECT DISTINCT
	SHT.StationHistoryId_sta
	, SHT.StationId_sta
	--, SHT.StationTypeId_stt
	, STT.StaticName_stt			AS [StationType]
	, SHT.Version_sht
	, SHT.Deleted_sta
	, SHT.NationalCode_sht
	, SHT.Name_sht
	--, SHT.LocalAuthorityId_org
	, SORSTA.Name					AS	[LA Name]
	, SORSTA.Code					AS	[LA Code]
	--, SHT.RiverBasinDistrictId_org
	, STDRBDSTA.Content_std			AS [StationRBDName]
	, RBDSTA.StaticName_org			AS [StationRBD]
	--, SHT.MonitoredEntityId_men
	, MEN.NationalCode_men			AS	[EDEN Entity Code]
	, MEN.Name_men					AS	[Mon Ent Name]
	--, SHT.ApprovedBy_usr
	, LTRIM(RTRIM(UPD.FirstName_usr)) + ' ' + LTRIM(RTRIM(UPD.LastName_usr)) AS	[UpdatedBy]
	, SHT.WFDWiseCode_sht
	, SHT.LocalCode_sht
	, SHT.Easting_sht
	, SHT.Northing_sht
	, SHT.EQR_sht
	, SHT.QValue_sht
	, SHT.WaterBodyCode_sht
	, SHT.RevisionComment_sht	
	, LTRIM(RTRIM(UAP.FirstName_usr)) + ' ' + LTRIM(RTRIM(UAP.LastName_usr)) AS	[ApprovedBy]
	--, SHT.LastUpdatedBy_usr
	, SHT.LastUpdateDate_sht
	, SHT.UploadId_uld
	, SHT.ApprovedOn_sht
	, SHT.MonitoredEntityWFDWiseCode_sht
	--, SHT.CreatedByOrganisation_org
	, SORCRTSTA.Name					AS	[Created by Org]

FROM		dbo.tblStationHistory_sht		SHT
INNER JOIN	dbo.tblStationType_stt			STT			ON	STT.StationTypeId_stt		= SHT.StationTypeId_stt
LEFT JOIN	dbo.tblStation_sta				STA			ON	STA.StationId_sta			= SHT.StationId_sta
LEFT JOIN	dbo.tblMonitoredEntity_men		MEN			ON	MEN.MonitoredEntityId_men	= SHT.MonitoredEntityId_men
LEFT JOIN	dbo.tblUser_usr					UPD			ON	UPD.UserID_usr				= SHT.LastUpdatedBy_usr
LEFT JOIN	dbo.tblUser_usr					UAP			ON	UAP.UserID_usr				= SHT.ApprovedBy_usr
LEFT JOIN	dbo.tblOrganisation_org			ORGSTA		ON	ORGSTA.OrganisationId_org		= SHT.LocalAuthorityId_org
LEFT JOIN	dbo.tblOrganisation_org			ORGCRTSTA	ON	ORGCRTSTA.OrganisationId_org	= SHT.CreatedByOrganisation_org
LEFT JOIN	[EdenSSO-PRD].dbo.Organisation  SORSTA		ON	SORSTA.Code						= ORGSTA.StaticName_org
LEFT JOIN	[EdenSSO-PRD].dbo.Organisation  SORCRTSTA	ON	SORCRTSTA.Code					= ORGSTA.StaticName_org
LEFT JOIN	dbo.tblOrganisation_org			RBDSTA		ON	RBDSTA.OrganisationId_org		= SHT.RiverBasinDistrictId_org
LEFT JOIN	dbo.tblOrganisation_org			RBDMEN		ON	RBDMEN.OrganisationId_org		= MEN.OwnerOrganisationId_org
INNER JOIN	dbo.tblOrganisationType_ort		ORTRBD		ON	RBDSTA.OrganisationTypeId_ort	= ORTRBD.OrganisationTypeId_ort 
INNER JOIN	dbo.tblStringMaster_stg			STGRBDSTA	ON	RBDSTA.Name_stg					= STGRBDSTA.StringID_stg
INNER JOIN	dbo.tblStringDefinition_std		STDRBDSTA	ON	STGRBDSTA.StringID_stg			= STDRBDSTA.StringID_stg
INNER JOIN	dbo.tblStringMaster_stg			STGRBDMEN	ON	RBDMEN.Name_stg					= STGRBDMEN.StringID_stg
INNER JOIN	dbo.tblStringDefinition_std		STDRBDMEN	ON	STGRBDMEN.StringID_stg			= STDRBDMEN.StringID_stg

WHERE	STDRBDSTA.LanguageID_lan = '1'
AND		SHT.NationalCode_sht IN
(
'RS34Y020255'
)
	


ORDER BY SHT.NationalCode_sht, SHT.LastUpdateDate_sht






/*
--WHERE		SHT.StationTypeId_stt = '13'
--AND			SHT.MonitoredEntityId_men = '3590'
--WHERE WaterBodyCode_sht = 'SH_26_608'
--*/