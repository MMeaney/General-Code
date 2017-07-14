SELECT DISTINCT 
--TOP (25)
	MNT.MonEnt_ID
	, MNT.MonEnt_Code
	, MNT.fkLake_Id
	, LAK.Lake_Name
	, MNT.Org_ID
	, LKS.Station_Code
	, LKS.Station_Name
	, THM.Theme_Desc
	, ORG.Org_Name
	, SMP.Samp_ID
	, SMP.Details
	, SMP.Samp_Date
	, SMP.Samp_LabName
	, SMP.Comp_Date
	, SMP.Hchk_ID
	, SMP.Samp_AnalName
	, SMT.SampleMethod_Name
FROM EPACentral_aquarius.dbo.MonitoredEntity MNT
	INNER JOIN MonitoredLocation	MLC	ON	MLC.MonitoredEntity_ID	= MNT.MonEnt_ID
	INNER JOIN Theme				THM	ON	THM.Theme_id			= MNT.Theme_ID
	INNER JOIN Organisations		ORG	ON	ORG.Org_Id				= MNT.Org_ID
	INNER JOIN Sample				SMP	ON	SMP.MonEnt_ID			= MNT.MonEnt_ID
	INNER JOIN SampleMethod			SMT	ON	SMP.SampleMethod_ID		= SMT.SampleMethod_ID
	INNER JOIN Lake					LAK	ON	LAK.Lake_ID				= MNT.fkLake_Id
	INNER JOIN LakeStation			LKS	ON	(LKS.Station_Code		= MLC.MonitoredLocation_Code
											AND	LAK.Lake_ID			= MNT.fkLake_Id)
WHERE
--	MNT.Org_ID = '156'
--AND
	LKS.Station_Code = '0180_Op'
--AND
--LKS.Station_Name = 'Midlake'
--AND
----MNT.fkLake_Id IN (
----'33879'
----)
----AND
--SMP.Samp_ID	IN (
----'47884',
----'1261025',
--'1293584'
--)
----AND
----LKS.Station_Code IN(
------'3030',
------'2300',
----'2400'
----)
ORDER BY SMP.Comp_Date