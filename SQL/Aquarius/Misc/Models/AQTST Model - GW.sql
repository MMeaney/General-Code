SELECT DISTINCT 
	STA.EdenNationalCode
	, STA.Station_Code
	, STA.Station_Name
	, STA.StationFullCode
	, MON.MonEnt_Code
	, BOD.GroundWater_Name
	, THM.Theme_Desc
	, MON.Org_ID
	, ORG.Org_Name

FROM		dbo.MonitoredLocation	MLC
INNER JOIN	dbo.GroundWaterStation	STA	ON	STA.Station_ID		= MLC.fkGroundWaterStation_ID
INNER JOIN	dbo.MonitoredEntity		MON	ON	MON.MonEnt_ID		= MLC.MonitoredEntity_ID
INNER JOIN	dbo.Theme				THM	ON	THM.Theme_id		= MON.Theme_ID
INNER JOIN	dbo.Organisations		ORG	ON	ORG.Org_Id			= MON.Org_ID
INNER JOIN	dbo.GroundWater			BOD	ON	BOD.GroundWater_ID	= MON.fkGroundWater_ID

ORDER BY	ORG.Org_Name










/*
MNT.MonEnt_Code			= 'NB_G_0012'
AND		
*/