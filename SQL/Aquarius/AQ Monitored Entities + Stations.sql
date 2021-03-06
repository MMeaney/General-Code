-- ***********************************************
-- *** Monitored entites and stations - Aquarius
-- ***********************************************

USE [EPACentral_Aquarius]

--SELECT * FROM ReturnTypes -- DWPRI Mapped to Theme 6 DW Pub
--SELECT * FROM Theme

--IF  OBJECT_ID('TempDB..#tmpStationsAll') IS NOT NULL
--	BEGIN	DROP TABLE #tmpStationsAll	END
SELECT DISTINCT
	ORGSTA.Org_Name			AS [Org_Name_Sta]
	, ORGSTA.Org_Code		AS [Org_Code_Sta]
	, ORGMEN.Org_Name		AS [Org_Name_Men]
	, ORGMEN.Org_Code		AS [Org_Code_Men]
	, RTY.RetTyp_Desc		AS [Return Type]
	, THM.Theme_Desc		AS [Return Type]
	, MEN.MonEnt_Code		--AS [Monitored Entity]
	, CASE
		WHEN MEN.fkBathingWater_ID				IS NOT NULL	THEN MENBW.IDBW_Code
		WHEN MEN.fkCoastalWater_ID				IS NOT NULL	THEN MENCW.EdenMonitoredEntity
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
	--, CASE
	--	WHEN MLC.fkBathingWaterStation_ID		IS NOT NULL	THEN STABW.MainRBD_ID
	--	WHEN MLC.fkCoastalWaterStation_ID		IS NOT NULL	THEN STACW.MainRBD_ID
	--	WHEN MLC.fkSchemeStation_ID				IS NOT NULL	THEN STADW.MainRBD_ID
	--	WHEN MLC.fkGroundWaterStation_ID		IS NOT NULL	THEN STAGW.MainRBD_ID
	--	WHEN MLC.fkLakeStation_Id				IS NOT NULL	THEN STALW.MainRBD_ID
	--	WHEN MLC.fkRiverStation_ID				IS NOT NULL	THEN STARW.MainRBD_ID
	--	WHEN MLC.fkTransitionalWaterStation_ID	IS NOT NULL	THEN STATW.MainRBD_ID
	--	WHEN MLC.fkWasteWaterStation_ID			IS NOT NULL	THEN STAWW.MainRBD_ID
	--END AS [StationRBDID]
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
		WHEN MEN.fkBathingWater_ID				IS NOT NULL	THEN HYDBW.HA_Name
		WHEN MEN.fkCoastalWater_ID				IS NOT NULL	THEN HYDCW.HA_Name
		WHEN MEN.fkScheme_ID					IS NOT NULL	THEN ''
		WHEN MEN.fkGroundWater_ID				IS NOT NULL	THEN HYDGW.HA_Name
		WHEN MEN.fkLake_Id						IS NOT NULL	THEN HYDLW.HA_Name
		WHEN MEN.fkRiver_ID						IS NOT NULL	THEN HYDRW.HA_Name
		WHEN MEN.fkTransitionalWater_ID			IS NOT NULL	THEN HYDTW.HA_Name
		WHEN MEN.fkWasteWater_ID				IS NOT NULL	THEN ''
	END AS [Hydrometric Area]
	--, CASE
	--	WHEN MEN.fkBathingWater_ID				IS NOT NULL	THEN MENBW.MainRBD_ID
	--	WHEN MEN.fkCoastalWater_ID				IS NOT NULL	THEN MENCW.MainRBD_ID
	--	WHEN MEN.fkScheme_ID					IS NOT NULL	THEN ''
	--	WHEN MEN.fkGroundWater_ID				IS NOT NULL	THEN MENGW.MainRBD_ID
	--	WHEN MEN.fkLake_Id						IS NOT NULL	THEN MENLW.MainRBD_ID
	--	WHEN MEN.fkRiver_ID						IS NOT NULL	THEN MENRW.MainRBD_ID
	--	WHEN MEN.fkTransitionalWater_ID			IS NOT NULL	THEN MENTW.MainRBD_ID
	--	WHEN MEN.fkWasteWater_ID				IS NOT NULL	THEN ''
	--END AS [EntityRBDID]
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
	, CASE
		WHEN MLC.fkBathingWaterStation_ID		IS NOT NULL	THEN STABW.StationXCoord
		WHEN MLC.fkCoastalWaterStation_ID		IS NOT NULL	THEN STACW.StationXCoord
		WHEN MLC.fkSchemeStation_ID				IS NOT NULL	THEN ''
		WHEN MLC.fkGroundWaterStation_ID		IS NOT NULL	THEN STAGW.StationXCoord
		WHEN MLC.fkLakeStation_Id				IS NOT NULL	THEN STALW.StationXCoord
		WHEN MLC.fkRiverStation_ID				IS NOT NULL	THEN STARW.StationXCoord
		WHEN MLC.fkTransitionalWaterStation_ID	IS NOT NULL	THEN STATW.StationXCoord
		WHEN MLC.fkWasteWaterStation_ID			IS NOT NULL	THEN STAWW.StationXCoord
	END AS [StationXCoord]
	, CASE
		WHEN MLC.fkBathingWaterStation_ID		IS NOT NULL	THEN STABW.StationYCoord
		WHEN MLC.fkCoastalWaterStation_ID		IS NOT NULL	THEN STACW.StationYCoord
		WHEN MLC.fkSchemeStation_ID				IS NOT NULL	THEN ''
		WHEN MLC.fkGroundWaterStation_ID		IS NOT NULL	THEN STAGW.StationYCoord
		WHEN MLC.fkLakeStation_Id				IS NOT NULL	THEN STALW.StationYCoord
		WHEN MLC.fkRiverStation_ID				IS NOT NULL	THEN STARW.StationYCoord
		WHEN MLC.fkTransitionalWaterStation_ID	IS NOT NULL	THEN STATW.StationYCoord
		WHEN MLC.fkWasteWaterStation_ID			IS NOT NULL	THEN STAWW.StationYCoord
	END AS [StationYCoord]
	, CNTCW.Cty_Name		AS	[County]
	, TRACCW.Description	AS	[TRaC Type]
	, MENCW.Area
	, STY.SamTyp_Desc
	, STABW.StationFullCode
	--, STABW.*
	--, MENBW.*
	--, STAGW.*

