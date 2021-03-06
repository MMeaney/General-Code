-- *******************************************************
-- *** List of monitored entities and stations in MDS
-- *******************************************************

USE [EdenMDS-PRD]

SELECT DISTINCT
	SORSTA.Name								AS [LA Name]
	, SORSTA.Code							AS [LA Code]
	, MET.Name_met							AS [Data Type]
	, MEN.NationalCode_men					AS [Entity Code]
	, MEN.Name_men							AS [Entity Name]
	, STA.MonitoredEntityWFDWiseCode_sta	AS [Entity EU Code]
	, STA.NationalCode_sta					AS [Station Code]
	, STA.Name_sta							AS [Station Name]
	, STDRBDSTA.Content_std					AS [StationRBDName]
	, RBDMEN.StaticName_org					AS [EntityRBD]
	, RBDSTA.StaticName_org					AS [StationRBD]
	, STA.Easting_sta
	, STA.Northing_sta
	, STT.StaticName_stt					AS [StationType]
	, STA.WFDWiseCode_sta
	, STA.LocalCode_sta
	, STA.LastUpdateDate_sta
	, LTRIM(RTRIM(UEDSTA.FirstName_usr)) + ' ' + LTRIM(RTRIM(UEDSTA.LastName_usr))	AS	[StaEditedBy]
	, LTRIM(RTRIM(UEDMEN.FirstName_usr)) + ' ' + LTRIM(RTRIM(UEDMEN.LastName_usr))	AS	[MonEntEditedBy]
	, STA.RevisionComment_sta
	, STA.WFDWiseCode_sta
	, MEN.RevisionComment_men
	--, MEN.*

FROM		dbo.tblMonitoredEntity_men		MEN
LEFT JOIN	dbo.tblMonitoredEntityType_met  MET			ON	MET.MonitoredEntityTypeID_met	= MEN.MonitoredEntityTypeID_met
LEFT JOIN	dbo.tblStation_sta				STA			ON	STA.MonitoredEntityId_men		= MEN.MonitoredEntityId_men
LEFT JOIN	dbo.tblSample_sam				SAM			ON	SAM.StationID_sta				= STA.StationId_sta
LEFT JOIN	dbo.tblUser_usr					UAPPSTA		ON	UAPPSTA.UserId_usr				= STA.ApprovedBy_usr
LEFT JOIN	dbo.tblUser_usr					UEDSTA		ON	UEDSTA.UserId_usr				= STA.LastUpdatedBy_usr
LEFT JOIN	dbo.tblUser_usr					UEDMEN		ON	UEDMEN.UserId_usr				= MEN.LastUpdatedBy_usr
LEFT JOIN	dbo.tblOrganisation_org			ORGSTA		ON	ORGSTA.OrganisationId_org		= STA.LocalAuthorityId_org
LEFT JOIN	dbo.tblOrganisation_org			ORGCRTSTA	ON	ORGCRTSTA.OrganisationId_org	= STA.CreatedByOrganisation_org
LEFT JOIN	[EdenSSO-PRD].dbo.Organisation  SORSTA		ON	SORSTA.Code						= ORGSTA.StaticName_org
LEFT JOIN	[EdenSSO-PRD].dbo.Organisation  SORCRTSTA	ON	SORCRTSTA.Code					= ORGSTA.StaticName_org
INNER JOIN	dbo.tblStationType_stt			STT			ON	STT.StationTypeId_stt			= STA.StationTypeId_stt
LEFT JOIN	dbo.tblOrganisation_org			RBDSTA		ON	RBDSTA.OrganisationId_org		= STA.RiverBasinDistrictId_org
LEFT JOIN	dbo.tblOrganisation_org			RBDMEN		ON	RBDMEN.OrganisationId_org		= MEN.OwnerOrganisationId_org
INNER JOIN	dbo.tblOrganisationType_ort		ORTRBD		ON	RBDSTA.OrganisationTypeId_ort	= ORTRBD.OrganisationTypeId_ort 
INNER JOIN	dbo.tblStringMaster_stg			STGRBDSTA	ON	RBDSTA.Name_stg					= STGRBDSTA.StringID_stg
INNER JOIN	dbo.tblStringDefinition_std		STDRBDSTA	ON	STGRBDSTA.StringID_stg			= STDRBDSTA.StringID_stg
INNER JOIN	dbo.tblStringMaster_stg			STGRBDMEN	ON	RBDMEN.Name_stg					= STGRBDMEN.StringID_stg
INNER JOIN	dbo.tblStringDefinition_std		STDRBDMEN	ON	STGRBDMEN.StringID_stg			= STDRBDMEN.StringID_stg

WHERE	STDRBDSTA.LanguageID_lan = '1'
--AND		MEN.NationalCode_men = '36L03'

--AND		STA.Name_sta = ' @ New Bridge.'
--AND		STA.NationalCode_sta LIKE '%TW38003144BR2001%'
AND		STA.NationalCode_sta IN (
'LS160018205700070',
'LS17000k200300020',
'LS17000k200300030',
'LS17000k200300040',
'LS17000k200300050',
'LS17000k200300060',
'LS17000k200300070',
'LS17000k200200020',
'LS17000k200200030',
'LS17000k200200040',
'LS17000k200200050',
'LS17000k200200060',
'LS17000k200200070'
)


ORDER BY SORSTA.Name, MET.Name_met, MEN.NationalCode_men, STA.NationalCode_sta












