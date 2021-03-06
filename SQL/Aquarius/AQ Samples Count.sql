-- ******************************************
-- *** Display samples and/or measurements
-- ******************************************

USE [EPACentral_Aquarius]

SELECT 
	--, SAM.Samp_ID
	STA.EdenNationalCode
	, STA.Station_Name
	, COUNT(DISTINCT SAM.Samp_Code) AS NumSamp
	, ORG.Org_Name
	, RTY.RetTyp_Desc
	--, SCT.SamCtg_Desc


FROM		dbo.RiverStation		STA
LEFT JOIN	dbo.MonitoredLocation	MLC	ON STA.Station_ID			= MLC.fkRiverStation_ID
LEFT JOIN	dbo.Sample				SAM ON MLC.MonitoredLocation_ID = SAM.MonLoc_ID
--LEFT JOIN	dbo.Measurements		MEA	ON MEA.Samp_ID				= SAM.Samp_ID
--LEFT JOIN	dbo.MonitoredEntity		MON	ON MON.MonEnt_ID			= SAM.MonEnt_ID
--LEFT JOIN	dbo.SampleType			STY	ON STY.SamTyp_id			= SAM.SampTyp_ID
LEFT JOIN	dbo.SampleCategory		SCT	ON SCT.SamCtg_id			= SAM.SamCtg_ID
--LEFT JOIN	dbo.SampleMethod		SMT	ON SMT.SampleMethod_ID		= SAM.SampleMethod_ID
LEFT JOIN	dbo.Organisations		ORG	ON ORG.Org_Id				= MLC.Org_ID
--LEFT JOIN	dbo.Theme				THM	ON THM.Theme_id				= MON.Theme_ID
--LEFT JOIN	dbo.Parameter			PRM	ON PRM.Prm_id				= MEA.Prm_ID
--LEFT JOIN	dbo.UnitOfMeasure		UOM	ON UOM.Unit_ID				= MEA.Unit_ID
--LEFT JOIN	dbo.HealthCheck			HCK	ON HCK.Hchk_id				= MEA.Hchk_ID
LEFT JOIN	dbo.ReturnTypes			RTY	ON RTY.RetTyp_ID			= SAM.RetTyp_ID
--LEFT JOIN	dbo.SchemeStation		STA	ON STA.Station_ID			= MLC.fkSchemeStation_ID
--LEFT JOIN	dbo.LakeStation			STA	ON STA.Station_ID			= MLC.fkLakeStation_Id
--LEFT JOIN	dbo.BathingWaterStation	STA	ON STA.Station_ID			= MLC.fkBathingWaterStation_ID
--LEFT JOIN	dbo.WasteWaterStation	STA	ON STA.Station_ID			= MLC.fkWasteWaterStation_ID
--LEFT JOIN	dbo.Lake	  			BOD	ON BOD.EdenMonitoredEntity	 = MON.MonEnt_Code
--LEFT JOIN	dbo.Scheme				SCH	ON SCH.EdenMonitoredEntity	 = MON.MonEnt_Code

WHERE	STA.EdenNationalCode IN 
(
'RS01B020001',
'RS06M460800',
'RS06D010200',
'RS14B190040',
'RS14B190020',
'RS09K020100',
'RS09K020200',
'RS09K020300',
'RS09K020400',
'RS09K020500',
'RS16R310380',
'RS16R310650',
'RS24C020800',
'RS34B120160',
'RS34B120180',
'RS34B120300',
'RS36y010350',
'RS36B040500',
'RS36B060600',
'RS03C020700',
'RS26C131200',
'RS10K020600',
'RS10K020500',
'RS15N020400',
'RS36K020100',
'RS38D020200',
'RS38B040200',
'RS10K280990',
'RS10K280999',
'RS12S010300',
'RS14R170990',
'RS15N020400',
'RS15G720990'
)

GROUP BY
	STA.EdenNationalCode
	, STA.Station_Name
	, ORG.Org_Name
	, RTY.RetTyp_Desc
	--, SCT.SamCtg_Desc

ORDER BY STA.EdenNationalCode

--SELECT DISTINCT
--	SAM.Samp_Code
--	--, SAM.Samp_ID
--	, STA.EdenNationalCode
--	, STA.Station_Name
--	, ORG.Org_Name
--	, STY.SamTyp_Desc
--	, RTY.RetTyp_Desc

