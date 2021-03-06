-- **************************************
-- *** Add or update queries to Aquarius

USE [EPACentral_Aquarius]

SELECT DISTINCT *
FROM	dbo.ValidationQueries
WHERE	RetTyp_ID = 9 AND [ValidationQuery_Type] = 'Complex'

---- **************
---- *** Add Query
--INSERT INTO dbo.ValidationQueries
--(
--[User_ID]
--, RetTyp_ID
--, ValidationQuery_Name
--, ValidationQuery_Description
--, ValidationQuery_Type
--, ErrorText
--, ComparisonOperator
--, Value
--, FromValue
--, ToValue
--, ArithmeticOperator
--, SQLStatement
--)
--VALUES
--(
--1,
--9,
--'ALL WW 2015 results',
--'ALL WW 2015 results',
--'Custom',
--'ALL WW 2015 results',
--'',
--0.000000000,	0.000000000,	0.000000000,
--'',
--'SELECT    org_name,Sample.Samp_Code as Samp_Code, Sample.Samp_Date as Samp_Date, SampleType.SamTyp_Desc AS SampType_Desc, SampleMethod.SampleMethod_Name,         WasteWater.WW_Name as WWTP,MonitoredLocation.MonitoredLocation_Code as EDEN_stationcode, WasteWaterStation.Station_Name as StationName, Measurements.Meas_Result as Meas_Result,          Measurements.Meas_TextResult as Meas_TextResult,ResultString,limitofdetection, Parameter.Prm_Code as Prm_Code,          Parameter.Prm_Desc as Prm_Desc, UnitOfMeasure.Unit_Code as Unit_Code, UnitOfMeasure.Unit_Name as Unit_Name,                                        Sample.Samp_LabName ,Report_Meas_Result,Report_Meas_TextResult,report_resultstring,report_limit  FROM        Sample   inner join Measurements on Sample.Samp_ID = Measurements.Samp_ID    inner join MonitoredLocation on Sample.MonLoc_ID = dbo.MonitoredLocation.MonitoredLocation_ID  inner join WasteWaterStation on  dbo.MonitoredLocation.fkWasteWaterStation_ID = WasteWaterStation.Station_ID  inner join MonitoredEntity on Sample.MonEnt_ID = MonitoredEntity.MonEnt_ID  inner join WasteWater on MonitoredEntity.fkWasteWater_ID = WasteWater.WW_ID  inner join   SampleType ON Sample.SampTyp_ID = SampleType.SamTyp_id  INNER JOIN  Parameter ON Measurements.Prm_ID = Parameter.Prm_id   INNER JOIN  UnitOfMeasure ON Measurements.Unit_ID = UnitOfMeasure.Unit_ID   inner join organisations ON Organisations.Org_Id = Monitoredlocation.Org_ID   inner join SampleMethod on Sample.SampleMethod_ID = SampleMethod.SampleMethod_ID  and DATEPART(year,samp_date) = 2015'
--)

---- *** WW_2015_Effluent_LA_data
--INSERT INTO dbo.ValidationQueries
--(
--[User_ID]
--, RetTyp_ID
--, ValidationQuery_Name
--, ValidationQuery_Description
--, ValidationQuery_Type
--, ErrorText
--, ComparisonOperator
--, Value
--, FromValue
--, ToValue
--, ArithmeticOperator
--, SQLStatement
--)
--VALUES
--(
--1,
--9,
--'WW_2015_Effluent_LA_data',
--'WW_2015_Effluent_LA_data',
--'Custom',
--'WW_2015_Effluent_LA_data',
--'',
--0.000000000,	0.000000000,	0.000000000,
--'',
--'SELECT    org_name,Sample.Samp_Code as Samp_Code, Sample.Samp_Date as Samp_Date, SampleType.SamTyp_Desc AS SampType_Desc, SampleMethod.SampleMethod_Name,         WasteWater.WW_Name as WWTP,MonitoredLocation.MonitoredLocation_Code as EDEN_stationcode, WasteWaterStation.Station_Name as StationName, Measurements.Meas_Result as Meas_Result,          Measurements.Meas_TextResult as Meas_TextResult,ResultString,limitofdetection, Parameter.Prm_Code as Prm_Code,          Parameter.Prm_Desc as Prm_Desc, UnitOfMeasure.Unit_Code as Unit_Code, UnitOfMeasure.Unit_Name as Unit_Name,                                        Sample.Samp_LabName ,Report_Meas_Result,Report_Meas_TextResult,report_resultstring,report_limit  FROM        Sample   inner join Measurements on Sample.Samp_ID = Measurements.Samp_ID    inner join MonitoredLocation on Sample.MonLoc_ID = dbo.MonitoredLocation.MonitoredLocation_ID  inner join WasteWaterStation on  dbo.MonitoredLocation.fkWasteWaterStation_ID = WasteWaterStation.Station_ID  inner join MonitoredEntity on Sample.MonEnt_ID = MonitoredEntity.MonEnt_ID  inner join WasteWater on MonitoredEntity.fkWasteWater_ID = WasteWater.WW_ID  inner join   SampleType ON Sample.SampTyp_ID = SampleType.SamTyp_id  INNER JOIN  Parameter ON Measurements.Prm_ID = Parameter.Prm_id   INNER JOIN  UnitOfMeasure ON Measurements.Unit_ID = UnitOfMeasure.Unit_ID   inner join organisations ON Organisations.Org_Id = Monitoredlocation.Org_ID   inner join SampleMethod on Sample.SampleMethod_ID = SampleMethod.SampleMethod_ID  and DATEPART(year,samp_date) = 2015  where Samp_LabName like ''EDEN''  and Sample.SampTyp_ID = 20)'
--)

