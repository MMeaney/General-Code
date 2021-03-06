-- *******************************************************
-- *** List of monitored entities in MDS
-- *** 2016-02-02 Lakes to be renamed
-- *******************************************************

USE [EdenMDS-STG]

SELECT DISTINCT
	MEN.NationalCode_men			AS [Eden_EntityCode]
	, MEN.Name_men					AS [Eden_EntityName]
	, MET.Name_met					AS [Eden_DataType]
	, RBDMEN.OrganisationId_org		AS [MonEntRBDId]
	, RBDMEN.StaticName_org			AS [MonEntRBD]
	, LTRIM(RTRIM(UEDMEN.FirstName_usr)) + ' ' + LTRIM(RTRIM(UEDMEN.LastName_usr))	AS	[MonEntEditedBy]
	, MEN.LastUpdateDate_men
	, MEN.RevisionComment_men

FROM		dbo.tblMonitoredEntity_men		MEN
LEFT JOIN	dbo.tblMonitoredEntityType_met  MET			ON	MET.MonitoredEntityTypeID_met	= MEN.MonitoredEntityTypeID_met
LEFT JOIN	dbo.tblUser_usr					UEDMEN		ON	UEDMEN.UserId_usr				= MEN.LastUpdatedBy_usr
LEFT JOIN	dbo.tblOrganisation_org			RBDMEN		ON	RBDMEN.OrganisationId_org		= MEN.OwnerOrganisationId_org
LEFT JOIN	dbo.tblStringMaster_stg			STGRBDMEN	ON	RBDMEN.Name_stg					= STGRBDMEN.StringID_stg
LEFT JOIN	dbo.tblStringDefinition_std		STDRBDMEN	ON	STGRBDMEN.StringID_stg			= STDRBDMEN.StringID_stg

WHERE	STDRBDMEN.LanguageID_lan	= '1'
AND		MEN.NationalCode_men		IN
(
'01000620210',
'01000630050',
'01000630340',
'03000680060',
'03000680140',
'03000680780',
'06000940280',
'06000950210',
'06000950240',
'06000950260',
'06000960110',
'07001590500',
'07001590600',
'07001590620',
'07001590930',
'07001590960',
'07001591120',
'07001591140',
'07001591170',
'09001680120',
'09001680130',
'09001680220',
'09001680440',
'10001690040',
'10001700020',
'10001700030',
'10001710040',
'10001710070',
'10001710090',
'16001820040',
'16001820070',
'16001820570',
'19002280080',
'19002280120',
'19002280240',
'20002290090',
'20002290180',
'20002330030',
'21002130010',
'21002130070',
'21002130090',
'21002150030',
'21002200050',
'21002270050',
'22002070260',
'22002070265',
'22002070270',
'22002070530',
'22002080010',
'22002080070',
'22002080080',
'26001560570',
'26001560580',
'26001570260',
'26001570540',
'26001570570',
'26001570690',
'27001580030',
'27001580560',
'27001580610',
'27001580750',
'27001580980',
'27001581190',
'27001581320',
'27001581470',
'27001581680',
'27001581900',
'28001490080',
'28001500010',
'28001520050',
'28001540080',
'29001450180',
'29001460010',
'30001430100',
'30001430330',
'30001430390',
'30001430570',
'30001430710',
'30001431040',
'30001431360',
'30001431410',
'30001431460',
'30001431690',
'30001432096',
'30001432170',
'30001432300',
'31001360310',
'31001360400',
'31001410380',
'32001070070',
'32001080140',
'32001240030',
'32001250020',
'32001260050',
'32001300020',
'32001300050',
'32001330040',
'32001330050',
'33001050020',
'34001100430',
'34001100630',
'34001100670',
'34001100860',
'34001101410',
'34001102220',
'34001102410',
'35001140150',
'35001160230',
'35001160360',
'35001170040',
'35001170100',
'35001170120',
'35001170170',
'35001180010',
'35001190010',
'35001210010',
'36001230160',
'36001230210',
'36001230330',
'36001230370',
'36001230430',
'36001231080',
'36001231280',
'36001231510',
'36001231630',
'36001231800',
'36001231830',
'36001231920',
'36001232420',
'36001232530',
'36001232550',
'36001232560',
'36001232830',
'36001232860',
'36001232870',
'36001232950',
'36001233230',
'36001233330',
'36001233370',
'36001233430',
'36001233460',
'36001233530',
'36001234620',
'36001234630',
'36001234750',
'36001234940',
'36001235280',
'36001235510',
'36001235600',
'36001235620',
'36001235720',
'36001235970',
'36001236100',
'36001272010',
'37000580060',
'38000220060',
'38000220080',
'38000270010',
'38000270050',
'38000270060',
'38000270070',
'38000270160',
'38000300020',
'38000470140',
'38000480490',
'39000310080',
'39000310250',
'39000310270',
'40000040010',
'270155e0110',
'17000k20020',
'17000k20030',
'20000r42250',
'20000y20140',
'20b3_200060',
'21000h30040',
'23000z30010',
'23000z30040',
'240155d0010',
'240155d0320',
'250155b0320',
'250155b0350',
'250155b0450',
'250155b0460',
'250155b0950',
'260155a0120',
'260155a0180',
'260155a0322',
'260155a0670',
'260155a0730',
'260155a1060',
'260155a1180',
'260155a1570',
'260155a1640',
'260155a1770',
'260155a2100',
'260155a2220',
'260155a2400',
'260155a2590',
'260155a2710',
'260155a2720',
'260155a2880',
'260155a2980',
'260155a3000',
'270155c0070',
'270155c0110',
'270155c0130',
'270155c0460',
'31000r40720',
'31000r40950',
'31000r41120',
'31000r41370',
'31000r41500',
'31000r41620',
'32000u40070',
'32000u40120',
'32000u40230',
'32000w40010',
'32t4_320040',
'32t4_320210',
'32t4_320270',
'32t4_320900',
'32t4_321100',
'33000k50160',
'33i5_330820',
'33i5_330850',
'38000j60040',
'38000j60050',
'38000l60080',
'38000p60010',
'38u6_380090',
'38u6_380100',
'38u6_380110',
'38u6_380140',
'38u6_380230'
)
ORDER BY MEN.NationalCode_men--SORSTA.Name, STA.NationalCode_sta


--SELECT * FROM tblMonitoredEntity_men  WHERE MonitoredEntityTypeId_met = '5'
--MEN.Name_men

--SELECT * FROM tblMonitoredEntityType_met


/*
	--, SORMEN.Code					AS [Eden_LACode_MEN]
	--, SORMEN.Name					AS [Eden_LAName_MEN]
--LEFT JOIN	dbo.tblOrganisation_org			ORGMEN		ON	ORGMEN.OrganisationId_org		= MEN.OwnerOrganisationId_org
----LEFT JOIN	dbo.tblOrganisation_org			ORGCRTMEN	ON	ORGCRTMEN.OrganisationId_org	= MEN.--STA.CreatedByOrganisation_org
--LEFT JOIN	[EdenSSO-STG].dbo.Organisation  SORMEN		ON	SORMEN.Code						= ORGMEN.StaticName_org
--LEFT JOIN	[EdenSSO-STG].dbo.Organisation  SORCRTMEN	ON	SORCRTMEN.Code					= ORGMEN.StaticName_org


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
--SELECT * FROM [EdenSSO-STG].dbo.Organisation

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

