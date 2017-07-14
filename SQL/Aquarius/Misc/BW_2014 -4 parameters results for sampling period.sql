SELECT     
	Org_Name
	, BathingWater.BathingWater_Name	AS [Beach_Name]
	, BathingWaterStation.Station_Name	AS [StationName]
	, Sample.Samp_Code					AS [Samp_Code]
	, Sample.Samp_Date					AS [Samp_Date]
	, SampleCategory.SamCtg_Desc		AS [Sample_Reason]
	, Parameter.Prm_Desc				AS [Prm_Desc]
	, UnitOfMeasure.Unit_code			AS [Unit_Code]
	, Measurements.Meas_Result			AS [Meas_Result]
	, Measurements.Meas_TextResult		AS [Meas_TextResult]
	, ResultString						AS [Report_Meas_TextResult]
FROM        MonitoredEntity 
INNER JOIN	BathingWaterStation 
INNER JOIN	BathingWater 		ON BathingWaterStation.BathingWater_ID = BathingWater.BathingWater_ID 
INNER JOIN	Sample 
INNER JOIN	MonitoredLocation 
INNER JOIN	Organisations 		ON MonitoredLocation.Org_ID = Organisations.Org_Id 
								ON Sample.MonLoc_ID = MonitoredLocation.MonitoredLocation_ID 
								ON BathingWaterStation.Station_Code = MonitoredLocation.MonitoredLocation_Code 
								ON MonitoredEntity.MonEnt_Code = BathingWater.BathingWater_Code 
									AND MonitoredEntity.MonEnt_ID = MonitoredLocation.MonitoredEntity_ID
INNER JOIN	Measurements		ON Sample.Samp_ID = Measurements.Samp_ID 
INNER JOIN	Parameter			ON Measurements.Prm_ID = Parameter.Prm_id 
INNER JOIN	UnitOfMeasure		ON Measurements.Unit_ID = UnitOfMeasure.Unit_ID 
INNER JOIN	Theme 				ON Parameter.Theme_ID = Theme.Theme_id 
INNER JOIN	SampleCategory		ON SampleCategory.SamCtg_id = Sample.SamCtg_ID

WHERE	Sample.SampTyp_ID				= 11 /*blue flag */
AND		MonitoredEntity.DeletedStatus	= 0
AND		MonitoredLocation.DeletedStatus	= 0 
AND		Measurements.Hchk_ID			> 0
AND		Theme.Theme_id					= 4
AND		Prm_Code						IN (803,835,665,843,804,755,660,307) /*Required parameters */
AND		Samp_Date						BETWEEN CONVERT(DATETIME, '22-May-2014 00:00:00.000') 
										AND		CONVERT(DATETIME, '15-Sep-2014 23:59:59.000')
ORDER BY Org_Name, Sample.Samp_Code, Prm_Code

				
/*  FROM         Sample INNER JOIN
 SampleType ON Sample.SampTyp_ID = SampleType.SamTyp_id INNER JOIN
 MonitoredLocation ON Sample.MonLoc_ID = MonitoredLocation.MonitoredLocation_ID INNER JOIN
 BathingwaterStation on BathingwaterStation.Station_ID = MonitoredLocation.fkBathingWaterStation_ID inner join 
 Measurements ON Sample.Samp_ID = Measurements.Samp_ID INNER JOIN
 Parameter ON Measurements.Prm_ID = Parameter.Prm_id INNER JOIN
 UnitOfMeasure ON Measurements.Unit_ID = UnitOfMeasure.Unit_ID INNER JOIN
 MonitoredEntity ON sample.MonEnt_ID = monitoredentity.monent_id  inner join
 BathingWater on  MonitoredEntity.fkBathingWater_ID = bathingwater.BathingWater_ID inner join
organisations ON Organisations.Org_Id = Monitoredlocation.Org_ID  INNER JOIN
  Theme ON Parameter.Theme_ID = Theme.Theme_id */