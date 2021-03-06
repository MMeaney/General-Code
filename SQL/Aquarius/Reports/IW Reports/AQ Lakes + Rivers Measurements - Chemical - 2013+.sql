-- ******************************************
-- *** Display samples and/or measurements
-- ******************************************

USE [EPACentral_Aquarius]

SELECT DISTINCT
	SAM.Samp_Code			AS [Sample Code]
	, SAM.Samp_Date			AS [Sample Date]
	, SAM.Comp_Date			AS [Sample Complete Date]
	--, SAM.Samp_ID
	--, MEA.Meas_ID
	--, MEA.Hchk_ID
	, ORG.Org_Name			AS [LA Name]
	, ORG.Org_Code			AS [LA Code]
	, RTY.RetTyp_Desc		AS [Return Type]
	, MEN.MonEnt_Code		AS [Monitored Entity]
	, BOD.River_Name		AS [Entity Name]
	, STA.EdenNationalCode	AS [Station National Code]
	, STA.Station_Name		AS [Station Name]
	--, BOD.WW_Name
	--, SCH.Sch_Name
	, PRM.Prm_Desc			AS [Parameter]
	, UOM.Unit_Code			AS [UOM]
	--, UOM.EdenUnit
	, MEA.Meas_Result
	, MEA.Meas_TextResult
	, MEA.Report_Meas_TextResult
	, MEA.Report_Meas_Result
	, MEA.Report_ResultString
	, MEA.ResultString
	, MEA.VerifiedStatus
	, MEA.LimitOfDetection
	, SAM.Samp_LabName
	, SCT.SamCtg_Desc
	--, STY.SamTyp_Desc
	--, MLC.fkRiverStation_ID
	--, SAM.MonLoc_ID

FROM		dbo.Sample				SAM
LEFT JOIN	dbo.Measurements		MEA	ON MEA.Samp_ID				= SAM.Samp_ID
LEFT JOIN	dbo.MonitoredEntity		MEN	ON MEN.MonEnt_ID			= SAM.MonEnt_ID
LEFT JOIN	dbo.SampleType			STY	ON STY.SamTyp_id			= SAM.SampTyp_ID
LEFT JOIN	dbo.SampleCategory		SCT	ON SCT.SamCtg_id			= SAM.SamCtg_ID
LEFT JOIN	dbo.SampleMethod		SMT	ON SMT.SampleMethod_ID		= SAM.SampleMethod_ID
LEFT JOIN	dbo.MonitoredLocation	MLC	ON MLC.MonitoredLocation_ID = SAM.MonLoc_ID
LEFT JOIN	dbo.Organisations		ORG	ON ORG.Org_Id				= MLC.Org_ID
LEFT JOIN	dbo.Theme				THM	ON THM.Theme_id				= MEN.Theme_ID
LEFT JOIN	dbo.Parameter			PRM	ON PRM.Prm_id				= MEA.Prm_ID
LEFT JOIN	dbo.UnitOfMeasure		UOM	ON UOM.Unit_ID				= MEA.Unit_ID
LEFT JOIN	dbo.HealthCheck			HCK	ON HCK.Hchk_id				= MEA.Hchk_ID
LEFT JOIN	dbo.ReturnTypes			RTY	ON RTY.RetTyp_ID			= SAM.RetTyp_ID
--LEFT JOIN	dbo.SchemeStation		STA	ON STA.Station_ID			= MLC.fkSchemeStation_ID
--LEFT JOIN	dbo.LakeStation			STA	ON STA.Station_ID			= MLC.fkLakeStation_Id
--LEFT JOIN	dbo.BathingWaterStation	STA	ON STA.Station_ID			= MLC.fkBathingWaterStation_ID
LEFT JOIN	dbo.RiverStation		STA	ON STA.Station_ID			= MLC.fkRiverStation_ID
--LEFT JOIN	dbo.WasteWaterStation	STA	ON STA.Station_ID			= MLC.fkWasteWaterStation_ID
LEFT JOIN	dbo.River 				BOD	ON BOD.River_ID				= MEN.fkRiver_ID
--LEFT JOIN	dbo.Scheme				SCH	ON SCH.EdenMonitoredEntity	 = MEN.MonEnt_Code

