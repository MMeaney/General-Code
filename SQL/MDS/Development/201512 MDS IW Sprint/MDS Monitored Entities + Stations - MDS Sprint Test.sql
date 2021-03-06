-- *******************************************************
-- *** List of monitored entities and stations in MDS
-- *******************************************************

USE [EdenMDS-TST]

SELECT DISTINCT
	STA.NationalCode_sta		AS [Station Code]
	, STA.Name_sta				AS [Station Name]
	--, SCY.*
	, MEN.NationalCode_men		AS [Eden_EntityCode]
	, MEN.Name_men				AS [Eden_EntityName]
	, SOR.Code					AS [Eden_LACode]
	, SOR.Name					AS [Eden_LAName]
	, MET.Name_met				AS [Eden_DataType]
	, ORGRBD.StaticName_org		AS [RBD]
	, STDRBD.Content_std		AS [RBDName]
	, STA.Easting_sta
	, STA.Northing_sta
	, STT.StaticName_stt		AS [StationType]

FROM		dbo.tblMonitoredEntity_men		MEN
LEFT JOIN	dbo.tblMonitoredEntityType_met  MET		ON	MET.MonitoredEntityTypeID_met	= MEN.MonitoredEntityTypeID_met
LEFT JOIN	dbo.tblStation_sta				STA		ON	STA.MonitoredEntityId_men		= MEN.MonitoredEntityId_men
LEFT JOIN	dbo.tblSample_sam				SAM		ON	SAM.StationID_sta				= STA.StationId_sta
LEFT JOIN	dbo.tblUser_usr					US1		ON	US1.UserId_usr					= STA.ApprovedBy_usr
LEFT JOIN	dbo.tblOrganisation_org			ORG		ON	ORG.OrganisationId_org			= STA.LocalAuthorityId_org
LEFT JOIN	dbo.tblOrganisation_org			ORGRBD	ON	ORGRBD.OrganisationId_org		= STA.RiverBasinDistrictId_org
LEFT JOIN	dbo.tblOrganisation_org			ORGCRT	ON	ORGCRT.OrganisationId_org		= STA.CreatedByOrganisation_org
LEFT JOIN	[EdenSSO-TST].dbo.Organisation  SOR		ON	SOR.Code						= ORG.StaticName_org
LEFT JOIN	[EdenSSO-TST].dbo.Organisation  SORCRT	ON	SORCRT.Code						= ORG.StaticName_org
INNER JOIN	dbo.tblOrganisationType_ort		ORTRBD	ON	ORGRBD.OrganisationTypeId_ort	= ORTRBD.OrganisationTypeId_ort 
INNER JOIN	dbo.tblStringMaster_stg			STGRBD	ON	ORGRBD.Name_stg					= STGRBD.StringID_stg 
INNER JOIN	dbo.tblStringDefinition_std		STDRBD	ON	STGRBD.StringID_stg				= STDRBD.StringID_stg
INNER JOIN	dbo.tblStationType_stt			STT		ON STT.StationTypeId_stt			= STA.StationTypeId_stt
--WHERE        (dbo.tblOrganisationType_ort.StaticName_ort = 'RBD') AND (dbo.tblStringDefinition_std.LanguageID_lan = '1') 
--LEFT JOIN	dbo.tblSchemeYear_scy			SCY		ON	SCY.SchemeType_sct		= MEN.MonitoredEntityId_men
--LEFT JOIN	dbo.tblSchemeType_sct			SCT		ON	SCT.SchemeTypeID_sct			= SCY.SchemeType_sct
----LEFT JOIN	dbo.tblReturnYear_rty			RTY		ON	RTY.ReturnYear_rty				= SCY.ReturnYear_rty
----LEFT JOIN	dbo.tblReturnYearStatus_rst		RST		ON	RST.StatusID_rst				= RTY.StatusID_rst

WHERE	STDRBD.LanguageID_lan = '1'
AND		MET.Name_met LIKE '%PRIV%'
--AND		STA.NationalCode_sta LIKE 'TPEFF0500D044%SW001%' 
--TPEFF0500D0444SW001
--TPEFF0500D0444GW001
--AND		STA.Name_sta LIKE '%Churchtown%' --'Churchtown-D0444-01--GW001-Discharge to Mitchelstown Groundwater Body'
--AND		STT.StaticName_stt = 'UWW_DISCHARGE_STATION'
--AND		MEN.Name_men LIKE '%Brittas Bay%'
--MET.Name_met = 'Groundwater'
--STA.NationalCode_sta IS NOT NULL
--'Drinking Water Private Scheme' 'Bathing Water'
--GROUP BY STA.NationalCode_sta, STA.Name_sta, MEN.NationalCode_men, MEN.Name_men, SOR.Code, SOR.Name, MET.Name_met, ORGRBD.StaticName_org, STA.Easting_sta, STA.Northing_sta
ORDER BY SOR.Name, STA.NationalCode_sta

--SELECT Name_met FROM tblMonitoredEntityType_met

SELECT * FROM tblSchemeYear_scy SCY WHERE SCY.SanitaryAuthority_scy = '3900'  --SCY.ReturnYear_rty = '2015'
--SELECT * FROM tblMonitoredEntity_men WHERE NationalCode_men LIKE '%PRI%'
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

