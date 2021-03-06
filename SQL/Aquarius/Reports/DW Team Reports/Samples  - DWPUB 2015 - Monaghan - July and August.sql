USE [EPACentral_Aquarius]

-- ******************************************
-- *** Determine records satisfying criteria
-- ******************************************
SELECT DISTINCT
	ORG.Org_Name
	, ORG.Org_Code
	, SMP.Samp_Date
	--, COUNT(SMP.Samp_Code)
	, SMP.Samp_Code
	, RTY.RetTyp_Desc
FROM		Sample				SMP
INNER JOIN	Measurements		MEA	ON MEA.Samp_ID				= SMP.Samp_ID
INNER JOIN	MonitoredEntity		MON	ON MON.MonEnt_ID			= SMP.MonEnt_ID
INNER JOIN	Organisations		ORG	ON ORG.Org_Id				= MON.Org_ID
LEFT JOIN	ReturnTypes			RTY	ON RTY.RetTyp_ID			= SMP.RetTyp_ID

WHERE	ORG.Org_Code	= '2400'
AND		SMP.RetTyp_ID	= '4'
AND		DATEPART(YEAR, SMP.Samp_Date) = '2015'
AND		(
			DATEPART(MONTH, SMP.Samp_Date) = '07'
			OR
			DATEPART(MONTH, SMP.Samp_Date) = '08'
		)
--GROUP BY 	ORG.Org_Name, ORG.Org_Code, SMP.Samp_Date

