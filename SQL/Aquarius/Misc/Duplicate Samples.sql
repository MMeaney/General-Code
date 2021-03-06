USE [EPACentral_Aquarius]

SELECT DISTINCT
	SMP.Samp_Code
	, SMP.Samp_Date
	, SMP.RetTyp_ID
	, SMP.MonEnt_ID
	, SMP.MonLoc_ID
	, MLC.Org_ID
	, SMP.Samp_LabName 
FROM		Sample				SMP
INNER JOIN	MonitoredLocation	MLC	ON	MLC.MonitoredLocation_ID = SMP.MonLoc_ID
WHERE		SMP.Samp_Date		>	'2008-01-01 00:00:00.000'
GROUP BY	SMP.Samp_Code, SMP.Samp_Date, SMP.MonEnt_ID, SMP.MonLoc_ID, SMP.Samp_LabName, SMP.RetTyp_ID, MLC.Org_ID
HAVING		COUNT(SMP.Samp_Code) > 1





--	, COUNT(SMP.Samp_Code) AS SmpCnt
