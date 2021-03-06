-- **************************************
-- *** Add or update queries to Aquarius

USE [EPACentral_Aquarius]

SELECT DISTINCT *
FROM	dbo.ValidationQueries
WHERE	--RetTyp_ID = 9 
--AND		ValidationQuery_Type = 'Complex'
--AND		
ValidationQuery_Name LIKE 'DWPRI Results by organisation for 2012'

-- **************
-- *** Add Query

--INSERT INTO dbo.ValidationQueries (
--[User_ID], RetTyp_ID, ValidationQuery_Name, ValidationQuery_Description, ValidationQuery_Type, ErrorText, ComparisonOperator, Value, FromValue, ToValue, ArithmeticOperator, SQLStatement
--)
--VALUES
--(
--1,
--9,
--'WW_2015_LA_Checkforunitsnotmg/l_for5wwparameters',
--'WW_2015_LA_Checkforunitsnotmg/l_for5wwparameters',
--'Complex',
--'WW_2015_LA_Checkforunitsnotmg/l_for5wwparameters',
--'',
--0.000000000,	0.000000000,	0.000000000,
--'',
--'SELECT DISTINCT prm_id 
--INTO #tmpPrm_Id
--FROM Parameter 
--WHERE Theme_Id = 12 AND Prm_Desc IN 
--	(
--	SELECT DISTINCT(Prm_Desc) FROM Parameter
--	INNER JOIN dbo.ParameterGroupMembership ON ParameterGroupMembership.Prm_Id = Parameter.Prm_id 
--	INNER JOIN dbo.ParameterGroup ON parametergroup.prmgrp_id = parametergroupmembership.prmgrp_id  
--	WHERE ParameterGroup.Name LIKE ''WW%''
--	)   
--AND Unit_ID <> 39

--SELECT DISTINCT
--Measurements.Hchk_ID
--, Org_Name
--, Sample.Samp_Code
--, Sample.Samp_Date
--, SampleType.SamTyp_Desc
--, MonitoredLocation.MonitoredLocation_Code
--, Measurements.Meas_Result
--, Measurements.Meas_TextResult
--, Parameter.Prm_Code
--, Parameter.Prm_Desc
--, UnitOfMeasure.Unit_Code
--, UnitOfMeasure.Unit_Name
--, WasteWaterStation.EdenNationalCode AS EdenCode
--, WasteWaterStation.Station_Name
--, Measurements.ConfidenceInterval
--, Sample.Samp_LabName
--, WasteWater.WW_Name AS EntName
--FROM dbo.Sample
--INNER JOIN dbo.Measurements ON Sample.Samp_ID = Measurements.Samp_ID
--INNER JOIN dbo.MonitoredLocation ON Sample.MonLoc_ID = dbo.MonitoredLocation.MonitoredLocation_ID
--INNER JOIN dbo.WasteWaterStation ON  dbo.MonitoredLocation.fkWasteWaterStation_ID = WasteWaterStation.Station_ID
--INNER JOIN dbo.MonitoredEntity ON Sample.MonEnt_ID = MonitoredEntity.MonEnt_ID
--INNER JOIN dbo.WasteWater ON MonitoredEntity.fkWasteWater_ID = WasteWater.WW_ID
--INNER JOIN dbo.SampleType ON Sample.SampTyp_ID = SampleType.SamTyp_id
--INNER JOIN dbo.Parameter ON Measurements.Prm_ID = Parameter.Prm_id 
--INNER JOIN dbo.UnitOfMeasure ON Measurements.Unit_ID = UnitOfMeasure.Unit_ID
--INNER JOIN dbo.Organisations ON Organisations.Org_Id = Monitoredlocation.Org_ID   
--WHERE	DATEPART(YEAR, Samp_Date) = 2015 
--AND		Measurements.Prm_ID IN 
--		(
--		SELECT prm_id FROM #tmpPrm_Id
--		)
--AND Samp_LabName LIKE ''%EDEN%''
--AND SampTyp_ID = 20
--'
--)
/*
--WW_2014_LA_sampleDates_not_2014
--WW_2014_LA_Checkforunitsnotmg/l_for5wwparameters
*/


---- *****************
---- *** Update Query
--USE [EPACentral_Aquarius]

--UPDATE dbo.ValidationQueries
--SET SQLStatement = 'SELECT    org_name,Sample.Samp_Code as Samp_Code, Sample.Samp_Date as Samp_Date, SampleType.SamTyp_Desc AS SampType_Desc, SampleMethod.SampleMethod_Name,         WasteWater.WW_Name as WWTP,MonitoredLocation.MonitoredLocation_Code as EDEN_stationcode, WasteWaterStation.Station_Name as StationName, Measurements.Meas_Result as Meas_Result,          Measurements.Meas_TextResult as Meas_TextResult,ResultString,limitofdetection, Parameter.Prm_Code as Prm_Code,          Parameter.Prm_Desc as Prm_Desc, UnitOfMeasure.Unit_Code as Unit_Code, UnitOfMeasure.Unit_Name as Unit_Name,                                        Sample.Samp_LabName ,Report_Meas_Result,Report_Meas_TextResult,report_resultstring,report_limit  FROM        Sample   inner join Measurements on Sample.Samp_ID = Measurements.Samp_ID    inner join MonitoredLocation on Sample.MonLoc_ID = dbo.MonitoredLocation.MonitoredLocation_ID  inner join WasteWaterStation on  dbo.MonitoredLocation.fkWasteWaterStation_ID = WasteWaterStation.Station_ID  inner join MonitoredEntity on Sample.MonEnt_ID = MonitoredEntity.MonEnt_ID  inner join WasteWater on MonitoredEntity.fkWasteWater_ID = WasteWater.WW_ID  inner join   SampleType ON Sample.SampTyp_ID = SampleType.SamTyp_id  INNER JOIN  Parameter ON Measurements.Prm_ID = Parameter.Prm_id   INNER JOIN  UnitOfMeasure ON Measurements.Unit_ID = UnitOfMeasure.Unit_ID   inner join organisations ON Organisations.Org_Id = Monitoredlocation.Org_ID   inner join SampleMethod on Sample.SampleMethod_ID = SampleMethod.SampleMethod_ID  and DATEPART(year,samp_date) = 2015  where Samp_LabName LIKE ''%EDEN%''  and Sample.SampTyp_ID = 20)'
--WHERE ValidationQuery_ID = 671


---- *****************
---- *** Delete Query
--USE [EPACentral_Aquarius]

--DELETE FROM dbo.ValidationQueries
--WHERE ValidationQuery_ID = 545

-- *** 2016-02-02: Delete 2013 Queries: 
--WW_2013_LA_Stats_summary_by_org
--WW_2013_LA_Stats_List_countBOD_by_org
--WW_2013_LA_Stats_List_BODgrt25_by_org
--WW_2013_LA_Stats_List_BODgrt50_by_org
--WW_2013_LA_Stats_List_CountCOD_by_org
--WW_2013_LA_Stats_List_CODgrt125_by_org
--WW_2013_LA_Stats_List_CODgrt250_by_org
--WW_2013_LA_Stats_List_CountSS_by_org
--WW_2013_LA_Stats_List_SSgrt35_by_org
--WW_2013_LA_Stats_List_SSgrt87_5_by_org
--WW_2013_LA_Stats_summary_ommited_by_org
--WHERE ValidationQuery_ID = 
--313
--314
--315
--316
--317
--318
--319
--320
--321
--322
--324

--DELETE FROM dbo.ValidationQueries
--WHERE ValidationQuery_ID = 324

