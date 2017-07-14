USE [EPACentral_Aquarius]

SELECT * FROM Organisations
SELECT * FROM ReturnTypes

SELECT
	ReturnMonitoring_ID
	, Theme_ID
	, RetTyp_ID
	, Organisation_ID
	, DateOfNextReturn
	, DateOfLastReminder
	, ReturnStatus
	, DeletedStatus
	, LastDownloadDateTime
FROM	ReturnMonitoring
WHERE	Organisation_ID = 24 AND RetTyp_ID = 4 -- Galway City Council
--WHERE	Organisation_ID = 37 AND RetTyp_ID = 4 -- Mayo County Council


-- To See sample_id’s for Mayo Co and Dw public  --Not linking to measurements as some duplicate samples don’t have measurements
SELECT	DISTINCT (Sample.Samp_ID)
FROM        Sample 
INNER JOIN	SampleType			ON Sample.SampTyp_ID			= SampleType.SamTyp_id
INNER JOIN	MonitoredLocation	ON Sample.MonLoc_ID				= MonitoredLocation.MonitoredLocation_ID
INNER JOIN	SchemeStation		ON SchemeStation.Station_ID		= MonitoredLocation.fkSchemeStation_ID
INNER JOIN	MonitoredEntity		ON Sample.MonEnt_ID				= Monitoredentity.MonEnt_ID
INNER JOIN	Scheme				ON MonitoredEntity.fkScheme_ID	= Scheme.Sch_ID
INNER JOIN	Organisations		ON Organisations.Org_Id			= Monitoredlocation.Org_ID
INNER JOIN	ReturnTypes			ON ReturnTypes.RetTyp_ID		= Sample.RetTyp_ID
WHERE	Org_Name LIKE 'galway ci%'
AND		DATEPART(YEAR,Samp_Date) = 2015
AND		ReturnTypes.RetTyp_ID = 4


SELECT
	ReturnTypes.RetTyp_Code
	, Org_Name
	, Sample.Samp_Code							AS [Samp_Code] 
	, Sample.Samp_Date							AS [Samp_Date]
	, SampleType.SamTyp_Desc					AS [SampType_Desc] 
	, MonitoredLocation.MonitoredLocation_Code	AS [MonitoredLocation_Code] 
	--, Measurements.Meas_Result					AS [Meas_Result] 
	--, Measurements.Meas_TextResult				AS [Meas_TextResult] 
	--, resultstringParameter.Prm_Code				AS [Prm_Code] 
	--, Parameter.Prm_Desc							AS [Prm_Desc] 
	--, UnitOfMeasure.Unit_Code						AS [Unit_Code] 
	--, UnitOfMeasure.Unit_Name						AS [Unit_Name] 
	, SchemeStation.Station_Name					AS [StationName]
	--, Measurements.ConfidenceInterval				AS [ConfidenceInterval] 
	, Sample.Samp_LabName 
	, Scheme.Sch_Name								AS [entName] --*/
FROM        Sample 
INNER JOIN	SampleType			ON Sample.SampTyp_ID			= SampleType.SamTyp_id
INNER JOIN	MonitoredLocation	ON Sample.MonLoc_ID				= MonitoredLocation.MonitoredLocation_ID
INNER JOIN	SchemeStation		ON SchemeStation.Station_ID		= MonitoredLocation.fkSchemeStation_ID
INNER JOIN	MonitoredEntity		ON Sample.MonEnt_ID				= Monitoredentity.MonEnt_ID
INNER JOIN	Scheme				ON monitoredentity.fkScheme_ID	= Scheme.Sch_ID
INNER JOIN	Organisations		ON Organisations.Org_Id			= Monitoredlocation.Org_ID
INNER JOIN	ReturnTypes			ON ReturnTypes.RetTyp_ID		= Sample.RetTyp_ID
--WHERE	Organisations.Org_Id = 37--24
--WHERE	Org_Name LIKE 'MAYO CO%'
WHERE	Org_Name LIKE 'GALWAY CI%'
AND		DATEPART(YEAR,Samp_Date) = 2015
AND		ReturnTypes.RetTyp_ID = 4
--AND		Samp_Code = '4043120' 
--ORDER BY Samp_Code, Prm_Code
ORDER BY Sample.Samp_Date DESC

--Get  duplicates in Aquarius
--SELECT 
--	Samp_Code
--	, Samp_Date
--	, RetTyp_ID
--	, MonEnt_ID
--	, MonLoc_ID
--	, Org_ID
--	, Samp_LabName 
--FROM		Sample 
--INNER JOIN	MonitoredLocation	ON MonitoredLocation.MonitoredLocation_ID = Sample.MonLoc_ID
--GROUP BY	Samp_Code, Samp_Date, MonEnt_ID, MonLoc_ID, Samp_LabName, RetTyp_ID, Org_ID
--HAVING		COUNT(Samp_Code) > 1


-- Update  returnmonitoring table in Aquarius with first sample approval date in MDS 
-- so that all 2014 Dw pub data for kerry will get downloaded again

--BEGIN TRANSACTION
--UPDATE	ReturnMonitoring
--SET		LastDownloadDateTime = '2014-07-29 02:00:39.000'
--WHERE	Organisation_ID = 26 AND	RetTyp_ID = 4
----COMMIT TRANSACTION
    

