-- ******************************************
-- *** Display samples and/or measurements
-- ******************************************

USE [EPACentral_Aquarius]

DECLARE @SampCode	VARCHAR(50)	= NULL
DECLARE @OrgName	VARCHAR(50)	= NULL
DECLARE @RetType	VARCHAR(50)	= NULL
DECLARE @SampYear	VARCHAR(4)	= NULL

-- ****************************************************
-- *** Set input parameters,
-- *** e.g. Organisation, sample year, data type, etc.

--SET @OrgName	= '%WATERF%'
--SET @RetType	= '%BATH%'
--SET @SampYear	= '2015'
--SET @SampCode = '162501571'

SELECT DISTINCT	
	SAM.Samp_Code			AS	[TEXT_ID]
	, SAM.Samp_ID
	, ORG.Org_Name			AS	[LA_Name]
	, ORG.Org_Code			AS	[LA_Code]
	, THM.Theme_Desc		AS	[Ret_Type]
	, CASE
		WHEN MEN.fkBathingWater_ID				IS NOT NULL	THEN MENBW.IDBW_Code
		WHEN MEN.fkCoastalWater_ID				IS NOT NULL	THEN MENCW.Coastal_Code
		WHEN MEN.fkScheme_ID					IS NOT NULL	THEN MENDW.EdenMonitoredEntity
		WHEN MEN.fkGroundWater_ID				IS NOT NULL	THEN MENGW.EdenMonitoredEntity
		WHEN MEN.fkLake_Id						IS NOT NULL	THEN MENLW.EdenMonitoredEntity
		WHEN MEN.fkRiver_ID						IS NOT NULL	THEN MENRW.EdenMonitoredEntity
		WHEN MEN.fkTransitionalWater_ID			IS NOT NULL	THEN MENTW.Trans_Code
		WHEN MEN.fkWasteWater_ID				IS NOT NULL	THEN MENWW.EdenMonitoredEntity
	END AS [Ent_Code]
	--, CASE
	--	WHEN MEN.fkBathingWater_ID				IS NOT NULL	THEN MENBW.WFD_Code
	--	WHEN MEN.fkCoastalWater_ID				IS NOT NULL	THEN MENCW.WFD_Code
	--	WHEN MEN.fkScheme_ID					IS NOT NULL	THEN ''
	--	WHEN MEN.fkGroundWater_ID				IS NOT NULL	THEN MENGW.WFD_Code
	--	WHEN MEN.fkLake_Id						IS NOT NULL	THEN MENLW.WFD_Code
	--	WHEN MEN.fkRiver_ID						IS NOT NULL	THEN MENRW.WFD_Code
	--	WHEN MEN.fkTransitionalWater_ID			IS NOT NULL	THEN MENTW.WFD_Code
	--	WHEN MEN.fkWasteWater_ID				IS NOT NULL	THEN ''
	--END AS [WFD Code]
	, CASE
		WHEN MEN.fkBathingWater_ID				IS NOT NULL	THEN MENBW.BathingWater_Name
		WHEN MEN.fkCoastalWater_ID				IS NOT NULL	THEN MENCW.Coastal_Name
		WHEN MEN.fkScheme_ID					IS NOT NULL	THEN MENDW.Sch_Name
		WHEN MEN.fkGroundWater_ID				IS NOT NULL	THEN MENGW.GroundWater_Name
		WHEN MEN.fkLake_Id						IS NOT NULL	THEN MENLW.Lake_Name
		WHEN MEN.fkRiver_ID						IS NOT NULL	THEN MENRW.River_Name
		WHEN MEN.fkTransitionalWater_ID			IS NOT NULL	THEN MENTW.Trans_Name
		WHEN MEN.fkWasteWater_ID				IS NOT NULL	THEN MENWW.WW_Name
	END AS [Ent_Name]
	, CASE
		WHEN MLC.fkBathingWaterStation_ID		IS NOT NULL	THEN STABW.EdenNationalCode
		WHEN MLC.fkCoastalWaterStation_ID		IS NOT NULL	THEN STACW.EdenNationalCode
		WHEN MLC.fkSchemeStation_ID				IS NOT NULL	THEN STADW.Station_Code
		WHEN MLC.fkGroundWaterStation_ID		IS NOT NULL	THEN STAGW.EdenNationalCode
		WHEN MLC.fkLakeStation_Id				IS NOT NULL	THEN STALW.EdenNationalCode
		WHEN MLC.fkRiverStation_ID				IS NOT NULL	THEN STARW.EdenNationalCode
		WHEN MLC.fkTransitionalWaterStation_ID	IS NOT NULL	THEN STATW.EdenNationalCode
		WHEN MLC.fkWasteWaterStation_ID			IS NOT NULL	THEN STAWW.EdenNationalCode
	END AS [Station_Code]
	, CASE
		WHEN MLC.fkBathingWaterStation_ID		IS NOT NULL	THEN REPLACE(REPLACE(STABW.Station_Name, CHAR(13), ''), CHAR(10), '')
		WHEN MLC.fkCoastalWaterStation_ID		IS NOT NULL	THEN REPLACE(REPLACE(STACW.Station_Name, CHAR(13), ''), CHAR(10), '')
		WHEN MLC.fkSchemeStation_ID				IS NOT NULL	THEN REPLACE(REPLACE(STADW.Station_Name, CHAR(13), ''), CHAR(10), '')
		WHEN MLC.fkGroundWaterStation_ID		IS NOT NULL	THEN REPLACE(REPLACE(STAGW.Station_Name, CHAR(13), ''), CHAR(10), '')
		WHEN MLC.fkLakeStation_Id				IS NOT NULL	THEN REPLACE(REPLACE(STALW.Station_Name, CHAR(13), ''), CHAR(10), '')
		WHEN MLC.fkRiverStation_ID				IS NOT NULL	THEN REPLACE(REPLACE(STARW.Station_Name, CHAR(13), ''), CHAR(10), '')
		WHEN MLC.fkTransitionalWaterStation_ID	IS NOT NULL	THEN REPLACE(REPLACE(STATW.Station_Name, CHAR(13), ''), CHAR(10), '')
		WHEN MLC.fkWasteWaterStation_ID			IS NOT NULL	THEN REPLACE(REPLACE(STAWW.Station_Name, CHAR(13), ''), CHAR(10), '')
	END AS [Station_Name]
	
	, MEN.MonEnt_Code		AS	[EDEN_Ent_Name]
	, SAM.Samp_Code			AS	[Samp_Code]
	, SAM.Samp_Date			AS	[Samp_Date]
	, SAM.Comp_Date			AS	[Samp_Comp_Date]
	, SAM.Samp_LabName
	, SCT.SamCtg_Desc		AS	[Samp_Type]
	, SMT.SampleMethod_Name	AS	[Samp_Method]
	, STY.SamTyp_Category
	, STY.EdenStationPurpose
	, SCT.EdenSampleReason
	, SMT.EdenSampleMethod
	, STY.SamTyp_Desc	
	, SAM.Samp_ID
	--, MEA.*
	, MEA.Meas_ID
	, ENP.Prm_Desc			AS [Parameter]
	, UOM.Unit_Code			AS [UOM]
	, UOM.EdenUnit
	, MEA.Report_Meas_Result
	, MEA.Meas_Result
	, MEA.Meas_TextResult
	, MEA.ResultString
	, MEA.Report_Meas_TextResult
	, MEA.Report_ResultString
	, MEA.AccreditedResult
	, MEA.Hchk_ID
	, CASE
		WHEN	MEA.Hchk_ID = 1
			THEN	'Un-validated'
			ELSE	HCK.Hchk_Desc
		END
	AS [Hchk_Desc]
	, MEA.VerifiedStatus
	, MEA.LimitOfDetection

