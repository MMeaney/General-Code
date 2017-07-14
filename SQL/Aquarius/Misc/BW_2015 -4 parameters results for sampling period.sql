USE [EPACentral_Aquarius]

SELECT DISTINCT
	org_name
	, bathingwater.bathingwater_name	AS Beach_Name
	, bathingwaterstation.Station_Name	AS StationName
	, Sample.Samp_Code					AS Samp_Code
	, Sample.Samp_Date					AS Samp_Date
	, SampleCategory.SamCtg_Desc		AS sample_reason
	, Parameter.Prm_Desc				AS Prm_Desc
	, UnitOfMeasure.Unit_code			AS Unit_code
	, Measurements.Meas_Result			AS Meas_Result
	, Measurements.Meas_TextResult		AS Meas_TextResult
	, resultstring						AS Report_Meas_TextResult
, MonitoredEntity.DeletedStatus
, MonitoredLocation.DeletedStatus
, measurements.hchk_id
, theme.theme_id
, prm_code
FROM		MonitoredEntity
INNER JOIN	BathingWaterStation
INNER JOIN	BathingWater		ON BathingWaterStation.BathingWater_ID = BathingWater.BathingWater_ID
INNER JOIN	Sample
INNER JOIN	MonitoredLocation
INNER JOIN	Organisations		ON MonitoredLocation.Org_ID = Organisations.Org_Id 
								ON Sample.MonLoc_ID = MonitoredLocation.MonitoredLocation_ID 
								ON BathingWaterStation.Station_Code = MonitoredLocation.MonitoredLocation_Code 
								ON MonitoredEntity.MonEnt_Code = BathingWater.BathingWater_Code	
INNER JOIN	Measurements		ON Sample.Samp_ID = Measurements.Samp_ID
INNER JOIN	Parameter			ON Measurements.Prm_ID = Parameter.Prm_id
INNER JOIN	UnitOfMeasure		ON Measurements.Unit_ID = UnitOfMeasure.Unit_ID
INNER JOIN	Theme				ON Parameter.Theme_ID = Theme.Theme_id
INNER JOIN	SampleCategory		ON SampleCategory.SamCtg_id = sample.SamCtg_ID

WHERE sample.SampTyp_ID = 11 -- blue flag 
AND		dbo.MonitoredEntity.DeletedStatus = 0
AND		dbo.MonitoredLocation.DeletedStatus = 0
AND		measurements.hchk_id > 0
AND		theme.theme_id = 4
AND		prm_code IN
		(
		803
		, 835
		, 665
		, 843
		, 804
		, 755
		, 660
		, 307
		) -- Required parameters 
AND		samp_date BETWEEN CONVERT(DATETIME, '22-May-2015 00:00:00.000') AND CONVERT(DATETIME, '15-Sep-2015 23:59:59.000')
AND		Samp_Code IN ('15-0768', '31072')
ORDER BY Station_Name


SELECT * FROM dbo.[Sample] WHERE Samp_Code = '15-0768'