WHERE	PRM.Theme_ID	= '0'
AND
(
		PRM.Prm_Desc	LIKE '%BOD%'
	OR	PRM.Prm_Desc	=	 'Dissolved Oxygen'
	OR	PRM.Prm_Desc	LIKE '%Ammonia%'
	OR	PRM.Prm_Desc	LIKE '%nitrogen%'
	OR	PRM.Prm_Desc	LIKE '%Ortho%phosphate%'
	OR	PRM.Prm_Desc	LIKE '%susp%'
	OR	PRM.Prm_id		IN
		(
		'1379',
		'724',
		'1380',
		'725',
		'1381',
		'1027',
		'1028',
		'1684',
		'1029',
		'1685',
		'744',
		'1400',
		'1026',
		'1682',
		'2639',
		'2640',
		'1291',
		'1947',
		'2819',
		'2820',
		'5580',
		'3432',
		'813',
		'1469',
		'814',
		'1470',
		'862',
		'1518',
		'899',
		'1555',
		'900',
		'1556',
		'901',
		'5958',
		'8268',
		'5319',
		'5922',
		'950',
		'1606',
		'977',
		'1633',
		'979',
		'1635',
		'980',
		'1003'
		)
)
AND YEAR(SAM.Samp_Date) > '2012'

UNION

SELECT DISTINCT
	SAM.Samp_Code			AS [Sample Code]
	, SAM.Samp_Date			AS [Sample Date]
	, SAM.Comp_Date			AS [Sample Complete Date]
	--, SAM.Samp_ID
	--, MEA.Meas_ID
	--, MEA.Hchk_ID
	, ORG.Org_Name			AS [LA Name]
	, ORG.Org_Code			AS [LA Code]
	, RTY.RetTyp_Desc		AS [Return Type]
	, MEN.MonEnt_Code		AS [Monitored Entity]
	, BOD.Lake_Name			AS [Entity Name]
	, STA.EdenNationalCode	AS [Station National Code]
	, STA.Station_Name		AS [Station Name]
	--, SCH.Sch_Name
	, PRM.Prm_Desc			AS [Parameter]
	, UOM.Unit_Code			AS [UOM]
	--, UOM.EdenUnit
	, MEA.Meas_Result
	, MEA.Meas_TextResult
	, MEA.Report_Meas_TextResult
	, MEA.Report_Meas_Result
	, MEA.Report_ResultString
	, MEA.ResultString
	, MEA.VerifiedStatus
	, MEA.LimitOfDetection
	, SAM.Samp_LabName
	, SCT.SamCtg_Desc
	--, STY.SamTyp_Desc
	--, MLC.fkRiverStation_ID
	--, SAM.MonLoc_ID

FROM		dbo.Sample				SAM
LEFT JOIN	dbo.Measurements		MEA	ON MEA.Samp_ID				= SAM.Samp_ID
LEFT JOIN	dbo.MonitoredEntity		MEN	ON MEN.MonEnt_ID			= SAM.MonEnt_ID
LEFT JOIN	dbo.SampleType			STY	ON STY.SamTyp_id			= SAM.SampTyp_ID
LEFT JOIN	dbo.SampleCategory		SCT	ON SCT.SamCtg_id			= SAM.SamCtg_ID
LEFT JOIN	dbo.SampleMethod		SMT	ON SMT.SampleMethod_ID		= SAM.SampleMethod_ID
LEFT JOIN	dbo.MonitoredLocation	MLC	ON MLC.MonitoredLocation_ID = SAM.MonLoc_ID
LEFT JOIN	dbo.Organisations		ORG	ON ORG.Org_Id				= MLC.Org_ID
LEFT JOIN	dbo.Theme				THM	ON THM.Theme_id				= MEN.Theme_ID
LEFT JOIN	dbo.Parameter			PRM	ON PRM.Prm_id				= MEA.Prm_ID
LEFT JOIN	dbo.UnitOfMeasure		UOM	ON UOM.Unit_ID				= MEA.Unit_ID
LEFT JOIN	dbo.HealthCheck			HCK	ON HCK.Hchk_id				= MEA.Hchk_ID
LEFT JOIN	dbo.ReturnTypes			RTY	ON RTY.RetTyp_ID			= SAM.RetTyp_ID
--LEFT JOIN	dbo.SchemeStation		STA	ON STA.Station_ID			= MLC.fkSchemeStation_ID
LEFT JOIN	dbo.LakeStation			STA	ON STA.Station_ID			= MLC.fkLakeStation_Id
--LEFT JOIN	dbo.BathingWaterStation	STA	ON STA.Station_ID			= MLC.fkBathingWaterStation_ID
--LEFT JOIN	dbo.RiverStation		STA	ON STA.Station_ID			= MLC.fkRiverStation_ID
--LEFT JOIN	dbo.WasteWaterStation	STA	ON STA.Station_ID			= MLC.fkWasteWaterStation_ID
LEFT JOIN	dbo.Lake 				BOD	ON BOD.Lake_ID				= MEN.fkLake_Id
--LEFT JOIN	dbo.Scheme				SCH	ON SCH.EdenMonitoredEntity	 = MEN.MonEnt_Code