FROM		dbo.Sample						SAM
LEFT JOIN	dbo.Measurements				MEA		ON MEA.Samp_ID				= SAM.Samp_ID
LEFT JOIN	dbo.MonitoredEntity				MEN		ON MEN.MonEnt_ID			= SAM.MonEnt_ID
LEFT JOIN	dbo.SampleType					STY		ON STY.SamTyp_id			= SAM.SampTyp_ID
LEFT JOIN	dbo.SampleCategory				SCT		ON SCT.SamCtg_id			= SAM.SamCtg_ID
LEFT JOIN	dbo.SampleMethod				SMT		ON SMT.SampleMethod_ID		= SAM.SampleMethod_ID
LEFT JOIN	dbo.MonitoredLocation			MLC		ON MLC.MonitoredLocation_ID = SAM.MonLoc_ID
LEFT JOIN	dbo.Organisations				ORG		ON ORG.Org_Id				= MLC.Org_ID
LEFT JOIN	dbo.Theme						THM		ON THM.Theme_id				= MEN.Theme_ID
LEFT JOIN	dbo.Parameter					ENP		ON ENP.Prm_id				= MEA.Prm_ID
LEFT JOIN	dbo.UnitOfMeasure				UOM		ON UOM.Unit_ID				= MEA.Unit_ID
LEFT JOIN	dbo.HealthCheck					HCK		ON HCK.Hchk_id				= MEA.Hchk_ID
LEFT JOIN	dbo.ReturnTypes					RTY		ON RTY.RetTyp_ID			= SAM.RetTyp_ID
LEFT JOIN	dbo.BathingWaterStation			STABW	ON STABW.Station_ID			= MLC.fkBathingWaterStation_ID
LEFT JOIN	dbo.CoastalWaterStation			STACW	ON STACW.Station_ID			= MLC.fkCoastalWaterStation_ID
LEFT JOIN	dbo.GroundWaterStation			STAGW	ON STAGW.Station_ID			= MLC.fkGroundWaterStation_ID
LEFT JOIN	dbo.LakeStation					STALW	ON STALW.Station_ID			= MLC.fkLakeStation_Id
LEFT JOIN	dbo.RiverStation				STARW	ON STARW.Station_ID			= MLC.fkRiverStation_ID
LEFT JOIN	dbo.SchemeStation				STADW	ON STADW.Station_ID			= MLC.fkSchemeStation_ID
LEFT JOIN	dbo.TransitionalWaterStation	STATW	ON STATW.Station_ID			= MLC.fkTransitionalWaterStation_ID
LEFT JOIN	dbo.WasteWaterStation			STAWW	ON STAWW.Station_ID			= MLC.fkWasteWaterStation_ID
LEFT JOIN	dbo.BathingWater				MENBW	ON MENBW.BathingWater_ID	= MEN.fkBathingWater_ID
LEFT JOIN	dbo.CoastalWater				MENCW	ON MENCW.Coastal_ID			= MEN.fkCoastalWater_ID
LEFT JOIN	dbo.GroundWater					MENGW	ON MENGW.GroundWater_ID		= MEN.fkGroundWater_ID
LEFT JOIN	dbo.Lake 						MENLW	ON MENLW.Lake_ID			= MEN.fkLake_Id
LEFT JOIN	dbo.River 						MENRW	ON MENRW.River_ID			= MEN.fkRiver_ID
LEFT JOIN	dbo.Scheme 						MENDW	ON MENDW.Sch_id				= MEN.fkScheme_ID
LEFT JOIN	dbo.TransitionalWater			MENTW	ON MENTW.Transitional_ID	= MEN.fkTransitionalWater_ID
LEFT JOIN	dbo.WasteWater					MENWW	ON MENWW.WW_ID				= MEN.fkWasteWater_ID
LEFT JOIN	dbo.Scheme						SCH		ON SCH.EdenMonitoredEntity	= MEN.MonEnt_Code

