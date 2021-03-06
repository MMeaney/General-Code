-- ***********************************************
-- *** Monitored entites and stations - Aquarius
-- ***********************************************

USE [EPACentral_Aquarius]

--IF  OBJECT_ID('TempDB..#tmpStationsAll') IS NOT NULL
--	BEGIN	DROP TABLE #tmpStationsAll	END
SELECT DISTINCT
	ORGSTA.Org_Code		AS [Org_Code_Sta]
	, ORGSTA.Org_Name	AS [Org_Name_Sta]
	, ORGMEN.Org_Code	AS [Org_Code_Men]
	, ORGMEN.Org_Name	AS [Org_Name_Men]
	, RTY.RetTyp_Desc	AS [Return Type]
	, THM.Theme_Desc	AS [Theme]
	, MEN.MonEnt_Code	AS [Monitored Entity]
	, CASE
		WHEN MEN.fkBathingWater_ID				IS NOT NULL	THEN MENBW.IDBW_Code
		WHEN MEN.fkCoastalWater_ID				IS NOT NULL	THEN MENCW.Coastal_Code
		WHEN MEN.fkScheme_ID					IS NOT NULL	THEN MENDW.EdenMonitoredEntity
		WHEN MEN.fkGroundWater_ID				IS NOT NULL	THEN MENGW.EdenMonitoredEntity
		WHEN MEN.fkLake_Id						IS NOT NULL	THEN MENLW.EdenMonitoredEntity
		WHEN MEN.fkRiver_ID						IS NOT NULL	THEN MENRW.EdenMonitoredEntity
		WHEN MEN.fkTransitionalWater_ID			IS NOT NULL	THEN MENTW.Trans_Code
		WHEN MEN.fkWasteWater_ID				IS NOT NULL	THEN MENWW.EdenMonitoredEntity
	END AS [EDEN Entity Code]
	, CASE
		WHEN MEN.fkBathingWater_ID				IS NOT NULL	THEN MENBW.WFD_Code
		WHEN MEN.fkCoastalWater_ID				IS NOT NULL	THEN MENCW.WFD_Code
		WHEN MEN.fkScheme_ID					IS NOT NULL	THEN ''
		WHEN MEN.fkGroundWater_ID				IS NOT NULL	THEN MENGW.WFD_Code
		WHEN MEN.fkLake_Id						IS NOT NULL	THEN MENLW.WFD_Code
		WHEN MEN.fkRiver_ID						IS NOT NULL	THEN MENRW.WFD_Code
		WHEN MEN.fkTransitionalWater_ID			IS NOT NULL	THEN MENTW.WFD_Code
		WHEN MEN.fkWasteWater_ID				IS NOT NULL	THEN ''
	END AS [WFD Code]
	, CASE
		WHEN MEN.fkBathingWater_ID				IS NOT NULL	THEN MENBW.BathingWater_Name
		WHEN MEN.fkCoastalWater_ID				IS NOT NULL	THEN MENCW.Coastal_Name
		WHEN MEN.fkScheme_ID					IS NOT NULL	THEN MENDW.Sch_Name
		WHEN MEN.fkGroundWater_ID				IS NOT NULL	THEN MENGW.GroundWater_Name
		WHEN MEN.fkLake_Id						IS NOT NULL	THEN MENLW.Lake_Name
		WHEN MEN.fkRiver_ID						IS NOT NULL	THEN MENRW.River_Name
		WHEN MEN.fkTransitionalWater_ID			IS NOT NULL	THEN MENTW.Trans_Name
		WHEN MEN.fkWasteWater_ID				IS NOT NULL	THEN MENWW.WW_Name
	END AS [Mon Ent Name]
	, CASE
		WHEN MLC.fkBathingWaterStation_ID		IS NOT NULL	THEN STABW.EdenNationalCode
		WHEN MLC.fkCoastalWaterStation_ID		IS NOT NULL	THEN STACW.EdenNationalCode
		WHEN MLC.fkSchemeStation_ID				IS NOT NULL	THEN STADW.Station_Code
		WHEN MLC.fkGroundWaterStation_ID		IS NOT NULL	THEN STAGW.EdenNationalCode
		WHEN MLC.fkLakeStation_Id				IS NOT NULL	THEN STALW.EdenNationalCode
		WHEN MLC.fkRiverStation_ID				IS NOT NULL	THEN STARW.EdenNationalCode
		WHEN MLC.fkTransitionalWaterStation_ID	IS NOT NULL	THEN STATW.EdenNationalCode
		WHEN MLC.fkWasteWaterStation_ID			IS NOT NULL	THEN STAWW.EdenNationalCode
	END AS [Station National Code]
	, CASE
		WHEN MLC.fkBathingWaterStation_ID		IS NOT NULL	THEN STABW.Station_Name
		WHEN MLC.fkCoastalWaterStation_ID		IS NOT NULL	THEN STACW.Station_Name
		WHEN MLC.fkSchemeStation_ID				IS NOT NULL	THEN STADW.Station_Name
		WHEN MLC.fkGroundWaterStation_ID		IS NOT NULL	THEN STAGW.Station_Name
		WHEN MLC.fkLakeStation_Id				IS NOT NULL	THEN STALW.Station_Name
		WHEN MLC.fkRiverStation_ID				IS NOT NULL	THEN STARW.Station_Name
		WHEN MLC.fkTransitionalWaterStation_ID	IS NOT NULL	THEN STATW.Station_Name
		WHEN MLC.fkWasteWaterStation_ID			IS NOT NULL	THEN STAWW.Station_Name
	END AS [Station Name]
	, CASE
		WHEN MLC.fkBathingWaterStation_ID		IS NOT NULL	THEN STABW.MainRBD_ID
		WHEN MLC.fkCoastalWaterStation_ID		IS NOT NULL	THEN STACW.MainRBD_ID
		WHEN MLC.fkSchemeStation_ID				IS NOT NULL	THEN STADW.MainRBD_ID
		WHEN MLC.fkGroundWaterStation_ID		IS NOT NULL	THEN STAGW.MainRBD_ID
		WHEN MLC.fkLakeStation_Id				IS NOT NULL	THEN STALW.MainRBD_ID
		WHEN MLC.fkRiverStation_ID				IS NOT NULL	THEN STARW.MainRBD_ID
		WHEN MLC.fkTransitionalWaterStation_ID	IS NOT NULL	THEN STATW.MainRBD_ID
		WHEN MLC.fkWasteWaterStation_ID			IS NOT NULL	THEN STAWW.MainRBD_ID
	END AS [StationRBD]
	, CASE
		WHEN MLC.fkBathingWaterStation_ID		IS NOT NULL	THEN RBDSTAB.Rbd_Name
		WHEN MLC.fkCoastalWaterStation_ID		IS NOT NULL	THEN RBDSTAC.Rbd_Name
		WHEN MLC.fkSchemeStation_ID				IS NOT NULL	THEN RBDSTAD.Rbd_Name
		WHEN MLC.fkGroundWaterStation_ID		IS NOT NULL	THEN RBDSTAG.Rbd_Name
		WHEN MLC.fkLakeStation_Id				IS NOT NULL	THEN RBDSTAL.Rbd_Name
		WHEN MLC.fkRiverStation_ID				IS NOT NULL	THEN RBDSTAR.Rbd_Name
		WHEN MLC.fkTransitionalWaterStation_ID	IS NOT NULL	THEN RBDSTAT.Rbd_Name
		WHEN MLC.fkWasteWaterStation_ID			IS NOT NULL	THEN RBDSTAW.Rbd_Name
	END AS [StationRBDName]
	, CASE
		WHEN MLC.fkBathingWaterStation_ID		IS NOT NULL	THEN RBDSTAB.EdenRbdCode
		WHEN MLC.fkCoastalWaterStation_ID		IS NOT NULL	THEN RBDSTAC.EdenRbdCode
		WHEN MLC.fkSchemeStation_ID				IS NOT NULL	THEN RBDSTAD.EdenRbdCode
		WHEN MLC.fkGroundWaterStation_ID		IS NOT NULL	THEN RBDSTAG.EdenRbdCode
		WHEN MLC.fkLakeStation_Id				IS NOT NULL	THEN RBDSTAL.EdenRbdCode
		WHEN MLC.fkRiverStation_ID				IS NOT NULL	THEN RBDSTAR.EdenRbdCode
		WHEN MLC.fkTransitionalWaterStation_ID	IS NOT NULL	THEN RBDSTAT.EdenRbdCode
		WHEN MLC.fkWasteWaterStation_ID			IS NOT NULL	THEN RBDSTAW.EdenRbdCode
	END AS [StationRBDCode]
	, CASE
		WHEN MEN.fkBathingWater_ID				IS NOT NULL	THEN MENBW.MainRBD_ID
		WHEN MEN.fkCoastalWater_ID				IS NOT NULL	THEN MENCW.MainRBD_ID
		WHEN MEN.fkScheme_ID					IS NOT NULL	THEN ''
		WHEN MEN.fkGroundWater_ID				IS NOT NULL	THEN MENGW.MainRBD_ID
		WHEN MEN.fkLake_Id						IS NOT NULL	THEN MENLW.MainRBD_ID
		WHEN MEN.fkRiver_ID						IS NOT NULL	THEN MENRW.MainRBD_ID
		WHEN MEN.fkTransitionalWater_ID			IS NOT NULL	THEN MENTW.MainRBD_ID
		WHEN MEN.fkWasteWater_ID				IS NOT NULL	THEN ''
	END AS [EntityRBD]
	, CASE
		WHEN MEN.fkBathingWater_ID				IS NOT NULL	THEN RBDMENB.Rbd_Name
		WHEN MEN.fkCoastalWater_ID				IS NOT NULL	THEN RBDMENC.Rbd_Name
		WHEN MEN.fkScheme_ID					IS NOT NULL	THEN ''
		WHEN MEN.fkGroundWater_ID				IS NOT NULL	THEN RBDMENG.Rbd_Name
		WHEN MEN.fkLake_Id						IS NOT NULL	THEN RBDMENL.Rbd_Name
		WHEN MEN.fkRiver_ID						IS NOT NULL	THEN RBDMENR.Rbd_Name
		WHEN MEN.fkTransitionalWater_ID			IS NOT NULL	THEN RBDMENT.Rbd_Name
		WHEN MEN.fkWasteWater_ID				IS NOT NULL	THEN ''
	END AS [EntityRBDName]
	, CASE
		WHEN MEN.fkBathingWater_ID				IS NOT NULL	THEN RBDMENB.EdenRbdCode
		WHEN MEN.fkCoastalWater_ID				IS NOT NULL	THEN RBDMENC.EdenRbdCode
		WHEN MEN.fkScheme_ID					IS NOT NULL	THEN ''
		WHEN MEN.fkGroundWater_ID				IS NOT NULL	THEN RBDMENG.EdenRbdCode
		WHEN MEN.fkLake_Id						IS NOT NULL	THEN RBDMENL.EdenRbdCode
		WHEN MEN.fkRiver_ID						IS NOT NULL	THEN RBDMENR.EdenRbdCode
		WHEN MEN.fkTransitionalWater_ID			IS NOT NULL	THEN RBDMENT.EdenRbdCode
		WHEN MEN.fkWasteWater_ID				IS NOT NULL	THEN ''
	END AS [EntityRBDCode]
	, ORGSTA.*
	--, BOD.MainRBD_ID	 AS	[EntityRBD]
	--, RBDBOD.Rbd_Name	 AS	[EntityRBDName]
	--, RBDBOD.EdenRbdCode AS	[EntityRBDCode]
	--, STA.StationXCoord
	--, STA.StationYCoord

