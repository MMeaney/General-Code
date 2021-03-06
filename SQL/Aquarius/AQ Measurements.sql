USE [EPACentral_Aquarius]

-- ***********************************************
-- *** Determine measurements satisfying criteria
-- ***********************************************

SELECT DISTINCT
	SAM.Samp_Code
	, SAM.Samp_ID
	, MEA.Meas_ID
	, MON.MonEnt_Code
	, MLC.MonitoredLocation_Code
	, ORG.Org_Name
	, SST.Station_Name
	, CASE
		  WHEN PRM.Prm_Desc	 = 'True Colour'
				THEN	  'Colour'
				ELSE	  PRM.Prm_Desc
		  END
		  AS ParamDesc
	, MEA.Meas_Result
	, MEA.Report_Meas_TextResult
	, UOM.Unit_Code
	, MEA.ResultString
	, MEA.Report_Meas_Result
	, MEA.Report_ResultString
	, UOM.Unit_Name
	, SCT.EdenSampleReason
	, THM.Theme_Desc
	, SAM.Samp_Date
	, SAM.Comp_Date
	, MEA.Meas_Date
	, MEA.MinimumRequiredConcentration
	, MEA.MaximumAllowedConcentration
	, MEA.VerifiedStatus
	, MEA.FromEDEN
	, STY.SamTyp_Desc
	, SST.Station_Code
	, MEA.Meas_TextResult
	, MEA.Hchk_ID
	, HCK.Hchk_Desc
	, MEA.FileIdentity
	, MEA.Analyst
	, MEA.LimitOfDetection
	, SCH.Sch_Name
	, MON.Theme_id
	, MEA.Report_Limit
	, SMT.SampleMethod_Name
	, SAM.Samp_LabName
	, SAM.Samp_AnalName

FROM		Sample				SAM
INNER JOIN	Measurements		MEA	ON MEA.Samp_ID				 = SAM.Samp_ID
INNER JOIN	ReturnTypes			RTY	ON RTY.RetTyp_ID			 = SAM.RetTyp_ID
INNER JOIN	MonitoredEntity		MON	ON MON.MonEnt_ID			 = SAM.MonEnt_ID
INNER JOIN	Organisations		ORG	ON ORG.Org_Id				 = MON.Org_ID
INNER JOIN	SampleType			STY	ON STY.SamTyp_id			 = SAM.SampTyp_ID
INNER JOIN	SampleCategory		SCT	ON SCT.SamCtg_id			 = SAM.SamCtg_ID
INNER JOIN	SampleMethod		SMT	ON SMT.SampleMethod_ID		 = SAM.SampleMethod_ID
INNER JOIN	MonitoredLocation	MLC	ON MLC.MonitoredLocation_ID	 = SAM.MonLoc_ID
INNER JOIN	Theme				THM	ON THM.Theme_id				 = MON.Theme_ID
INNER JOIN	Parameter			PRM	ON PRM.Prm_id				 = MEA.Prm_ID
INNER JOIN	UnitOfMeasure		UOM	ON UOM.Unit_ID				 = MEA.Unit_ID
INNER JOIN	HealthCheck			HCK	ON HCK.Hchk_id				 = MEA.Hchk_ID
LEFT JOIN	Scheme				SCH	ON SCH.EdenMonitoredEntity	 = MON.MonEnt_Code
LEFT JOIN	SchemeStation		SST	ON SST.Station_Code			 = MLC.MonitoredLocation_Code

WHERE	YEAR(SAM.Samp_Date)	= 2014
AND		ORG.Org_Name		LIKE '%Laois%'
AND		THM.Theme_Desc		LIKE '%WASTE%'
AND		SAM.Samp_Code		IN	(
'14340079',
'14340080',
'14340169',
'14340169',
'14340170',
'14340170',
'14340271',
'14340271',
'14340272',
'14340272',
'14340373',
'14340373',
'14340374',
'14340374',
'14340529',
'14340529',
'14340530',
'14340530',
'14340643',
'14340643',
'14340644',
'14340644',
'14340828',
'14340828',
'14340829',
'14340829',
'14341004',
'14341004',
'14341164',
'14341164',
'14341223',
'14341386',
'14341589',
'14341589'
)
--AND		MEA.AccreditedResult	=	 '1'

--ORDER BY ParamDesc



/*
--ORDER BY PRM.Prm_Desc, 1, 2
--*/






/*

WHERE	
ORG.Org_Name			LIKE '%TIPP%'
AND		THM.Theme_Desc	LIKE '%WASTE%'
AND		DATEPART(YEAR, SAM.Samp_Date) = '2015'
--AND SAM.Samp_Code	= '14370003'


	--, SAM.Details
	--, RTY.RetTyp_Desc
	--, SAM.Source_ID
	--, SCT.SamCtg_Desc
	--, MLC.fkSchemeStation_ID
--LEFT JOIN	Returns				RTS	ON RTS.Ret_ID		= SAM.RetTyp_ID




--SELECT * FROM Scheme	WHERE SCHEME.Sch_Code = '1700PRI0207'
--SELECT * FROM Organisations WHERE Organisations.Org_Code = '2100'
--SELECT * FROM MonitoredLocation
--SELECT * FROM MonitoredEntity
--SELECT * FROM MonitoredEntity WHERE MonEnt_Code = '21000004'
--SELECT * FROM SchemeStation WHERE Station_Name	=	'Gallon'
*/