--WHERE	(SAM.Samp_Code			LIKE '%' + (@SampCode)	+ '%' OR (@SampCode)	IS NULL)
--AND		(ORG.Org_Name			LIKE '%' + (@OrgName)	+ '%' OR (@OrgName)		IS NULL)
--AND		(THM.Theme_Desc			LIKE '%' + (@RetType)	+ '%' OR (@RetType)		IS NULL)
--AND		(YEAR(SAM.Samp_Date)	LIKE '%' + (@SampYear)	+ '%' OR (@SampYear)	IS NULL)

--WHERE	MEA.Report_ResultString LIKE '%RNV%'
--WHERE		STAWW.EdenNationalCode = 'TPEFF0600D0535SW001'
--WHERE STATW.EdenNationalCode	IN 
--(
--'TW38003144BR2001'
--,'TW38003144BR2002'
--)

--WHERE	--RTY.RetTyp_Desc	LIKE '%Ground%'
--AND		STAGW.Station_Name	NOT LIKE '%BRUREE%'
--AND

--WHERE		SAM.Samp_Code	IN
--(
--'16443431',
--'16443181',
--'16443185', -- Drinking Water Roscommon
--'16-05434'
--)

--WHERE STALW.EdenNationalCode IN ('LS260155a07300010')

--WHERE	THM.Theme_Desc	LIKE '%DRINK%'
--AND		YEAR(SAM.Samp_Date)	= 2016
--AND		MEA.Hchk_ID	= 2


