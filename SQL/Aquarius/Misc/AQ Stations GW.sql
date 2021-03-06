-- ***********************************************
-- *** Monitored entites and stations - Aquarius
-- ***********************************************

USE [EPACentral_Aquarius]

SELECT DISTINCT
	STA.EdenNationalCode
	, STA.Station_Name
	, STA.Station_Code
	--, STA.*
	--, STA.StationNumber
	, BOD.EdenMonitoredEntity
	, BOD.GroundWater_Name
	--, RBD.EdenRbdCode
	, RBD.Rbd_Name
	, ORG.Org_Code
	, ORG.Org_Name
	, STA.StationXCoord
	, STA.StationYCoord
	, RTY.RetTyp_Desc

FROM		dbo.GroundWaterStation	STA
LEFT JOIN	dbo.MonitoredLocation	MLC	ON STA.Station_ID		= MLC.fkGroundWaterStation_ID
LEFT JOIN	dbo.MonitoredEntity		MON	ON MON.MonEnt_ID		= MLC.MonitoredEntity_ID
LEFT JOIN	dbo.RBD						ON RBD.Rbd_ID			= STA.MainRBD_ID
LEFT JOIN	dbo.Organisations		ORG	ON ORG.Org_ID			= MLC.Org_ID
LEFT JOIN	dbo.Theme				THM	ON THM.Theme_ID			= MON.Theme_ID
LEFT JOIN	dbo.ReturnTypes			RTY	ON RTY.Theme_ID			= MON.Theme_ID
LEFT JOIN	dbo.GroundWater			BOD	ON BOD.GroundWater_Code	= MON.MonEnt_Code

--WHERE	STA.EdenNationalCode	= 'IE_NW_G_0051_0600_0017'
--OR		STA.EdenNationalCode	= 'IE_SW_G_0004_0500_0030'
WHERE	RTY.RetTyp_Desc = 'Ground Water'
--AND		BOD.EdenMonitoredEntity IN ('IE_SW_G_0004', 'IEGBNI_NW_G_0051')
----AND		STA.EdenNationalCode LIKE '%G_0051_0600_00%'
AND		STA.Station_Name IN (
'Bawnboy',
'Cappog Bridge',
'Cavanreagh BH1',
'Clonaslee Borehole - Forest',
'Clonaslee Borehole - Plant',
'Culdaff',
'Gortinlieve GO1-Deep',
'Gortinlieve GO1-Shallow',
'Gortinlieve GO1-Transition',
'Gortinlieve GO2-Deep',
'Gortinlieve GO2-Shallow',
'Gortinlieve GO2-Transition',
'Gortinlieve GO3-Deep',
'Gortinlieve GO3-Shallow',
'Gortinlieve GO3-Subsoil',
'Gortinlieve GO3-Transition',
'Gortinlieve SW1',
'Kilmainhamwood',
'Newtown Cashel',
'Pettigo',
'The Wood',
'Tydavnet (PW-A)'
)
--AND		(STA.Station_Name LIKE '%Gortinlieve%'
--		OR
--		STA.Station_Name LIKE '%DRIPSEY%')
----AND		STA.StationYCoord LIKE '%416%'
ORDER BY  STA.EdenNationalCode, STA.Station_Name, ORG.Org_Code



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
