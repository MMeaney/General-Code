USE [EPACentral_Aquarius]

-- ********************************************************
-- *** Report for Raymond Smith - RW + LW
-- *** Date: 2015-08-27
-- *** 1. Surveillance river data from 2013 to present
-- *** 2. Surveillance lake data from 2013 to present
-- *** Environmental Parameters at end of script
-- ********************************************************


DECLARE @TimeGenerated2	DATETIME
SET		@TimeGenerated2	= GETDATE()

SELECT DISTINCT
	THM.Theme_Desc					AS	[Theme]
	, PRM.Prm_Desc					AS	[Parameter]
	, SCT.SamCtg_Desc				AS	[Category]
	, DATEPART(YEAR, SMP.Samp_Date)	AS	[Year]
	, COUNT(MEA.Meas_ID)			AS	[Meas_Count]
FROM		Sample				SMP
INNER JOIN	Measurements		MEA	ON MEA.Samp_ID		= SMP.Samp_ID
INNER JOIN	MonitoredEntity		MON	ON MON.MonEnt_ID	= SMP.MonEnt_ID
INNER JOIN	Organisations		ORG	ON ORG.Org_Id		= MON.Org_ID
INNER JOIN	Parameter			PRM	ON PRM.Prm_id		= MEA.Prm_ID
INNER JOIN	Theme				THM	ON THM.Theme_id		= PRM.Theme_ID
INNER JOIN	UnitOfMeasure		UNT	ON UNT.Unit_ID		= MEA.Unit_ID
INNER JOIN	SampleCategory		SCT	ON SCT.SamCtg_id	= SMP.SamCtg_ID
WHERE	SMP.SamCtg_ID	=	'1'
AND		DATEPART(YEAR, SMP.Samp_Date) >	 '2012'
AND		SMP.Samp_Date < @TimeGenerated2
AND
(	
	(	
	PRM.Theme_ID		= ('0')
	AND	PRM.Prm_Code	IN	('4532', '4533', '111', '128', '129', '314', '315')
	)
	OR	
	(	
	PRM.Theme_ID		= ('1')
	AND	PRM.Prm_Code	IN	('54', '55', '128', '129', '275', '276', '825')
	)
)
GROUP BY 
	THM.Theme_Desc
	, PRM.Prm_Desc
	, SCT.SamCtg_Desc
	, DATEPART(YEAR, SMP.Samp_Date)
ORDER BY 
	THM.Theme_Desc DESC
	, PRM.Prm_Desc
	, DATEPART(YEAR, SMP.Samp_Date)


DECLARE @TimeGenerated	DATETIME
SET		@TimeGenerated	= GETDATE()

SELECT DISTINCT
	THM.Theme_Desc					AS	[Theme]
	, PRM.Prm_Desc					AS	[Parameter]
	, MEA.Meas_Result
	, MEA.Meas_TextResult
	, MEA.Report_ResultString
	, MEA.Analyst
	, MEA.Meas_Date
	, SMP.Samp_Code
	, ORG.Org_Name
	, SCT.SamCtg_Desc				AS	[Category]
	, DATEPART(YEAR, SMP.Samp_Date)	AS	[Year]
FROM		Sample				SMP
INNER JOIN	Measurements		MEA	ON MEA.Samp_ID		= SMP.Samp_ID
INNER JOIN	MonitoredEntity		MON	ON MON.MonEnt_ID	= SMP.MonEnt_ID
INNER JOIN	Organisations		ORG	ON ORG.Org_Id		= MON.Org_ID
INNER JOIN	Parameter			PRM	ON PRM.Prm_id		= MEA.Prm_ID
INNER JOIN	Theme				THM	ON THM.Theme_id		= PRM.Theme_ID
INNER JOIN	UnitOfMeasure		UNT	ON UNT.Unit_ID		= MEA.Unit_ID
INNER JOIN	SampleCategory		SCT	ON SCT.SamCtg_id	= SMP.SamCtg_ID
WHERE	SMP.SamCtg_ID	=	'1'
AND		DATEPART(YEAR, SMP.Samp_Date) >	 '2012'
AND		SMP.Samp_Date < @TimeGenerated
AND
(	
	(	
	PRM.Theme_ID		= ('0')
	AND	PRM.Prm_Code	IN	('4532', '4533', '111', '128', '129', '314', '315')
	)
	OR	
	(	
	PRM.Theme_ID		= ('1')
	AND	PRM.Prm_Code	IN	('54', '55', '128', '129', '275', '276', '825')
	)
)
ORDER BY 
	THM.Theme_Desc DESC
	, PRM.Prm_Desc
	, ORG.Org_Name
	, DATEPART(YEAR, SMP.Samp_Date)
	
	
	
	