WHERE	SAM.Samp_Code	in
(
'1510038',
'1510039',
'1510040',
'1510041',
'1510042',
'1510043',
'1510044',
'1510045',
'1510046',
'1510047',
'1510048',
'1510049',
'1510050',
'1510051',
'1510052',
'1510053',
'1510054',
'1510055',
'1510078',
'1510079',
'1510210',
'1510211',
'1510212',
'1510213',
'1510214',
'1510215',
'1510216',
'1510217',
'1510218',
'1510219',
'1510359',
'1510360',
'1510361',
'1510362',
'1510363',
'1510364',
'1510365',
'1510520',
'1510521',
'1510522',
'1510523',
'1510524',
'1510525',
'1510526',
'1510527',
'1510556',
'1510557',
'1510558',
'1510559',
'1510560',
'1510561',
'1510562',
'1510563',
'1510564',
'1510565',
'1510566',
'1510567',
'1510568',
'1510671',
'1510672',
'1510673',
'1510674',
'1510675',
'1510764',
'1510765',
'1510766',
'1510767',
'1510768',
'1510769',
'1510770',
'1510772',
'1510773',
'1510774',
'1510775',
'1510776',
'1510777',
'1510796',
'1510797',
'1510877',
'1510878',
'1510879',
'1510880',
'1510885',
'1510886',
'1510887',
'1510943',
'1510944',
'1510945',
'1510946',
'1510991',
'1510992',
'1511156',
'1511157',
'1511158',
'1511159',
'1511160',
'1511259',
'1511261',
'1511262',
'1511263',
'1511264',
'1511265',
'1511266',
'1511267',
'1511357',
'1511358',
'1511359',
'1511360',
'1511361',
'1511362',
'1511363',
'1511364',
'1511365',
'1511433',
'1511435',
'1511436',
'1511438',
'1511439',
'1511440',
'1511441',
'1511471',
'1511472',
'1511473',
'1511474',
'1511475',
'1511476',
'1511477',
'1511478',
'1511479',
'1511480',
'1511481',
'1511594',
'1511595',
'1511596',
'1511597',
'1511598',
'1511622',
'1511626',
'1511627',
'1511629',
'1511760',
'1511761',
'1511762',
'1511763',
'1511764',
'1511765',
'1511766',
'1511767',
'1511768',
'1511958',
'1511959',
'1511960',
'1511961',
'1511962',
'1511963',
'1511964',
'1511965',
'1512088',
'1512089',
'1512090',
'1512092',
'1512093',
'1512094',
'1512095',
'1512096',
'1512312',
'1512313',
'1512314',
'1512316',
'1512317',
'1512318',
'1512319',
'1512320',
'1512321',
'1512322',
'1512323',
'1512324',
'1512482',
'1512483',
'1512484',
'1512485',
'1512486',
'1512487',
'1512488',
'1512489',
'1512490',
'1512491',
'1512492',
'1512493',
'1512494',
'1512495',
'1512496',
'1512497',
'1512628',
'1512629',
'1512703',
'1512705',
'1512706',
'1512817',
'1512818',
'1512963',
'1512964',
'1512965',
'1512966',
'1513178',
'1513179',
'1513180',
'1513181',
'1513182',
'1513183',
'1513185',
'1513186',
'1513187',
'1513188',
'1513189',
'1513190',
'1513191',
'1513231',
'1513232',
'1513233',
'1513234',
'1513312',
'1513313',
'1513314',
'1513315',
'1513316',
'1513317',
'1513318',
'1513319',
'1513320',
'1513321',
'1513322',
'1513412',
'1513413',
'1513414',
'1513415',
'1513416',
'1513417',
'1513418',
'1513419',
'1513420',
'1513421',
'1513422',
'1513423',
'1513424',
'1513425',
'1513426',
'1513427',
'1513428',
'1513429',
'1513430',
'1513431',
'1513432',
'1513433',
'1513475',
'1513476',
'1513477',
'1513478',
'1513479',
'1513480',
'1513481',
'1513482',
'1513483',
'1513484',
'1513572',
'1513573',
'1513574',
'1513575',
'1513576',
'1513577',
'1513578',
'1513777',
'1513778',
'1513779',
'1513780',
'1513781',
'1513782',
'1513783',
'1513858',
'1513859',
'1513962',
'1513963',
'1513964',
'1513965',
'1513966',
'1513967',
'1513968',
'1513969',
'1513970',
'1513977',
'1513978',
'1513979',
'1513980',
'1513981',
'1514000',
'1514002',
'1514003',
'1514004',
'1514005',
'1514006',
'1514007',
'1514008',
'1514009',
'1514010',
'1514046',
'1514075',
'1514076',
'1514077',
'1514078',
'1514079',
'1514080',
'1514081',
'1514082',
'1514083',
'1514163',
'1514164',
'1514165',
'1514166',
'1514167',
'1514168',
'1514169',
'1514234',
'1514235',
'1514236',
'1514237',
'1514238',
'1514239',
'1514240',
'1514241',
'1514242',
'1514243',
'1514244',
'1514245',
'1514361',
'1514362',
'1514405',
'1514406',
'1514407',
'1514408',
'1514409',
'1514410',
'1514411',
'1514412',
'1514413',
'1514414',
'1514415',
'1514416',
'1514417',
'1514418',
'1514419',
'1514420',
'1514421',
'1514422',
'1514423',
'1514424',
'1514425',
'1514440',
'1514441',
'1514442',
'1514444',
'1514445'
)