--FROM		dbo.Sample				SAM
--INNER JOIN	dbo.MonitoredLocation	MLC	ON MLC.MonitoredLocation_ID = SAM.MonLoc_ID
--INNER JOIN	dbo.Organisations		ORG	ON ORG.Org_Id				= MLC.Org_ID
----INNER JOIN	dbo.ReturnTypes			RTY	ON RTY.RetTyp_ID			= SAM.RetTyp_ID
----INNER JOIN	dbo.SchemeStation		STA	ON STA.Station_ID			= MLC.fkSchemeStation_ID
----INNER JOIN	dbo.LakeStation			STA	ON STA.Station_ID			= MLC.fkLakeStation_Id
----INNER JOIN	dbo.BathingWaterStation	STA	ON STA.Station_ID			= MLC.fkBathingWaterStation_ID
--INNER JOIN	dbo.RiverStation		STA	ON STA.Station_ID			= MLC.fkRiverStation_ID
----INNER JOIN	dbo.WasteWaterStation	STA	ON STA.Station_ID			= MLC.fkWasteWaterStation_
----INNER JOIN	dbo.Scheme				SCH	ON SCH.EdenMonitoredEntity	 = MON.MonEnt_Code

--WHERE	STA.EdenNationalCode IN 
--(
--'RS06D010200'
--)


--'RS01B020001',
--'RS06M460800',
--'RS06D010200',
--'RS14B190040',
--'RS14B190020',
--'RS09K020100',
--'RS09K020200',
--'RS09K020300',
--'RS09K020400',
--'RS09K020500',
--'RS16R310380',
--'RS16R310650',
--'RS24C020800',
--'RS34B120160',
--'RS34B120180',
--'RS34B120300',
--'RS36y010350',
--'RS36B040500',
--'RS36B060600',
--'RS03C020700',
--'RS26C131200',
--'RS10K020600',
--'RS10K020500',
--'RS15N020400',
--'RS36K020100',
--'RS38D020200',
--'RS38B040200',
--'RS10K280990',
--'RS10K280999',
--'RS12S010300',
--'RS14R170990',
--'RS15N020400',
--'RS15G720990'


/*

FROM		dbo.Sample				SAM
--LEFT JOIN	dbo.Measurements		MEA	ON MEA.Samp_ID				= SAM.Samp_ID
--LEFT JOIN	dbo.MonitoredEntity		MON	ON MON.MonEnt_ID			= SAM.MonEnt_ID
--LEFT JOIN	dbo.SampleType			STY	ON STY.SamTyp_id			= SAM.SampTyp_ID
--LEFT JOIN	dbo.SampleCategory		SCT	ON SCT.SamCtg_id			= SAM.SamCtg_ID
--LEFT JOIN	dbo.SampleMethod		SMT	ON SMT.SampleMethod_ID		= SAM.SampleMethod_ID
LEFT JOIN	dbo.MonitoredLocation	MLC	ON MLC.MonitoredLocation_ID = SAM.MonLoc_ID
LEFT JOIN	dbo.Organisations		ORG	ON ORG.Org_Id				= MLC.Org_ID
--LEFT JOIN	dbo.Theme				THM	ON THM.Theme_id				= MON.Theme_ID
--LEFT JOIN	dbo.Parameter			PRM	ON PRM.Prm_id				= MEA.Prm_ID
--LEFT JOIN	dbo.UnitOfMeasure		UOM	ON UOM.Unit_ID				= MEA.Unit_ID
--LEFT JOIN	dbo.HealthCheck			HCK	ON HCK.Hchk_id				= MEA.Hchk_ID
--LEFT JOIN	dbo.ReturnTypes			RTY	ON RTY.RetTyp_ID			= SAM.RetTyp_ID
--LEFT JOIN	dbo.SchemeStation		STA	ON STA.Station_ID			= MLC.fkSchemeStation_ID
--LEFT JOIN	dbo.LakeStation			STA	ON STA.Station_ID			= MLC.fkLakeStation_Id
--LEFT JOIN	dbo.BathingWaterStation	STA	ON STA.Station_ID			= MLC.fkBathingWaterStation_ID
LEFT JOIN	dbo.RiverStation		STA	ON STA.Station_ID			= MLC.fkRiverStation_ID
--LEFT JOIN	dbo.WasteWaterStation	STA	ON STA.Station_ID			= MLC.fkWasteWaterStation_ID
--LEFT JOIN	dbo.Lake	  			BOD	ON BOD.EdenMonitoredEntity	 = MON.MonEnt_Code
--LEFT JOIN	dbo.Scheme				SCH	ON SCH.EdenMonitoredEntity	 = MON.MonEnt_Code
*/