-- *******************************************************
-- *** List of monitored entities and stations in MDS
-- *******************************************************

USE [EdenMDS-PRD]

SELECT DISTINCT
	STA.NationalCode_sta		AS [Station Code]
	, STA.Name_sta				AS [Station Name]
	, MEN.NationalCode_men		AS [Eden_EntityCode]
	, MEN.Name_men				AS [Eden_EntityName]
	, SOR.Code					AS [Eden_LACode]
	, SOR.Name					AS [Eden_LAName]
	, MET.Name_met				AS [Eden_DataType]
	, ORGRBD.StaticName_org		AS [RBD]
	, STA.Easting_sta
	, STA.Northing_sta
	--, SCT.Name_sct				AS [SchemeType]

	--, COUNT(SAM)
	--, STA.WFDWiseCode_sta
	--, STA.MonitoredEntityWFDWiseCode_sta AS [WbWfdWiseCode]
	----, STA.StationId_sta			AS [EdenMonitoringStation_id]
	----, STA.LastUpdateDate_sta	AS [Eden_LastUpdatedDate]
	----, STA.RevisionComment_sta	AS [Eden_RevisionComment]
	----, STA.Version_sta			AS [Eden_Version]
	----, LTRIM(RTRIM(US1.FirstName_usr))  + ' ' + LTRIM(RTRIM(US1.LastName_usr))	AS	[ApprovedBy]
	----, STA.*
	----, MEN.*

FROM		dbo.tblMonitoredEntity_men		MEN
LEFT JOIN	dbo.tblMonitoredEntityType_met  MET		ON	MET.MonitoredEntityTypeID_met	= MEN.MonitoredEntityTypeID_met
LEFT JOIN	dbo.tblStation_sta				STA		ON	STA.MonitoredEntityId_men		= MEN.MonitoredEntityId_men
----LEFT JOIN	dbo.tblSample_sam				SAM		ON	SAM.StationID_sta				= STA.StationId_sta
LEFT JOIN	dbo.tblUser_usr					US1		ON	US1.UserId_usr					= STA.ApprovedBy_usr
LEFT JOIN	dbo.tblOrganisation_org			ORG		ON	ORG.OrganisationId_org			= STA.LocalAuthorityId_org
LEFT JOIN	dbo.tblOrganisation_org			ORGRBD	ON	ORGRBD.OrganisationId_org		= STA.RiverBasinDistrictId_org
LEFT JOIN	dbo.tblOrganisation_org			ORGCRT	ON	ORGCRT.OrganisationId_org		= STA.CreatedByOrganisation_org
LEFT JOIN	[EdenSSO-PRD].dbo.Organisation  SOR		ON	SOR.Code						= ORG.StaticName_org
LEFT JOIN	[EdenSSO-PRD].dbo.Organisation  SORCRT	ON	SORCRT.Code						= ORG.StaticName_org
--LEFT JOIN	dbo.tblSchemeYear_scy			SCY		ON	SCY.SchemeType_sct		= MEN.MonitoredEntityId_men
--LEFT JOIN	dbo.tblSchemeType_sct			SCT		ON	SCT.SchemeTypeID_sct			= SCY.SchemeType_sct
----LEFT JOIN	dbo.tblReturnYear_rty			RTY		ON	RTY.ReturnYear_rty				= SCY.ReturnYear_rty
----LEFT JOIN	dbo.tblReturnYearStatus_rst		RST		ON	RST.StatusID_rst				= RTY.StatusID_rst

WHERE	MET.Name_met	= 'Drinking Water Private Scheme'
AND		STA.NationalCode_sta IS NOT NULL
--'Drinking Water Private Scheme' 'Bathing Water'
--GROUP BY STA.NationalCode_sta, STA.Name_sta, MEN.NationalCode_men, MEN.Name_men, SOR.Code, SOR.Name, MET.Name_met, ORGRBD.StaticName_org, STA.Easting_sta, STA.Northing_sta
ORDER BY SOR.Name, STA.NationalCode_sta



--SELECT * FROM tblMonitoredEntityType_met

--STA.NationalCode_sta LIKE '%06T010350%'

--WHERE	MEN.Name_men LIKE '%Corrib Upper%'

/*
WHERE		STA.NationalCode_sta IN
(
'LS070015911706310',
'LS070015911706320',
'LS070015911706330',
'LS070015911706340',
'LS070015911706350',
'LS260155a03226310',
'LS260155a03226320'
)

/*
(
'LS070015911700010',
'LS070015911700020',
'LS070015911700030',
'LS070015911700040',
'LS070015911703100',
'LS260155a03220010',
'LS260155a03223100'
)
*/
AND			MEN.MonitoredEntityTypeID_met = '6'

ORDER BY 	STA.NationalCode_sta
*/




--SELECT * FROM tblMonitoredEntity_men WHERE MonitoredEntityTypeId_met = '33'



--SELECT DISTINCT MEN.MonitoredEntityTypeId_met, MET.StaticName_met
--FROM		dbo.tblMonitoredEntity_men		MEN
--LEFT JOIN	dbo.tblMonitoredEntityType_met  MET		ON	MET.MonitoredEntityTypeID_met	= MEN.MonitoredEntityTypeID_met




/*
SELECT * FROM dbo.tblStation_sta	WHERE NationalCode_sta	= 'LS260155a03220010'
SELECT * FROM dbo.tblStation_sta	WHERE StationId_sta		= '86284' -- StationId_sta = '86284'
SELECT * FROM dbo.tblStation_sta	WHERE NationalCode_sta	= 'LS260155a03223100' -- StationId_sta = N/A
SELECT * FROM dbo.tblStation_sta	WHERE WFDWiseCode_sta	= 'IEMLSH_26_750d_3100_S'
--LS260155a03220010	Change to LS260155a03226310	Killinure - Ballykeeran station 10
--LS260155a03223100	Change to LS260155a03226320	SH_26_750d_LIT_0010


*/



-- **************************************************

--SELECT * FROM tblMonitoredEntity_men

--SELECT * FROM tblMonitoredEntityType_met
--SELECT * FROM tblMonitoredEntity_men		WHERE MonitoredEntityTypeID_met = '33'