--WHERE	SCH.Sch_Code = '1200PUB1001'
--AND		ENP.Prm_Desc LIKE '%Aluminium%'
And YEAR(SAM.Samp_Date) = 2015


--OR		SAM.Samp_Code	LIKE '%1535WTP1500236'

--AND		THM.Theme_Desc	LIKE '%RIVER%'
--AND		ORG.Org_Name	LIKE '%DONEGAL%'


--WHERE	ENP.Prm_Desc	LIKE '%Tetrachloroethene%'
--AND		ORG.Org_Name	LIKE '%DONEGAL%'
--AND		THM.Theme_Desc	LIKE '%PUB%'
--AND		YEAR(SAM.Samp_Date)	= 2015

--WHERE	STATW.EdenNationalCode	=	'TW31003144BR2013'
--ORG.Org_Name	LIKE '%Donegal%'
--AND		YEAR(SAM.Samp_Date)	= 2015
--AND		

--WHERE	THM.Theme_Desc	LIKE '%LAKE%'
--AND		ENP.Prm_Desc	LIKE '%Alkalinity-total (as CaCO3)%'
--AND		SCT.SamCtg_Desc	LIKE '%Operational%'
--AND		YEAR(SAM.Samp_Date)	> 2014
--AND		(
--			ORG.Org_Name	LIKE 'KILDARE%'
--		OR	ORG.Org_Name	LIKE 'KERRY%'
--		)