--INTO #tmpStationsAll

FROM		dbo.MonitoredLocation			MLC
LEFT JOIN	dbo.MonitoredEntity				MEN		ON MEN.MonEnt_ID			= MLC.MonitoredEntity_ID
LEFT JOIN	dbo.BathingWaterStation			STABW	ON STABW.Station_ID			= MLC.fkBathingWaterStation_ID
LEFT JOIN	dbo.CoastalWaterStation			STACW	ON STACW.Station_ID			= MLC.fkCoastalWaterStation_ID
LEFT JOIN	dbo.GroundWaterStation			STAGW	ON STAGW.Station_ID			= MLC.fkGroundWaterStation_ID
LEFT JOIN	dbo.LakeStation					STALW	ON STALW.Station_ID			= MLC.fkLakeStation_Id
LEFT JOIN	dbo.RiverStation				STARW	ON STARW.Station_ID			= MLC.fkRiverStation_ID
LEFT JOIN	dbo.SchemeStation				STADW	ON STADW.Station_ID			= MLC.fkSchemeStation_ID
LEFT JOIN	dbo.TransitionalWaterStation	STATW	ON STATW.Station_ID			= MLC.fkTransitionalWaterStation_ID
LEFT JOIN	dbo.WasteWaterStation			STAWW	ON STAWW.Station_ID			= MLC.fkWasteWaterStation_ID
LEFT JOIN	dbo.BathingWater				MENBW	ON MENBW.BathingWater_ID	= MEN.fkBathingWater_ID
LEFT JOIN	dbo.CoastalWater				MENCW	ON MENCW.Coastal_ID			= MEN.fkCoastalWater_ID
LEFT JOIN	dbo.GroundWater					MENGW	ON MENGW.GroundWater_ID		= MEN.fkGroundWater_ID
LEFT JOIN	dbo.Lake 						MENLW	ON MENLW.Lake_ID			= MEN.fkLake_Id
LEFT JOIN	dbo.River 						MENRW	ON MENRW.River_ID			= MEN.fkRiver_ID
LEFT JOIN	dbo.Scheme 						MENDW	ON MENDW.Sch_id				= MEN.fkScheme_ID
LEFT JOIN	dbo.TransitionalWater			MENTW	ON MENTW.Transitional_ID	= MEN.fkTransitionalWater_ID
LEFT JOIN	dbo.WasteWater					MENWW	ON MENWW.WW_ID				= MEN.fkWasteWater_ID
LEFT JOIN	dbo.Theme						THM		ON THM.Theme_id				= MEN.Theme_ID
LEFT JOIN	dbo.ReturnTypes					RTY		ON RTY.Theme_ID				= MEN.Theme_ID
LEFT JOIN	dbo.Organisations				ORGSTA	ON ORGSTA.Org_ID			= MLC.Org_ID
LEFT JOIN	dbo.Organisations				ORGMEN	ON ORGMEN.Org_ID			= MEN.Org_ID
LEFT JOIN	dbo.RBD							RBDSTAB	ON RBDSTAB.Rbd_ID			= STABW.MainRBD_ID
LEFT JOIN	dbo.RBD							RBDSTAC	ON RBDSTAC.Rbd_ID			= STACW.MainRBD_ID
LEFT JOIN	dbo.RBD							RBDSTAG	ON RBDSTAG.Rbd_ID			= STAGW.MainRBD_ID
LEFT JOIN	dbo.RBD							RBDSTAL	ON RBDSTAL.Rbd_ID			= STALW.MainRBD_ID
LEFT JOIN	dbo.RBD							RBDSTAD	ON RBDSTAD.Rbd_ID			= STADW.MainRBD_ID
LEFT JOIN	dbo.RBD							RBDSTAR	ON RBDSTAR.Rbd_ID			= STARW.MainRBD_ID
LEFT JOIN	dbo.RBD							RBDSTAT	ON RBDSTAT.Rbd_ID			= STATW.MainRBD_ID
LEFT JOIN	dbo.RBD							RBDSTAW	ON RBDSTAW.Rbd_ID			= STAWW.MainRBD_ID
LEFT JOIN	dbo.RBD							RBDMENB	ON RBDMENB.Rbd_ID			= MENBW.MainRBD_ID
LEFT JOIN	dbo.RBD							RBDMENC	ON RBDMENC.Rbd_ID			= MENCW.MainRBD_ID
LEFT JOIN	dbo.RBD							RBDMENG	ON RBDMENG.Rbd_ID			= MENGW.MainRBD_ID
LEFT JOIN	dbo.RBD							RBDMENL	ON RBDMENL.Rbd_ID			= MENLW.MainRBD_ID
--LEFT JOIN	dbo.RBD							RBDMEND	ON RBDMEND.Rbd_ID			= MENDW.MainRBD_ID
LEFT JOIN	dbo.RBD							RBDMENR	ON RBDMENR.Rbd_ID			= MENRW.MainRBD_ID
LEFT JOIN	dbo.RBD							RBDMENT	ON RBDMENT.Rbd_ID			= MENTW.MainRBD_ID
--LEFT JOIN	dbo.RBD							RBDMENW	ON RBDMENW.Rbd_ID			= MENWW.MainRBD_ID
--LEFT JOIN	dbo.RBD							RBDBOD	ON RBDBOD.Rbd_ID			= BOD.MainRBD_ID
--LEFT JOIN	dbo.Sample						SAM		ON SAM.MonLoc_ID			= MLC.MonitoredLocation_ID
--LEFT JOIN	dbo.Measurements				MEA		ON MEA.Samp_ID				= SAM.Samp_ID
--LEFT JOIN	dbo.SampleType					STY		ON STY.SamTyp_id			= SAM.SampTyp_ID
--LEFT JOIN	dbo.SampleCategory				SCT		ON SCT.SamCtg_id			= SAM.SamCtg_ID
--LEFT JOIN	dbo.SampleMethod				SMT		ON SMT.SampleMethod_ID		= SAM.SampleMethod_ID
--LEFT JOIN	dbo.Parameter					PRM		ON PRM.Prm_id				= MEA.Prm_ID
--LEFT JOIN	dbo.UnitOfMeasure				UOM		ON UOM.Unit_ID				= MEA.Unit_ID
--LEFT JOIN	dbo.HealthCheck					HCK		ON HCK.Hchk_id				= MEA.Hchk_ID


