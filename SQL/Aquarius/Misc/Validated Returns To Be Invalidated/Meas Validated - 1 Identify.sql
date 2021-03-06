-- ***************************************************************************
-- *** Display validated measurements to be invalidated
-- *** e.g. for year 2015 if all measurements validated through web interface
-- ***************************************************************************

USE [EPACentral_Aquarius]

SELECT DISTINCT
	MEA.Meas_ID
	, MEA.Hchk_ID
	, SAM.Samp_Code
	, SAM.Samp_ID
	, MON.MonEnt_Code
	, ORG.Org_Name
	, ORG.Org_Code
	, RTY.RetTyp_Desc
	, SAM.Samp_Date
	, SAM.Comp_Date
	, SCT.SamCtg_Desc
	, PRM.Prm_Desc
	, UOM.Unit_Code
	, UOM.EdenUnit
	, MEA.Meas_Result
	, MEA.Meas_TextResult
	, MEA.Report_Meas_TextResult
	, MEA.Report_Meas_Result
	, MEA.Report_ResultString
	, MEA.ResultString
	, MEA.VerifiedStatus

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


WHERE	THM.Theme_Desc		LIKE '%WASTE%'
AND		ORG.Org_Name		LIKE '%LAOIS%'
AND		MEA.Hchk_ID			= '2'	-- 1-Invalidated / 2-Validated
AND		YEAR(SAM.Samp_Date) = '2015'

ORDER BY ORG.Org_Name, SAM.Samp_Code, SAM.Samp_Date DESC
