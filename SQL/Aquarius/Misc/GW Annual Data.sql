SELECT DISTINCT 
STA.EdenNationalCode
--, STA.Station_Code
, STA.Station_Name
, BOD.GroundWater_Name
--, ISNULL(STA.StationFullCode, '') AS [StationFullCode]
, MON.MonEnt_Code
, THM.Theme_Desc
, ORG.Org_Name
, SAM.Samp_Code
, SAM.Samp_Date
, SAM.Comp_Date
, DATEPART(YEAR, SAM.Samp_Date)	AS [Samp_Year]
, SAM.WaterBodyCode
, PRM.Prm_Desc
, MEA.Report_Meas_Result
, MEA.Report_Meas_TextResult
, MEA.Report_ResultString
, UOM.Unit_Code
, UOM.Unit_Name
, SMT.SampleMethod_Name
, SAM.Samp_LabName
, SAM.Samp_AnalName
, MEA.Analyst
, MEA.Comment
, MEA.AccreditedResult
, MEA.VerifiedStatus

FROM dbo.MonitoredLocation MLC
LEFT JOIN dbo.GroundWaterStation STA ON STA.Station_ID = MLC.fkGroundWaterStation_ID
LEFT JOIN dbo.MonitoredEntity MON ON MON.MonEnt_ID = MLC.MonitoredEntity_ID
LEFT JOIN dbo.Theme THM	ON THM.Theme_id = MON.Theme_ID
LEFT JOIN dbo.Organisations ORG	ON ORG.Org_Id = MON.Org_ID
LEFT JOIN dbo.GroundWater BOD ON BOD.GroundWater_ID = MON.fkGroundWater_ID
INNER JOIN dbo.Sample SAM ON SAM.MonLoc_ID = MLC.MonitoredLocation_ID
LEFT JOIN dbo.SampleMethod SMT ON SMT.SampleMethod_ID = SAM.SampleMethod_ID
LEFT JOIN dbo.Measurements MEA ON MEA.Samp_ID = SAM.Samp_ID
LEFT JOIN dbo.Parameter PRM ON PRM.Prm_id = MEA.Prm_ID
LEFT JOIN dbo.UnitOfMeasure UOM ON UOM.Unit_ID = MEA.Unit_ID

WHERE THM.Theme_id = '3'
AND DATEPART(YEAR, SAM.Samp_Date) = '2015'

ORDER BY
ORG.Org_Name
, SAM.Samp_Date
, SAM.Samp_Code