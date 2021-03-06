-- ******************************************
-- *** Display samples and/or measurements
-- ******************************************

USE [EPACentral_Aquarius]

IF  OBJECT_ID('TempDB..#tmpHardnessRW')	IS NOT NULL
	BEGIN	DROP TABLE #tmpHardnessRW	END
SELECT DISTINCT
	ORG.Org_Name
	, ORG.Org_Code
	, RTY.RetTyp_Desc
	, MON.MonEnt_Code
	, BOD.River_Name			AS [MonitoredEntity]
	, STA.EdenNationalCode
	, STA.Station_Name
	, SAM.Samp_Code
	, SCT.SamCtg_Desc
	--, PRM.Prm_Code
	, PRM.Prm_Desc
	, UOM.Unit_Code
	, MEA.Meas_Result
	, MEA.Report_Meas_TextResult
	, MEA.Report_Meas_Result
	, MEA.Meas_TextResult
	, MEA.Report_ResultString
	, MEA.ResultString
	, MEA.VerifiedStatus
	, SAM.Samp_Date
	, SAM.Comp_Date
INTO	#tmpHardnessRW
FROM		dbo.Sample				SAM
LEFT JOIN	dbo.Measurements		MEA	ON MEA.Samp_ID				= SAM.Samp_ID
LEFT JOIN	dbo.MonitoredEntity		MON	ON MON.MonEnt_ID			= SAM.MonEnt_ID
LEFT JOIN	dbo.SampleType			STY	ON STY.SamTyp_id			= SAM.SampTyp_ID
LEFT JOIN	dbo.SampleCategory		SCT	ON SCT.SamCtg_id			= SAM.SamCtg_ID
LEFT JOIN	dbo.SampleMethod		SMT	ON SMT.SampleMethod_ID		= SAM.SampleMethod_ID
LEFT JOIN	dbo.MonitoredLocation	MLC	ON MLC.MonitoredLocation_ID = SAM.MonLoc_ID
LEFT JOIN	dbo.Organisations		ORG	ON ORG.Org_Id				= MLC.Org_ID
LEFT JOIN	dbo.Theme				THM	ON THM.Theme_id				= MON.Theme_ID
LEFT JOIN	dbo.Parameter			PRM	ON PRM.Prm_id				= MEA.Prm_ID
LEFT JOIN	dbo.UnitOfMeasure		UOM	ON UOM.Unit_ID				= MEA.Unit_ID
LEFT JOIN	dbo.HealthCheck			HCK	ON HCK.Hchk_id				= MEA.Hchk_ID
LEFT JOIN	dbo.ReturnTypes			RTY	ON RTY.RetTyp_ID			= SAM.RetTyp_ID
LEFT JOIN	dbo.RiverStation		STA	ON STA.Station_ID			= MLC.fkRiverStation_ID
LEFT JOIN	dbo.River	  			BOD	ON BOD.EdenMonitoredEntity	 = MON.MonEnt_Code
WHERE	RTY.RetTyp_Desc		= 'River Water'
AND		YEAR(SAM.Samp_Date) > '2006'
AND		PRM.Prm_Code		IN (314, 315)
--('Total Hardness as (CaCO3)', 'Total Hardness (as Ca)')	
ORDER BY PRM.Prm_Desc, ORG.Org_Name, SAM.Samp_Date



IF  OBJECT_ID('TempDB..#tmpHardnessLW')	IS NOT NULL
	BEGIN	DROP TABLE #tmpHardnessLW	END
SELECT DISTINCT
	ORG.Org_Name
	, ORG.Org_Code
	, RTY.RetTyp_Desc
	, MON.MonEnt_Code
	, BOD.Lake_Name			AS [MonitoredEntity]
	, STA.EdenNationalCode
	, STA.Station_Name
	, SAM.Samp_Code
	, SCT.SamCtg_Desc
	--, PRM.Prm_Code
	, PRM.Prm_Desc
	, UOM.Unit_Code
	, MEA.Meas_Result
	, MEA.Report_Meas_TextResult
	, MEA.Report_Meas_Result
	, MEA.Meas_TextResult
	, MEA.Report_ResultString
	, MEA.ResultString
	, MEA.VerifiedStatus
	, SAM.Samp_Date
	, SAM.Comp_Date
INTO	#tmpHardnessLW
FROM		dbo.Sample				SAM
LEFT JOIN	dbo.Measurements		MEA	ON MEA.Samp_ID				= SAM.Samp_ID
LEFT JOIN	dbo.MonitoredEntity		MON	ON MON.MonEnt_ID			= SAM.MonEnt_ID
LEFT JOIN	dbo.SampleType			STY	ON STY.SamTyp_id			= SAM.SampTyp_ID
LEFT JOIN	dbo.SampleCategory		SCT	ON SCT.SamCtg_id			= SAM.SamCtg_ID
LEFT JOIN	dbo.SampleMethod		SMT	ON SMT.SampleMethod_ID		= SAM.SampleMethod_ID
LEFT JOIN	dbo.MonitoredLocation	MLC	ON MLC.MonitoredLocation_ID = SAM.MonLoc_ID
LEFT JOIN	dbo.Organisations		ORG	ON ORG.Org_Id				= MLC.Org_ID
LEFT JOIN	dbo.Theme				THM	ON THM.Theme_id				= MON.Theme_ID
LEFT JOIN	dbo.Parameter			PRM	ON PRM.Prm_id				= MEA.Prm_ID
LEFT JOIN	dbo.UnitOfMeasure		UOM	ON UOM.Unit_ID				= MEA.Unit_ID
LEFT JOIN	dbo.HealthCheck			HCK	ON HCK.Hchk_id				= MEA.Hchk_ID
LEFT JOIN	dbo.ReturnTypes			RTY	ON RTY.RetTyp_ID			= SAM.RetTyp_ID
LEFT JOIN	dbo.LakeStation			STA	ON STA.Station_ID			= MLC.fkLakeStation_Id
LEFT JOIN	dbo.Lake	  			BOD	ON BOD.Lake_Code			= MON.MonEnt_Code
WHERE	RTY.RetTyp_Desc		= 'Lake Water'
AND		YEAR(SAM.Samp_Date) > '2006'
AND		PRM.Prm_Code		IN (314, 315)
--('Total Hardness as (CaCO3)', 'Total Hardness (as Ca)')	

ORDER BY PRM.Prm_Desc, ORG.Org_Name, SAM.Samp_Date

SELECT * FROM #tmpHardnessRW
UNION
SELECT * FROM #tmpHardnessLW
ORDER BY Org_Name, Prm_Desc, Samp_Date

SELECT DISTINCT RetTyp_Desc, Prm_Desc, YEAR(Samp_Date) FROM #tmpHardnessRW
UNION
SELECT DISTINCT RetTyp_Desc, Prm_Desc, YEAR(Samp_Date) FROM #tmpHardnessLW
/*
SELECT * FROM Parameter WHERE Prm_Desc LIKE '%Total Hardness%' AND Theme_ID IN (0, 1) ORDER BY Prm_Desc
SELECT * FROM Theme
*/

/*
BEGIN	DROP TABLE #tmpHardnessRW	END
BEGIN	DROP TABLE #tmpHardnessLW	END
*/