/*
-- ********************************************************
-- *** Measurement count

DECLARE @TimeGenerated2	DATETIME
SET		@TimeGenerated2	= GETDATE()

SELECT DISTINCT
	THM.Theme_Desc					AS	[Theme]
	, PRM.Prm_Desc					AS	[Parameter]
	, SCT.SamCtg_Desc				AS	[Category]
	, DATEPART(YEAR, SMP.Samp_Date)	AS	[Year]
	, COUNT(MEA.Meas_ID)			AS	[Meas_Count]
FROM		Sample				SMP
INNER JOIN	Measurements		MEA	ON MEA.Samp_ID		= SMP.Samp_ID
INNER JOIN	MonitoredEntity		MON	ON MON.MonEnt_ID	= SMP.MonEnt_ID
INNER JOIN	Organisations		ORG	ON ORG.Org_Id		= MON.Org_ID
INNER JOIN	Parameter			PRM	ON PRM.Prm_id		= MEA.Prm_ID
INNER JOIN	Theme				THM	ON THM.Theme_id		= PRM.Theme_ID
INNER JOIN	UnitOfMeasure		UNT	ON UNT.Unit_ID		= MEA.Unit_ID
INNER JOIN	SampleCategory		SCT	ON SCT.SamCtg_id	= SMP.SamCtg_ID
WHERE	SMP.SamCtg_ID	=	'1'
AND		DATEPART(YEAR, SMP.Samp_Date) >	 '2012'
AND		SMP.Samp_Date < @TimeGenerated2
AND
(	
	(	
	PRM.Theme_ID		= ('0')
	AND	PRM.Prm_Code	IN	('4532', '4533', '111', '128', '129', '314', '315')
	)
	OR	
	(	
	PRM.Theme_ID		= ('1')
	AND	PRM.Prm_Code	IN	('54', '55', '128', '129', '275', '276', '825')
	)
)
GROUP BY 
	THM.Theme_Desc
	, PRM.Prm_Desc
	, SCT.SamCtg_Desc
	, DATEPART(YEAR, SMP.Samp_Date)
ORDER BY 
	THM.Theme_Desc DESC
	, PRM.Prm_Desc
	, DATEPART(YEAR, SMP.Samp_Date)

--*/














-- ********************************************************
-- *** Environmental Parameters:

-- River Water	Calcium Hardness (as Ca)	-- Double check for measurements with or without this paramter matrix
-- River Water	Calcium Hardness (as CaCO3)
-- River Water	Chloride
-- River Water	Conductivity @20°C
-- River Water	Conductivity @25°C
-- River Water	Total Hardness (as Ca)
-- River Water	Total Hardness (as CaCO3)
-- Lake Water	Alkalinity-total (as CaCO3)
-- Lake Water	Alkalinity-total (as HCO3)
-- Lake Water	Conductivity @20°C
-- Lake Water	Conductivity @25°C
-- Lake Water	Silica (as Si)
-- Lake Water	Silica (as SiO2)
-- Lake Water	Silica (as SiO2)
-- ********************************************************


-- ********************************************************
-- *** Sandbox

/*

SELECT 
	THM.Theme_Desc
	, PRM.Prm_Desc
	, PRM.* 
FROM		Parameter	PRM
INNER JOIN	Theme		THM	ON THM.Theme_id	= PRM.Theme_ID
WHERE	
(	
	PRM.Theme_ID	= ('0')
	AND
	(
			PRM.Prm_Desc	LIKE '%Cond%'
	OR		PRM.Prm_Desc	LIKE '%Hard%'
	OR		PRM.Prm_Desc	LIKE '%Chlorid%'
	)
		
)
OR	
(	
	PRM.Theme_ID	= ('1')
	AND
	(
			PRM.Prm_Desc	LIKE '%Cond%'
	OR		PRM.Prm_Desc	LIKE '%Alk%'
	OR		PRM.Prm_Desc	LIKE '%Sili%'
	)
)
ORDER BY PRM.Theme_ID, PRM.Prm_Desc

--*/







/*
	--, SMP.Samp_Code
	--, MEA.Meas_ID
	--, MEA.Hchk_ID
	--, MON.MonEnt_Code
	--, ORG.Org_Name
	--, ORG.Org_Code
	--, SMP.Samp_Date
	--, SMP.Comp_Date
	--, MEA.Meas_Date
	--, MEA.*
	--, SMP.*
	--, PRM.* 


--*/