--INTO #tmpStationsAll

FROM		dbo.MonitoredEntity				MEN
LEFT JOIN	dbo.MonitoredLocation			MLC		ON MLC.MonitoredEntity_ID	= MEN.MonEnt_ID
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
LEFT JOIN	dbo.Counties					CNTCW	ON CNTCW.Cty_ID				= MENCW.MainCounty_ID
LEFT JOIN	dbo.HydrometricArea				HYDBW	ON HYDBW.HA_ID				= MENBW.HA_ID
LEFT JOIN	dbo.HydrometricArea				HYDCW	ON HYDCW.HA_ID				= MENCW.HA_ID
LEFT JOIN	dbo.HydrometricArea				HYDGW	ON HYDGW.HA_ID				= MENGW.HA_ID
LEFT JOIN	dbo.HydrometricArea				HYDLW	ON HYDLW.HA_ID				= MENLW.HA_ID
LEFT JOIN	dbo.HydrometricArea				HYDRW	ON HYDRW.HA_ID				= MENRW.HA_ID
--LEFT JOIN	dbo.HydrometricArea				HYDDW	ON HYDDW.HA_ID				= MENDW.HA_ID -- No Hydrometric Area
LEFT JOIN	dbo.HydrometricArea				HYDTW	ON HYDTW.HA_ID				= MENTW.HA_ID
--LEFT JOIN	dbo.HydrometricArea				HYDWW	ON HYDWW.HA_ID				= MENWW.HA_ID -- No Hydrometric Area
LEFT JOIN	dbo.TransitionalCoastalWaterType TRACCW	ON TRACCW.TracType_ID		= MENCW.TracType_ID
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
--LEFT JOIN	dbo.RBD							RBDMEND	ON RBDMEND.Rbd_ID			= MENDW.MainRBD_ID -- No RBD
LEFT JOIN	dbo.RBD							RBDMENR	ON RBDMENR.Rbd_ID			= MENRW.MainRBD_ID
LEFT JOIN	dbo.RBD							RBDMENT	ON RBDMENT.Rbd_ID			= MENTW.MainRBD_ID
--LEFT JOIN	dbo.RBD							RBDMENW	ON RBDMENW.Rbd_ID			= MENWW.MainRBD_ID -- No RBD
--LEFT JOIN	dbo.Sample						SAM		ON SAM.MonLoc_ID			= MLC.MonitoredLocation_ID
--LEFT JOIN	dbo.Measurements				MEA		ON MEA.Samp_ID				= SAM.Samp_ID
LEFT JOIN	dbo.SampleType					STY		ON STY.SamTyp_id			= STABW.SamTyp_ID
--LEFT JOIN	dbo.SampleCategory				SCT		ON SCT.SamCtg_id			= SAM.SamCtg_ID
--LEFT JOIN	dbo.SampleMethod				SMT		ON SMT.SampleMethod_ID		= SAM.SampleMethod_ID
--LEFT JOIN	dbo.Parameter					PRM		ON PRM.Prm_id				= MEA.Prm_ID
--LEFT JOIN	dbo.UnitOfMeasure				UOM		ON UOM.Unit_ID				= MEA.Unit_ID
--LEFT JOIN	dbo.HealthCheck					HCK		ON HCK.Hchk_id				= MEA.Hchk_ID