/*
	--, STA.MonitoredEntityWFDWiseCode_sta
	--, STA.RiverBasinDistrictId_org		AS [StaRBDId]
	--, RBDMEN.OrganisationId_org			AS [MonEntRBDId]
	--, STDRBDSTA.Content_std				AS [MonEntRBDName]
	--, RBDMEN.StaticName_org				AS [MonEntRBD]
	--, SORMEN.Code					AS [Eden_LACode_MEN]
	--, SORMEN.Name					AS [Eden_LAName_MEN]
--LEFT JOIN	dbo.tblOrganisation_org			ORGMEN		ON	ORGMEN.OrganisationId_org		= MEN.OwnerOrganisationId_org
----LEFT JOIN	dbo.tblOrganisation_org			ORGCRTMEN	ON	ORGCRTMEN.OrganisationId_org	= MEN.--STA.CreatedByOrganisation_org
--LEFT JOIN	[EdenSSO-PRD].dbo.Organisation  SORMEN		ON	SORMEN.Code						= ORGMEN.StaticName_org
--LEFT JOIN	[EdenSSO-PRD].dbo.Organisation  SORCRTMEN	ON	SORCRTMEN.Code					= ORGMEN.StaticName_org






----AND		MEN.NationalCode_men	IN ('25H03', '25K42', '25O28')
--AND		MET.Name_met LIKE '%DRINKING%PUB%'
--AND		(
--		SORSTA.Name	 LIKE '%DUB%'
--		OR
--		SORSTA.Name	 LIKE '%FINGAL%'
--		OR
--		SORSTA.Name	 LIKE '%RATHD%'
--		)
----AND		MEN.NationalCode_men = '0700PUB1007'
--AND		MEN.Name_men LIKE '%OWEL%'
--AND		STA.LocalCode_sta = '0070'
--AND		STA.MonitoredEntityWFDWiseCode_sta LIKE '%SH_26_6%'

--AND	STA.NationalCode_sta	IN
--(
--'RS18A020590',
--'RS18B060090',
--'RS18B060210',
--'RS18C020210',
--'RS18C020320',
--'RS18D010590',
--'RS18E220740',
--'RS18E220970',
--'RS18F050140',
--'RS18F050320',
--'RS19G010260',
--'RS19G010310',
--'RS20T290990'
--)
--WHERE        (dbo.tblOrganisationType_ort.StaticName_ort = 'RBD') AND (dbo.tblStringDefinition_std.LanguageID_lan = '1') 
--LEFT JOIN	dbo.tblSchemeYear_scy			SCY		ON	SCY.SchemeType_sct		= MEN.MonitoredEntityId_men
--LEFT JOIN	dbo.tblSchemeType_sct			SCT		ON	SCT.SchemeTypeID_sct			= SCY.SchemeType_sct
----LEFT JOIN	dbo.tblReturnYear_rty			RTY		ON	RTY.ReturnYear_rty				= SCY.ReturnYear_rty
----LEFT JOIN	dbo.tblReturnYearStatus_rst		RST		ON	RST.StatusID_rst				= RTY.StatusID_rst
--AND		Name_men LIKE '%Muckanagh%'
--AND			MEN.NationalCode_men = '36001233230'
--AND		STA.WFDWiseCode_sta LIKE '%0_Op%'
--IN
--(
--'SH_26_746_010_Op', --(Grange Lough)
--'SH_26_746_020_Op', --(Grange Lough)
--'SH_26_746_030_Op', --(Grange Lough)
--'SH_26_746_040_Op', --(Grange Lough)
--'WE_31_98_0010_S' --(Seecon)
--)
--AND		MET.Name_met			LIKE '%LAKE%'
------AND		(STA.Name_sta LIKE '%Loughs Agency, Darby Magee, Dundalk St%' OR STA.NationalCode_sta LIKE 'DWMON2100PUB10105003')

------TPEFF0500D0444SW001
------TPEFF0500D0444GW001DWMON2100PUB10105003
------AND		STA.Name_sta LIKE '%Churchtown%' --'Churchtown-D0444-01--GW001-Discharge to Mitchelstown Groundwater Body'
------AND		STT.StaticName_stt = 'UWW_DISCHARGE_STATION'
------AND		MEN.Name_men LIKE '%Brittas Bay%'
------MET.Name_met = 'Groundwater'
------STA.NationalCode_sta IS NOT NULL
------'Drinking Water Private Scheme' 'Bathing Water'
------GROUP BY STA.NationalCode_sta, STA.Name_sta, MEN.NationalCode_men, MEN.Name_men, SORSTA.Code, SORSTA.Name, MET.Name_met, RBDSTA.StaticName_org, STA.Easting_sta, STA.Northing_sta
----ORDER BY STA.NationalCode_sta--SORSTA.Name, STA.NationalCode_sta

----SELECT * FROM tblMonitoredEntity_men	WHERE	Name_men LIKE '%Muckanagh%'
--SELECT * FROM tblMonitoredEntity_men	WHERE	NationalCode_men LIKE '%36001233230%'
--SELECT * FROM [EdenSSO-PRD].dbo.Organisation

----SELECT * FROM tblStation_sta
----WHERE 	MonitoredEntityWFDWiseCode_sta LIKE '%SH_26_746%'
----OR		MonitoredEntityWFDWiseCode_sta LIKE '%WE_31_98%'

----SELECT * FROM tblMonitoredEntity_men WHERE MonitoredEntityId_men IN ('5500', '3813')
------SELECT Name_met FROM tblMonitoredEntityType_met

------SELECT * FROM tblMonitoredEntityType_met

------STA.NationalCode_sta LIKE '%06T010350%'

------WHERE	MEN.Name_men LIKE '%Corrib Upper%'
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
--*/
AND			MEN.MonitoredEntityTypeID_met = '6'

ORDER BY 	STA.NationalCode_sta
--*/




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


--*/
--*/


-- **************************************************

--SELECT * FROM tblMonitoredEntity_men

--SELECT * FROM tblMonitoredEntityType_met
--SELECT * FROM tblMonitoredEntity_men		WHERE MonitoredEntityTypeID_met = '33'