-- *** WW_2015_Effluent_EPA_Data
--INSERT INTO dbo.ValidationQueries
--(
--[User_ID]
--, RetTyp_ID
--, ValidationQuery_Name
--, ValidationQuery_Description
--, ValidationQuery_Type
--, ErrorText
--, ComparisonOperator
--, Value
--, FromValue
--, ToValue
--, ArithmeticOperator
--, SQLStatement
--)
--VALUES
--(
--1,
--9,
--'WW_2015_Effluent_EPA_Data',
--'WW_2015_Effluent_EPA_Data',
--'Custom',
--'WW_2015_Effluent_EPA_Data',
--'',
--0.000000000,	0.000000000,	0.000000000,
--'',
--'SELECT    org_name,Sample.Samp_Code as Samp_Code, Sample.Samp_Date as Samp_Date, SampleType.SamTyp_Desc AS SampType_Desc, SampleMethod.SampleMethod_Name,         WasteWater.WW_Name as WWTP,MonitoredLocation.MonitoredLocation_Code as EDEN_stationcode, WasteWaterStation.Station_Name as StationName, Measurements.Meas_Result as Meas_Result,          Measurements.Meas_TextResult as Meas_TextResult,ResultString,limitofdetection, Parameter.Prm_Code as Prm_Code,          Parameter.Prm_Desc as Prm_Desc, UnitOfMeasure.Unit_Code as Unit_Code, UnitOfMeasure.Unit_Name as Unit_Name,                                        Sample.Samp_LabName ,Report_Meas_Result,Report_Meas_TextResult,report_resultstring,report_limit  FROM        Sample   inner join Measurements on Sample.Samp_ID = Measurements.Samp_ID    inner join MonitoredLocation on Sample.MonLoc_ID = dbo.MonitoredLocation.MonitoredLocation_ID  inner join WasteWaterStation on  dbo.MonitoredLocation.fkWasteWaterStation_ID = WasteWaterStation.Station_ID  inner join MonitoredEntity on Sample.MonEnt_ID = MonitoredEntity.MonEnt_ID  inner join WasteWater on MonitoredEntity.fkWasteWater_ID = WasteWater.WW_ID  inner join   SampleType ON Sample.SampTyp_ID = SampleType.SamTyp_id  INNER JOIN  Parameter ON Measurements.Prm_ID = Parameter.Prm_id   INNER JOIN  UnitOfMeasure ON Measurements.Unit_ID = UnitOfMeasure.Unit_ID   inner join organisations ON Organisations.Org_Id = Monitoredlocation.Org_ID   inner join SampleMethod on Sample.SampleMethod_ID = SampleMethod.SampleMethod_ID  where Samp_LabName <> ''EDEN''  and Sample.SampTyp_ID = 20  and DATEPART(year,samp_date) = 2015'
--)

