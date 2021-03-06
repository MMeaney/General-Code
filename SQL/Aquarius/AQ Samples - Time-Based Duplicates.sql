-- ******************************************
-- *** Determine Aquarius duplicate samples

USE [EPACentral_Aquarius]

IF  OBJECT_ID('TempDB..#tmpDupSamp') IS NOT NULL
	BEGIN	DROP TABLE #tmpDupSamp	END
SELECT	 SAM.Samp_Code, SAM.Samp_Date, SAM.RetTyp_ID, SAM.MonLoc_ID
INTO	 #tmpDupSamp
FROM	 dbo.Sample		SAM
GROUP BY SAM.Samp_Code, SAM.Samp_Date, SAM.RetTyp_ID, SAM.MonLoc_ID
HAVING	 COUNT(*) > 1

SELECT DISTINCT
	SAM.Samp_Code
	, MEN.MonEnt_Code
	, ORG.Org_Name
	, ORG.Org_Code
	, RTY.RetTyp_Desc
	, SAM.Samp_Date
	, SCT.EdenSampleReason
	--, SAM.Samp_ID
	--, STA.EdenNationalCode
	--, STA.Station_Name
FROM		dbo.Sample				SAM
INNER JOIN	#tmpDupSamp				TM1	ON TM1.Samp_Code			= SAM.Samp_Code
INNER JOIN	#tmpDupSamp				TM2	ON TM2.Samp_Date			= SAM.Samp_Date
INNER JOIN	#tmpDupSamp				TM3	ON TM3.RetTyp_ID			= SAM.RetTyp_ID
--INNER JOIN	#tmpDupSamp				TM4	ON TM4.MonLoc_ID			= SAM.MonLoc_ID
LEFT JOIN	dbo.Measurements		MEA	ON MEA.Samp_ID				= SAM.Samp_ID
LEFT JOIN	dbo.MonitoredEntity		MEN	ON MEN.MonEnt_ID			= SAM.MonEnt_ID
LEFT JOIN	dbo.Organisations		ORG	ON ORG.Org_Id				= MEN.Org_ID
LEFT JOIN	dbo.SampleType			STY	ON STY.SamTyp_id			= SAM.SampTyp_ID
LEFT JOIN	dbo.SampleCategory		SCT	ON SCT.SamCtg_id			= SAM.SamCtg_ID
LEFT JOIN	dbo.SampleMethod		SMT	ON SMT.SampleMethod_ID		= SAM.SampleMethod_ID
LEFT JOIN	dbo.MonitoredLocation	MLC	ON MLC.MonitoredLocation_ID = SAM.MonLoc_ID
LEFT JOIN	dbo.Theme				THM	ON THM.Theme_id				= MEN.Theme_ID
LEFT JOIN	dbo.Parameter			PRM	ON PRM.Prm_id				= MEA.Prm_ID
LEFT JOIN	dbo.UnitOfMeasure		UOM	ON UOM.Unit_ID				= MEA.Unit_ID
LEFT JOIN	dbo.HealthCheck			HCK	ON HCK.Hchk_id				= MEA.Hchk_ID
LEFT JOIN	dbo.ReturnTypes			RTY	ON RTY.RetTyp_ID			= SAM.RetTyp_ID
--LEFT JOIN	dbo.BathingWaterStation	STA	ON STA.Station_ID			= MLC.fkBathingWaterStation_ID
--LEFT JOIN	dbo.SchemeStation		STA	ON STA.Station_ID			= MLC.fkSchemeStation_ID
--LEFT JOIN	dbo.LakeStation			STA	ON STA.Station_ID			= MLC.fkLakeStation_Id
--LEFT JOIN	dbo.RiverStation		STA	ON STA.Station_ID			= MLC.fkRiverStation_ID
--LEFT JOIN	dbo.Lake	  			BOD	ON BOD.EdenMonitoredEntity	 = MON.MonEnt_Code
--LEFT JOIN	dbo.Scheme				SCH	ON SCH.EdenMonitoredEntity	 = MON.MonEnt_Code

--WHERE	SAM.Samp_Code	IN (SELECT Samp_Code FROM #tmpDupSamp)

WHERE	YEAR(SAM.Samp_Date) = '2015'

ORDER BY
	RTY.RetTyp_Desc
	, ORG.Org_Name
	, ORG.Org_Code
	, SAM.Samp_Code 	
	, SCT.EdenSampleReason
	, MEN.MonEnt_Code
	, SAM.Samp_Date DESC

--SELECT Samp_Code FROM dbo.Sample
--GROUP BY Samp_Code
--HAVING	COUNT(*) > 1

--SELECT Samp_Code, Samp_Date FROM dbo.Sample
--GROUP BY Samp_Code, Samp_Date
--HAVING	COUNT(*) > 1
--ORDER BY Samp_Code

--SELECT * FROM dbo.Sample
--WHERE Samp_Code = '07211523'

--SELECT * FROM dbo.Sample	WHERE Samp_Code = '1302568'
--SELECT * FROM #tmpDupSamp	WHERE Samp_Code = '1302568'		ORDER BY Samp_Code