--WHERE		SAM.Samp_Code IN
--(
--'15551155'
--)

--WHERE	SMT.EdenSampleMethod	LIKE '%SAMPLINGMETHOD_DAY_COMPOSITE%'
--AND		THM.Theme_Desc			LIKE '%DRINK%'
--AND		STY.SamTyp_Category		LIKE '%CRYPTO%'
--AND		SCT.SamCtg_Desc			LIKE '%COMPLIANCE%'

ORDER BY [LA_Name], [Ret_Type], [Samp_Code], [Samp_Date]


/*

	, STALW.StationFullCode


STARW.EdenNationalCode IN
(
'RS23F010324',
'RS25S012561'
)
--AND	(ENP.Prm_Desc	LIKE '%Odour%' OR ENP.Prm_Desc	LIKE '%Taste%')


--WHERE	MEA.Meas_ID = '10759239'
--WHERE	THM.Theme_Desc	LIKE '%LAKE%'
--AND		YEAR(SAM.Samp_Date)	= 2016
--AND		ORG.Org_Name	LIKE 'Westmeath%'
--AND		SAM.Samp_Code IN
--(
--'13489',
--'DW2015022'
--)

--AND		ORG.Org_Name	LIKE '%MAYO%'
--WHERE SAM.Samp_Code IN ('15371222')
--AND		THM.Theme_Desc	LIKE '%COAST%'
--AND		MENCW.Coastal_Code IN ('SW_200_0000', 'SW_240_0000')

--WHERE STARW.EdenNationalCode IN ('RS23F010324', 'RS25S012561')
--WHERE SMT.SampleMethod_Code LIKE ('%TRAC%')
--IN
--(
--'18478',
--'19102'
--)
--WHERE	ORG.Org_Name		LIKE '%LONGFORD%'
--AND		THM.Theme_Desc		LIKE '%WASTE%'
--AND		YEAR(SAM.Samp_Date)	= '2015'
--AND		STY.EdenSamplePurpose = 24
--WHERE	SAM.Samp_Code	= 'DW2015007'
--ORG.Org_Name	LIKE '%KILKENNY%' AND		DATEPART(YEAR, SAM.Samp_Date) = '2014' -- Test




WHERE	RVR.River_Code		= '12U01'
AND		STA.Station_Code	= '0200'
--AND		ORG.Org_Code		= '3300'
AND		YEAR(SAM.Samp_Date) = '2015'

SAM.Samp_Code	IN	('14-0080', '14-0109', '14-1381')
		--SAM.Samp_Code	IN	('14-1131', '14-1364')
AND	ORG.Org_Code	=	'0300'

--ORG.Org_Name	LIKE '%Tipp%'
--AND		THM.Theme_Desc	LIKE '%WASTE%'
--AND		DATEPART(YEAR, SAM.Samp_Date) = '2015'

--SELECT TOP (5) * FROM WasteWater	WHERE WW_Code = 'DL-D0035-01'
--SELECT * FROM Scheme	WHERE SCHEME.Sch_Code = '1700PRI0207'
--SELECT * FROM Organisations WHERE Organisations.Org_Code = '2100'
--SELECT * FROM MonitoredLocation
--SELECT * FROM MonitoredEntity
--SELECT * FROM MonitoredEntity WHERE MonEnt_Code = '21000004'
--SELECT * FROM SchemeStation WHERE Station_Name	=	'Gallon'

	--, SMP.Samp_LabName
	--, SMP.Samp_AnalName
	--, SCH.Sch_Name
	--, MON.Theme_id
	--, SMT.SampleMethod_Name
	--, MLC.MonitoredLocation_Code


--*/