WHERE	
--STAWW.Station_Name LIKE '%Carrigart%'
--STABW.EdenNationalCode  = 'BPNBF090000210001'
--TPEFF3900D0274SW003
--TPEFF1300D0331SW001
--TPEFF1300D0331SW001
--TPINF1300D0331SW001
--STALW.EdenNationalCode LIKE 'LS010006202%'
/*
STALW.EdenNationalCode IN ('LS360012720100010',
'LS260015706900060',
'LS360012328600020',
'LS070015906200030',
'LS070015906200040',
'LS070015905000010',
'LS360012325300020',
'LS070015911200020',
'LS360012328700050'
)
*/
/*
starw.edennationalcode in (
'RS19W010950',
'RS40G010004',
'RS08W010650',
'RS24T010100',
'RS22D010340',
'RS09M010060',
'RS16P020040',
'RS26S020580',
'RS36L030020',
'RS36L030040',
'RS36L030060',
'RS36L030080',
'RS06W010090',
'RS06W010190',
'RS30R010590',
'RS13D010350',
'RS10G010200',
'RS09L010230',
'RS18F050064',
'RS24O020070',
'RS24O020075',
'RS24A020800',
'RS25B010300'
)
*/
STADW.Station_Code IN

(

'DWMON0300PUB10090205',
'DWMON0300PRI30190012',
'DWMON0300PRI30240007',
'DWMON0300PRI30460011',
'DWMON0500PRI46416000',
'DWMON0500PRI44446008',
'DWMON0500PUB21060443',
'DWMON0500PRI45436006',
'DWMON0700PUB10050109',
'DWMON0700PUB10017300',
'DWMON0700PUB10010220',
'DWMON0700PUB10019514',
'DWMON0800PUB10010360',
'DWMON0800PUB10019185',
'DWMON0900PUB10019023',
'DWMON0900PUB10011288',
'DWMON0900PUB10030011',
'DWMON1000PUB10060016'

)


--STARW.Station_Name LIKE '%CLOGHAUN%'
--STARW.EdenNationalCode in ('RS09L010370','RS14B011310','RS09L090600','RS09L061300','RS10C050100','RS10C060100','RS10C060300','RS10N020300','RS14G160200','RS26D040780','RS19B140200','RS16C030600','RS07B042230','RS23F010324','RS25S012561') 

--MENGW.GroundWater_Name	LIKE '%CLONES%'
--STAGW.Station_Name LIKE '%Dripsey DR1-Shallow%'

--STAGW.EdenNationalCode	IN (
--'IE_SW_G_0004_0500_0030',
--'IE_SW_G_0004_0500_0035',
--'IE_SW_G_0004_0500_0038',
--'IE_SW_G_0004_0500_0039',
--'IE_SE_G_0156_1500_0021',
--'IE_SE_G_0156_1500_0022',
--'IE_SE_G_0156_1500_0024'
--)

--STAWW.EdenNationalCode	LIKE '%TPEFF3900%'
--MENBW.BathingWater_Code	IN ('13000008', '13000018', '13000020') -- IS NOT NULL--
--MENBW.BathingWater_Code	LIKE '0900%'
--STAGW.Station_Name LIKE '%Dripsey DR1%'
--MENGW.GroundWater_Name LIKE '%Newtown-Ballyconnell%'
--MEN.MonEnt_Code LIKE '%SW_G_0004%'
--MENLW.Lake_Name	LIKE	'%VEAGH%'
--MENCW.EdenMonitoredEntity	=	'5250'
--THM.Theme_Desc	LIKE '%bath%'
--MEN.MonEnt_Code	LIKE '%06000027%'
--STARW.EdenNationalCode = 
---- 'RS07K020490'
---- 'RS30R010020'
---- 'RS30O020210'
---- 'RS10K010250'
--'RS25Y010200'

--STAGW.EdenNationalCode	LIKE 'IE_NW_G_0051_0600%'
--OR	STAGW.Station_Name	LIKE '%Gortinlieve%'

--RBDSTAD.EdenRbdCode = 'RIVERBASINDISTRICT_0'
--ORGMEN.Org_Name LIKE '%FINGAL%'
--STABW.EdenNationalCode	IN
--(
--'BPBLF060000270002'
--, 'BPBLF060000280028'
--, 'BPBLF090000200001'
--)

ORDER BY [Station National Code]

--AND		ORGSTA.Org_Name LIKE '%WATERF%'
--AND		THM.Theme_Desc	LIKE '%RIVER%'
--AND		MEN.MonEnt_Code IN ('3204', '3211')
--WHERE	MEN.fkLake_Id IS NOT NULL
--AND		ORGSTA.Org_Name	LIKE 'MEATH%'
----AND		STA.StationYCoord LIKE '%416%'
--ORDER BY  [Return Type], [Org_Code_Sta], [Station National Code]

--SELECT * FROM dbo.River 

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
