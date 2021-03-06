-- ***********************************************
-- *** Monitored entites and stations - Aquarius
-- ***********************************************

USE [EPACentral_Aquarius]

SELECT DISTINCT
	STA.Station_Name
	, STA.EdenNationalCode
	, MEN.MonEnt_Code
	, BOD.Lake_Code
	, BOD.EdenMonitoredEntity
	, BOD.Lake_Name
	, STA.MainRBD_ID	 AS	[StationRBD]
	, RBDSTA.Rbd_Name	 AS	[StationRBDName]
	, RBDSTA.EdenRbdCode AS	[StationRBDCode]
	, BOD.MainRBD_ID	 AS	[EntityRBD]
	, RBDBOD.Rbd_Name	 AS	[EntityRBDName]
	, RBDBOD.EdenRbdCode AS	[EntityRBDCode]
	, STA.StationXCoord
	, STA.StationYCoord
	, ORGSTA.Org_Code	 AS [Org_Code_Sta]
	, ORGSTA.Org_Name	 AS [Org_Name_Sta]
	, ORGMEN.Org_Code	 AS [Org_Code_Men]
	, ORGMEN.Org_Name	 AS [Org_Name_Men]
	, RTY.RetTyp_Desc
	, SAM.*

FROM		dbo.LakeStation			STA
LEFT JOIN	dbo.MonitoredLocation	MLC		ON STA.Station_ID	= MLC.fkLakeStation_Id
LEFT JOIN	dbo.MonitoredEntity		MEN		ON MEN.MonEnt_ID	= MLC.MonitoredEntity_ID
LEFT JOIN	dbo.Lake				BOD		ON BOD.Lake_ID		= MEN.fkLake_Id
LEFT JOIN	dbo.Organisations		ORGSTA	ON ORGSTA.Org_ID	= MLC.Org_ID
LEFT JOIN	dbo.Organisations		ORGMEN	ON ORGMEN.Org_ID	= MEN.Org_ID
LEFT JOIN	dbo.Theme				THM		ON THM.Theme_ID		= MEN.Theme_ID
LEFT JOIN	dbo.ReturnTypes			RTY		ON RTY.Theme_ID		= MEN.Theme_ID
LEFT JOIN	dbo.RBD					RBDSTA	ON RBDSTA.Rbd_ID	= STA.MainRBD_ID
LEFT JOIN	dbo.RBD					RBDBOD	ON RBDBOD.Rbd_ID	= BOD.MainRBD_ID
LEFT JOIN	dbo.Sample				SAM		ON SAM.MonLoc_ID	= MLC.MonitoredLocation_ID

WHERE	STA.EdenNationalCode IN
(
'LS360012332300030'
)

--BOD.Lake_Code LIKE '%NW_36_657%'--'SH_26_74%'--NW_36_65
--AND		THM.Theme_Desc	LIKE '%LAKE%'
--AND		STA.EdenNationalCode = 'DWMON2100PUB10105003' 
--AND		RTY.RetTyp_Desc = 'Ground Water'

ORDER BY  ORGSTA.Org_Code, STA.EdenNationalCode


SELECT DISTINCT
	STA.Station_Name
	, STA.EdenNationalCode
	, MEN.MonEnt_Code
	, BOD.River_Code
	, BOD.EdenMonitoredEntity
	, BOD.River_Name
	, STA.MainRBD_ID	 AS	[StationRBD]
	, RBDSTA.Rbd_Name	 AS	[StationRBDName]
	, RBDSTA.EdenRbdCode AS	[StationRBDCode]
	, BOD.MainRBD_ID	 AS	[EntityRBD]
	, RBDBOD.Rbd_Name	 AS	[EntityRBDName]
	, RBDBOD.EdenRbdCode AS	[EntityRBDCode]
	, STA.StationXCoord
	, STA.StationYCoord
	, ORGSTA.Org_Code	 AS [Org_Code_Sta]
	, ORGSTA.Org_Name	 AS [Org_Name_Sta]
	, ORGMEN.Org_Code	 AS [Org_Code_Men]
	, ORGMEN.Org_Name	 AS [Org_Name_Men]
	, RTY.RetTyp_Desc
	, SAM.*

FROM		dbo.RiverStation		STA
LEFT JOIN	dbo.MonitoredLocation	MLC		ON STA.Station_ID	= MLC.fkRiverStation_ID
LEFT JOIN	dbo.MonitoredEntity		MEN		ON MEN.MonEnt_ID	= MLC.MonitoredEntity_ID
LEFT JOIN	dbo.River				BOD		ON BOD.River_ID		= MEN.fkRiver_ID
LEFT JOIN	dbo.Organisations		ORGSTA	ON ORGSTA.Org_ID	= MLC.Org_ID
LEFT JOIN	dbo.Organisations		ORGMEN	ON ORGMEN.Org_ID	= MEN.Org_ID
LEFT JOIN	dbo.Theme				THM		ON THM.Theme_ID		= MEN.Theme_ID
LEFT JOIN	dbo.ReturnTypes			RTY		ON RTY.Theme_ID		= MEN.Theme_ID
LEFT JOIN	dbo.RBD					RBDSTA	ON RBDSTA.Rbd_ID	= STA.MainRBD_ID
LEFT JOIN	dbo.RBD					RBDBOD	ON RBDBOD.Rbd_ID	= BOD.MainRBD_ID
LEFT JOIN	dbo.Sample				SAM		ON SAM.MonLoc_ID	= MLC.MonitoredLocation_ID
WHERE	STA.EdenNationalCode IN
(
'RS30O020860'
)
ORDER BY  ORGSTA.Org_Code, STA.EdenNationalCode

