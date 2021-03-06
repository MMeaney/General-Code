-- ******************************************************
-- *** Count of accredited and non-accredited DW results 
-- *** by year and by supply type
-- ******************************************************

USE		[EPACentral_Aquarius]
DECLARE @ResultsYear	NVARCHAR(4)
SET		@ResultsYear	= '2014'

SELECT DISTINCT	
	ORG.Org_Name		AS [Local Authority]
	, SPP.Sup_Name		AS [Supply Type]
	, ISNULL(SUM(CASE WHEN MEA.AccreditedResult = '1' THEN 1 END), 0) AS [Accredited]
	, ISNULL(SUM(CASE WHEN MEA.AccreditedResult = '0' THEN 1 END), 0) AS [Non-Accr]
	, SCY.SchYr_Year	AS [Year]
	
FROM		Sample				SMP
INNER JOIN	Measurements		MEA	ON MEA.Samp_ID		= SMP.Samp_ID
INNER JOIN	MonitoredEntity		MON	ON MON.MonEnt_ID	= SMP.MonEnt_ID
INNER JOIN	MonitoredLocation	MLC	ON SMP.MonLoc_ID	= MLC.MonitoredLocation_ID
INNER JOIN	Scheme				SCH	ON MON.fkScheme_ID	= SCH.Sch_id
INNER JOIN	SchemeYears			SCY	ON SCY.Sch_id		= SCH.Sch_id
INNER JOIN	SupplyType			SPP	ON SPP.Sup_id		= SCY.Sup_ID
INNER JOIN	Organisations		ORG	ON ORG.Org_Id		= MON.Org_ID
INNER JOIN	Theme				THM	ON THM.Theme_id		= MON.Theme_ID

WHERE	DATEPART(YEAR, SMP.Samp_Date)	= @ResultsYear
AND		SCY.SchYr_Year					= @ResultsYear
AND		THM.Theme_Desc IN 
		(
		'Drinking Water Public',
		'Drinking Water Private'
		)

GROUP BY
	ORG.Org_Name
	, ORG.Org_Code
	, SCY.SchYr_Year
	, SPP.Sup_Name

ORDER BY
	ORG.Org_Name, SPP.Sup_Name







/*
-- **************************************************************
-- *** Results total without supply type breakdown

DECLARE @ResultsYear	NVARCHAR(4)
SET		@ResultsYear	= '2014'

SELECT DISTINCT	
	ORG.Org_Name	AS [Local Authority]
	, ISNULL(SUM(
		CASE WHEN MEA.AccreditedResult = '1' THEN 1	END),0)	AS	[Accr]
	, ISNULL(SUM(
		CASE WHEN MEA.AccreditedResult = '0' THEN 1	END),0)	AS	[NonAccr]
	, DATEPART(YEAR, SMP.Samp_Date)	AS [Year]
	
FROM		Sample				SMP
INNER JOIN	Measurements		MEA	ON MEA.Samp_ID				 = SMP.Samp_ID
INNER JOIN	MonitoredEntity		MON	ON MON.MonEnt_ID			 = SMP.MonEnt_ID
INNER JOIN	MonitoredLocation	MLC	ON MLC.MonitoredLocation_ID	 = SMP.MonLoc_ID
INNER JOIN	Organisations		ORG	ON ORG.Org_Id				 = MON.Org_ID
INNER JOIN	Theme				THM	ON THM.Theme_id				 = MON.Theme_ID

WHERE	DATEPART(YEAR, SMP.Samp_Date)	= @ResultsYear
AND		THM.Theme_Desc IN 
		(
		'Drinking Water Public',
		'Drinking Water Private'
		)

GROUP BY
	ORG.Org_Name
	, ORG.Org_Code
	, DATEPART(YEAR, SMP.Samp_Date)

ORDER BY
	ORG.Org_Name


-- **************************************************************
-- *** Original query - 2014 results sent to Yvonne

--SELECT DISTINCT	
--	ORG.Org_Name					AS [Local Authority]
--	, COUNT(SMP.Samp_Code)			AS [Total]
--	, MEA.AccreditedResult			AS [Accr]
--	, DATEPART(YEAR, SMP.Samp_Date)	AS [Year]
	
--FROM		Sample				SMP
--INNER JOIN	Measurements		MEA	ON MEA.Samp_ID				 = SMP.Samp_ID
--INNER JOIN	MonitoredEntity		MON	ON MON.MonEnt_ID			 = SMP.MonEnt_ID
--INNER JOIN	MonitoredLocation	MLC	ON MLC.MonitoredLocation_ID	 = SMP.MonLoc_ID
--INNER JOIN	Organisations		ORG	ON ORG.Org_Id				 = MON.Org_ID
--INNER JOIN	Theme				THM	ON THM.Theme_id				 = MON.Theme_ID

--WHERE	DATEPART(YEAR, SMP.Samp_Date)	= '2014'
--AND		MEA.AccreditedResult			= '1'
--AND		THM.Theme_Desc IN 
--		(
--		'Drinking Water Public',
--		'Drinking Water Private'
--		)

--GROUP BY
--	ORG.Org_Name
--	, ORG.Org_Code
--	, DATEPART(YEAR, SMP.Samp_Date)
--	, MEA.AccreditedResult

--ORDER BY
--	ORG.Org_Name
--	, MEA.AccreditedResult	DESC

-- **************************************************************


-- **************************************************************
-- *** Sandbox
	
	, ORG.Org_Code					AS [LACode]
	, THM.Theme_Desc
	, THM.Theme_Code
	

INNER JOIN	MonitoredLocation	MLC	ON MLC.MonitoredLocation_ID	 = SMP.MonLoc_ID
INNER JOIN	Parameter			PRM	ON PRM.Prm_id				 = MEA.Prm_ID
INNER JOIN	UnitOfMeasure		UOM	ON UOM.Unit_ID				 = MEA.Unit_ID
INNER JOIN	HealthCheck			HCK	ON HCK.Hchk_id				 = MEA.Hchk_ID
LEFT JOIN	Scheme				SCH	ON SCH.EdenMonitoredEntity	 = MON.MonEnt_Code
LEFT JOIN	SchemeStation		SST	ON SST.Station_Code			 = MLC.MonitoredLocation_Code

INNER JOIN	ReturnTypes			RTY	ON RTY.RetTyp_ID			 = SMP.RetTyp_ID

INNER JOIN	SampleType			STY	ON STY.SamTyp_id			 = SMP.SampTyp_ID
INNER JOIN	SampleCategory		SCT	ON SCT.SamCtg_id			 = SMP.SamCtg_ID
INNER JOIN	SampleMethod		SMT	ON SMT.SampleMethod_ID		 = SMP.SampleMethod_ID


AND		ORG.Org_Code					= '0100'

--*/