WHERE	PRM.Theme_ID	= '1'
AND
(
		PRM.Prm_Desc	LIKE '%BOD%'
	OR	PRM.Prm_Desc	=	 'Dissolved Oxygen'
	OR	PRM.Prm_Desc	LIKE '%Ammonia%'
	OR	PRM.Prm_Desc	LIKE '%nitrogen%'
	OR	PRM.Prm_Desc	LIKE '%Ortho%phosphate%'
	OR	PRM.Prm_Desc	LIKE '%susp%'
	OR	PRM.Prm_id		IN
		(
		'1379',
		'724',
		'1380',
		'725',
		'1381',
		'1027',
		'1028',
		'1684',
		'1029',
		'1685',
		'744',
		'1400',
		'1026',
		'1682',
		'2639',
		'2640',
		'1291',
		'1947',
		'2819',
		'2820',
		'5580',
		'3432',
		'813',
		'1469',
		'814',
		'1470',
		'862',
		'1518',
		'899',
		'1555',
		'900',
		'1556',
		'901',
		'5958',
		'8268',
		'5319',
		'5922',
		'950',
		'1606',
		'977',
		'1633',
		'979',
		'1635',
		'980',
		'1003'
		)
)
AND YEAR(SAM.Samp_Date) > '2012'


ORDER BY [LA Name], [Return Type], SAM.Samp_Date, [Sample Code], [Parameter]--SAM.Samp_Code, SAM.Samp_Date DESC


--SELECT * FROM dbo.Sample
--WHERE	Samp_Code	IN
--(
--'1535D1500197',
--'1535D1500198',
--'1535D1500199',
--'1535NC15075',
--'1535NC15076',
--'1535NC15077',
--'1535NC15078',
--'1535NC15079',
--'1535NC15080',
--'1535NC15081',
--'1535NC15086a',
--'1535NC15091',
--'1535NC15092',
--'1535WTP1500236',
--'1535WTP1500237'
--)

/*
WHERE	RVR.River_Code		= '12U01'
AND		STA.Station_Code	= '0200'
AND		ORG.Org_Code		= '3300'
AND		YEAR(SAM.Samp_Date) = '2015'

SMP.Samp_Code	IN	('14-0080', '14-0109', '14-1381')
		--SMP.Samp_Code	IN	('14-1131', '14-1364')
AND	ORG.Org_Code	=	'0300'

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
--ORG.Org_Name	LIKE '%Tipp%'
--AND		THM.Theme_Desc	LIKE '%WASTE%'
--AND		DATEPART(YEAR, SMP.Samp_Date) = '2015'

/****** Script for SelectTopNRows command from SSMS  ******/
SELECT DISTINCT
	 SAMCTG.SamCtg_id
	 , SAMCTG.SamCtg_Code
	 , SAMCTG.SamCtg_Desc
	 , SAMCTG.Hchk_id
	 , SAMCTG.DeletedStatus
	 , SAMCTG.EdenSampleReason
	 , SAMCTG.IncludeInReports
FROM SampleCategory SAMCTG

--*/