-- *** WW_2015_LA_Stats_List_BODgrt25_by_org
--INSERT INTO dbo.ValidationQueries
--(
--[User_ID]
--, RetTyp_ID
--, ValidationQuery_Name
--, ValidationQuery_Description
--, ValidationQuery_Type
--, ErrorText
--, ComparisonOperator
--, Value
--, FromValue
--, ToValue
--, ArithmeticOperator
--, SQLStatement
--)
--VALUES
--(
--1,
--9,
--'WW_2015_LA_Stats_List_BODgrt25_by_org',
--'WW_2015_LA_Stats_List_BODgrt25_by_org',
--'Custom',
--'WW_2015_LA_Stats_List_BODgrt25_by_org',
--'',
--0.000000000,	0.000000000,	0.000000000,
--'',
--'SELECT      org_name,      ww_Name,      ww_Code,      meas_id,      sample.Samp_ID,      samp_code,      meas_result,      meas_textresult,      ResultString,      limitofdetection,      prm_desc,      unit_name,      report_meas_result,      report_meas_textresult,      report_resultstring   FROM        Sample   inner join Measurements on Sample.Samp_ID = Measurements.Samp_ID    inner join MonitoredLocation on Sample.MonLoc_ID = dbo.MonitoredLocation.MonitoredLocation_ID  inner join WasteWaterStation on  dbo.MonitoredLocation.fkWasteWaterStation_ID = WasteWaterStation.Station_ID  inner join MonitoredEntity on Sample.MonEnt_ID = MonitoredEntity.MonEnt_ID  inner join WasteWater on MonitoredEntity.fkWasteWater_ID = WasteWater.WW_ID  inner join   SampleType ON Sample.SampTyp_ID = SampleType.SamTyp_id  INNER JOIN  Parameter ON Measurements.Prm_ID = Parameter.Prm_id   INNER JOIN  UnitOfMeasure ON Measurements.Unit_ID = UnitOfMeasure.Unit_ID   inner join organisations ON Organisations.Org_Id = Monitoredlocation.Org_ID inner join  ParameterGroupMembership on ParameterGroupMembership.Prm_Id = parameter.Prm_id inner join  ParameterGroup on ParameterGroup.PrmGrp_Id = ParameterGroupMembership.PrmGrp_Id  where Sample.SampTyp_ID = 20 and Samp_LabName like ''%EDEN%''  and DATEPART(year,samp_date) = 2015 and  ParameterGroupMembership.PrmGrp_Id = 32  and Report_Meas_Result is not null and Report_Meas_Result <> 0   and Org_Code = ''0500''   and Report_Meas_Result > 25     ORDER BY Org_Name,WW_Name'
--)




---- *** Update WW_2015_Effluent_LA_data with LIKE '%EDEN%'
--USE [EPACentral_Aquarius]

--UPDATE dbo.ValidationQueries
--SET SQLStatement = 'SELECT    org_name,Sample.Samp_Code as Samp_Code, Sample.Samp_Date as Samp_Date, SampleType.SamTyp_Desc AS SampType_Desc, SampleMethod.SampleMethod_Name,         WasteWater.WW_Name as WWTP,MonitoredLocation.MonitoredLocation_Code as EDEN_stationcode, WasteWaterStation.Station_Name as StationName, Measurements.Meas_Result as Meas_Result,          Measurements.Meas_TextResult as Meas_TextResult,ResultString,limitofdetection, Parameter.Prm_Code as Prm_Code,          Parameter.Prm_Desc as Prm_Desc, UnitOfMeasure.Unit_Code as Unit_Code, UnitOfMeasure.Unit_Name as Unit_Name,                                        Sample.Samp_LabName ,Report_Meas_Result,Report_Meas_TextResult,report_resultstring,report_limit  FROM        Sample   inner join Measurements on Sample.Samp_ID = Measurements.Samp_ID    inner join MonitoredLocation on Sample.MonLoc_ID = dbo.MonitoredLocation.MonitoredLocation_ID  inner join WasteWaterStation on  dbo.MonitoredLocation.fkWasteWaterStation_ID = WasteWaterStation.Station_ID  inner join MonitoredEntity on Sample.MonEnt_ID = MonitoredEntity.MonEnt_ID  inner join WasteWater on MonitoredEntity.fkWasteWater_ID = WasteWater.WW_ID  inner join   SampleType ON Sample.SampTyp_ID = SampleType.SamTyp_id  INNER JOIN  Parameter ON Measurements.Prm_ID = Parameter.Prm_id   INNER JOIN  UnitOfMeasure ON Measurements.Unit_ID = UnitOfMeasure.Unit_ID   inner join organisations ON Organisations.Org_Id = Monitoredlocation.Org_ID   inner join SampleMethod on Sample.SampleMethod_ID = SampleMethod.SampleMethod_ID  and DATEPART(year,samp_date) = 2015  where Samp_LabName LIKE ''%EDEN%''  and Sample.SampTyp_ID = 20)'
--WHERE ValidationQuery_ID = 671
