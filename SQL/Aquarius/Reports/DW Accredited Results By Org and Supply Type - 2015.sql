-- ******************************************************
-- *** Count of accredited and non-accredited DW results 
-- *** by year and by supply type
-- ******************************************************

USE		[EPACentral_Aquarius]

DECLARE @ResultsYear	NVARCHAR(4)
SET		@ResultsYear	= '2015'

SELECT DISTINCT	
	ORG.Org_Name		AS [Local Authority]
	, SPP.Sup_Name		AS [Supply Type]
	, SCY.SchYr_Year	AS [Year]
	, ISNULL(SUM(CASE WHEN MEA.AccreditedResult = '1' THEN 1 END), 0) AS [Accredited]
	, ISNULL(SUM(CASE WHEN MEA.AccreditedResult = '0' THEN 1 END), 0) AS [Non-Accr]

FROM		dbo.[Sample]			SAM
INNER JOIN	dbo.Measurements		MEA	ON MEA.Samp_ID		= SAM.Samp_ID
INNER JOIN	dbo.MonitoredEntity		MEN	ON MEN.MonEnt_ID	= SAM.MonEnt_ID
INNER JOIN	dbo.MonitoredLocation	MLC	ON SAM.MonLoc_ID	= MLC.MonitoredLocation_ID
INNER JOIN	dbo.Scheme				SCH	ON MEN.fkScheme_ID	= SCH.Sch_id
INNER JOIN	dbo.SchemeYears			SCY	ON SCY.Sch_id		= SCH.Sch_id
INNER JOIN	dbo.SupplyType			SPP	ON SPP.Sup_id		= SCY.Sup_ID
INNER JOIN	dbo.Organisations		ORG	ON ORG.Org_Id		= MEN.Org_ID
INNER JOIN	dbo.Theme				THM	ON THM.Theme_id		= MEN.Theme_ID

WHERE	YEAR(SAM.Samp_Date)	='2015' 
AND		SCY.SchYr_Year = '2015' 
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
	, DATEPART(YEAR, SAM.Samp_Date)	AS [Year]
	
FROM		Sample				SMP
INNER JOIN	Measurements		MEA	ON MEA.Samp_ID				 = SAM.Samp_ID
INNER JOIN	MonitoredEntity		MON	ON MON.MonEnt_ID			 = SAM.MonEnt_ID
INNER JOIN	MonitoredLocation	MLC	ON MLC.MonitoredLocation_ID	 = SAM.MonLoc_ID
INNER JOIN	Organisations		ORG	ON ORG.Org_Id				 = MON.Org_ID
INNER JOIN	Theme				THM	ON THM.Theme_id				 = MON.Theme_ID

WHERE	DATEPART(YEAR, SAM.Samp_Date)	= @ResultsYear
AND		THM.Theme_Desc IN 
		(
		'Drinking Water Public',
		'Drinking Water Private'
		)

GROUP BY
	ORG.Org_Name
	, ORG.Org_Code
	, DATEPART(YEAR, SAM.Samp_Date)

ORDER BY
	ORG.Org_Name


-- **************************************************************
-- *** Original query - 2014 results sent to Yvonne

--SELECT DISTINCT	
--	ORG.Org_Name					AS [Local Authority]
--	, COUNT(SAM.Samp_Code)			AS [Total]
--	, MEA.AccreditedResult			AS [Accr]
--	, DATEPART(YEAR, SAM.Samp_Date)	AS [Year]
	
--FROM		Sample				SMP
--INNER JOIN	Measurements		MEA	ON MEA.Samp_ID				 = SAM.Samp_ID
--INNER JOIN	MonitoredEntity		MON	ON MON.MonEnt_ID			 = SAM.MonEnt_ID
--INNER JOIN	MonitoredLocation	MLC	ON MLC.MonitoredLocation_ID	 = SAM.MonLoc_ID
--INNER JOIN	Organisations		ORG	ON ORG.Org_Id				 = MON.Org_ID
--INNER JOIN	Theme				THM	ON THM.Theme_id				 = MON.Theme_ID

--WHERE	DATEPART(YEAR, SAM.Samp_Date)	= '2014'
--AND		MEA.AccreditedResult			= '1'
--AND		THM.Theme_Desc IN 
--		(
--		'Drinking Water Public',
--		'Drinking Water Private'
--		)

--GROUP BY
--	ORG.Org_Name
--	, ORG.Org_Code
--	, DATEPART(YEAR, SAM.Samp_Date)
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
	

INNER JOIN	MonitoredLocation	MLC	ON MLC.MonitoredLocation_ID	 = SAM.MonLoc_ID
INNER JOIN	Parameter			PRM	ON PRM.Prm_id				 = MEA.Prm_ID
INNER JOIN	UnitOfMeasure		UOM	ON UOM.Unit_ID				 = MEA.Unit_ID
INNER JOIN	HealthCheck			HCK	ON HCK.Hchk_id				 = MEA.Hchk_ID
LEFT JOIN	Scheme				SCH	ON SCH.EdenMonitoredEntity	 = MON.MonEnt_Code
LEFT JOIN	SchemeStation		SST	ON SST.Station_Code			 = MLC.MonitoredLocation_Code

INNER JOIN	ReturnTypes			RTY	ON RTY.RetTyp_ID			 = SAM.RetTyp_ID

INNER JOIN	SampleType			STY	ON STY.SamTyp_id			 = SAM.SampTyp_ID
INNER JOIN	SampleCategory		SCT	ON SCT.SamCtg_id			 = SAM.SamCtg_ID
INNER JOIN	SampleMethod		SMT	ON SMT.SampleMethod_ID		 = SAM.SampleMethod_ID


AND		ORG.Org_Code					= '0100'

--*/