--SELECT * FROM Lake WHERE Lake_Code LIKE '%SH_26_74%'



/*
ORDER BY  STA.Station_Name 

WHERE STA.EdenNationalCode IN
(
'IE_NB_G_0013_2400_0001',
'IE_NW_G_0063_2400_0002',
'IE_NB_G_0019_2300_0007',
'IE_EA_G_0010_2300_0021',
'IE_SH_G_0091_2000_0001',
'IE_NB_G_0012_2400_0008',
'IE_NB_G_0014_2400_0010'
)


	--, MON.MonEnt_Code
	--, STA.EdenNationalCode
	--, SMP.Samp_Date
	--, SMP.Comp_Date
	--, SCT.EdenSampleReason
	--, PRM.Prm_Desc
	--, SMP.Samp_Code
	--, SMP.Samp_ID
	--, MEA.Meas_ID
	--, MEA.Hchk_ID

	
			--dbo.SchemeStation		STA
			--dbo.LakeStation			STA
			--dbo.BathingWaterStation	STA
			--dbo.RiverStation		STA
			--dbo.WasteWaterStation	STA
			
--LEFT JOIN	dbo.Lake	  			BOD	ON BOD.EdenMonitoredEntity	 = MON.MonEnt_Code
--LEFT JOIN	dbo.Scheme				SCH	ON SCH.EdenMonitoredEntity	 = MON.MonEnt_Code



WHERE	RVR.River_Code		= '12U01'
AND		STA.Station_Code	= '0200'
AND		ORG.Org_Code		= '3300'
AND		YEAR(SAM.Samp_Date) = '2015'

SMP.Samp_Code	IN	('14-0080', '14-0109', '14-1381')
		--SMP.Samp_Code	IN	('14-1131', '14-1364')
AND	ORG.Org_Code	=	'0300'


--WHERE	  STA.Station_Code	IN ('DWMON0100PUB11425011', 'DWMON0100PUB11615006')
--WHERE MON.MonEnt_Code LIKE ('%NB_G_0019%')
--OR	  MON.MonEnt_Code LIKE ('%SH_G_0091%')
--OR	  MON.MonEnt_Code LIKE ('%NW_G_0063%')
--OR	  MON.MonEnt_Code LIKE ('%NB_G_0013%')
--OR	  MON.MonEnt_Code LIKE ('%NB_G_0014%')
--IEGBNI_NB_G_0019
--IE_SH_G_0091
--IEGBNI_NW_G_0063
--IE_NB_G_0013
--IE_NB_G_0013
--IEGBNI_NB_G_0014


--SELECT * FROM SchemeStation STA 
--LEFT JOIN	RBD	ON	RBD.Rbd_ID = STA.MainRBD_ID
--WHERE STA.Station_Code	IN ('DWMON0100PUB11425011', 'DWMON0100PUB11615006')

--SELECT TOP (5) * FROM WasteWater	WHERE WW_Code = 'DL-D0035-01'
--SELECT * FROM Scheme	WHERE SCHEME.Sch_Code = '1700PRI0207'
--SELECT * FROM Organisations WHERE Organisations.Org_Code = '2100'
--SELECT * FROM MonitoredLocation
--SELECT * FROM MonitoredEntity
--SELECT * FROM MonitoredEntity WHERE MonEnt_Code = '21000004'
--SELECT * FROM SchemeStation WHERE Station_Name	=	'Gallon'

	--, SMP.Samp_LabName
	--, SMP.Samp_AnalName
	--, SCH.Sch_Name
	--, MON.Theme_id
	--, SMT.SampleMethod_Name
	--, MLC.MonitoredLocation_Code
--ORG.Org_Name	LIKE '%Tipp%'
--AND		THM.Theme_Desc	LIKE '%WASTE%'
--AND		DATEPART(YEAR, SMP.Samp_Date) = '2015'

/****** Script for SelectTopNRows command from SSMS  ******/
SELECT DISTINCT
	 SAMCTG.SamCtg_id
	 , SAMCTG.SamCtg_Code
	 , SAMCTG.SamCtg_Desc
	 , SAMCTG.Hchk_id
	 , SAMCTG.DeletedStatus
	 , SAMCTG.EdenSampleReason
	 , SAMCTG.IncludeInReports
FROM SampleCategory SAMCTG

--*/
