USE [EPACentral_Aquarius]

SELECT DISTINCT
	STA.EdenNationalCode
	, SMP.Samp_Code
	, STA.Station_Code
	, STA.Station_Name
	, MNT.MonEnt_ID
	, MNT.MonEnt_Code
	, MNT.fkRiver_ID
	, RVR.River_Name
	, MNT.Org_ID
	, MNT.Theme_ID
	, MLC.MonitoredLocation_Code
	, THM.Theme_Desc
	, ORG.Org_Name
	, SMP.Samp_ID
	, SMP.Samp_Code
	, SMP.Details
	, SMP.Samp_Date
	, SMP.Samp_LabName
	, SMP.Comp_Date
	, SMP.Hchk_ID
	, SMP.Samp_AnalName
	, SMT.SampleMethod_Name
FROM			Sample				  SMP
INNER JOIN	MonitoredEntity	  MNT	ON	MNT.MonEnt_ID				 = SMP.MonEnt_ID
INNER JOIN	MonitoredLocation	  MLC	ON	MLC.MonitoredEntity_ID	= SMP.MonLoc_ID
INNER JOIN	River					  RVR	ON	RVR.River_ID				 = MNT.fkRiver_ID
INNER JOIN	RiverStation		  STA	ON	STA.Station_ID				 = MLC.fkRiverStation_ID
INNER JOIN	Theme					  THM	ON	THM.Theme_id				 = MNT.Theme_ID
INNER JOIN	Organisations		  ORG	ON	ORG.Org_Id					 = MNT.Org_ID
INNER JOIN	SampleMethod		  SMT	ON	SMT.SampleMethod_ID		 = SMP.SampleMethod_ID
WHERE	STA.Station_ID = '26120'
ORDER BY SMP.Samp_Date DESC

--SELECT * FROM Sample WHERE Samp_Code = '1533460'
--SELECT * FROM MonitoredEntity WHERE MonEnt_ID = '4705'
--SELECT * FROM MonitoredLocation WHERE fkRiverStation_ID = '26120'
--SELECT * FROM RiverStation WHERE EdenNationalCode = 'RS15N012120'

SELECT * FROM Sample SMP
INNER JOIN MonitoredLocation	MLC	ON MLC.MonitoredLocation_ID = SMP.MonLoc_ID
INNER JOIN RiverStation			STA	ON STA.Station_ID			= MLC.fkRiverStation_ID
WHERE Station_ID = '26120'