WHERE	ORGSTA.Org_Name LIKE '%Donegal%'
AND		THM.Theme_Desc	LIKE '%GROUND%'
AND		MEN.MonEnt_Code =    'NW_G_0051'
--AND		STA.StationYCoord LIKE '%416%'
ORDER BY  [Org_Code_Sta], [Station National Code]


--BOD.Lake_Code LIKE '%NW_36_657%'--'SH_26_74%'--NW_36_65
--AND		THM.Theme_Desc	LIKE '%LAKE%'
--AND		STA.EdenNationalCode = 'DWMON2100PUB10105003' 
--AND		RTY.RetTyp_Desc = 'Ground Water'


--SELECT * FROM
--#tmpStationsAll
--WHERE	[Station National Code] = 'DWMON2100PUB10105003'
--ORDER BY  [Org_Code_Sta], [Station National Code]




/*

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
WHERE	STA.EdenNationalCode IN
(
'RS18A020590',
'RS18B060090',
'RS18B060210',
'RS18C020210',
'RS18C020320',
'RS18D010590',
'RS18E220740',
'RS18E220970',
'RS18F050140',
'RS18F050320',
'RS19G010260',
'RS19G010310',
'RS20T290990'
)
ORDER BY  ORGSTA.Org_Code, STA.EdenNationalCode

--SELECT * FROM Lake WHERE Lake_Code LIKE '%SH_26_74%'

--*/

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
