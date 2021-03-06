-- ******************************************
-- *** Display samples and/or measurements
-- ******************************************

USE [EPACentral_Aquarius]

SELECT DISTINCT
	ORG.Org_Name			AS [LA Name]
	--, ORG.Org_Code			AS [LA Code]
	, THM.Theme_Desc		AS [Return Type]
	, MEN.MonEnt_Code		AS [Monitored Entity]
	, CASE
		WHEN MEN.fkBathingWater_ID				IS NOT NULL	THEN ENTBW.IDBW_Code
		WHEN MEN.fkCoastalWater_ID				IS NOT NULL	THEN ENTCW.Coastal_Code
		WHEN MEN.fkScheme_ID					IS NOT NULL	THEN ENTDW.EdenMonitoredEntity
		WHEN MEN.fkGroundWater_ID				IS NOT NULL	THEN ENTGW.EdenMonitoredEntity
		WHEN MEN.fkLake_Id						IS NOT NULL	THEN ENTLW.EdenMonitoredEntity
		WHEN MEN.fkRiver_ID						IS NOT NULL	THEN ENTRW.EdenMonitoredEntity
		WHEN MEN.fkTransitionalWater_ID			IS NOT NULL	THEN ENTTW.Trans_Code
		WHEN MEN.fkWasteWater_ID				IS NOT NULL	THEN ENTWW.EdenMonitoredEntity
	END AS [EDEN Entity Code]
	, CASE
		WHEN MEN.fkBathingWater_ID				IS NOT NULL	THEN ENTBW.WFD_Code
		WHEN MEN.fkCoastalWater_ID				IS NOT NULL	THEN ENTCW.WFD_Code
		WHEN MEN.fkScheme_ID					IS NOT NULL	THEN ''
		WHEN MEN.fkGroundWater_ID				IS NOT NULL	THEN ENTGW.WFD_Code
		WHEN MEN.fkLake_Id						IS NOT NULL	THEN ENTLW.WFD_Code
		WHEN MEN.fkRiver_ID						IS NOT NULL	THEN ENTRW.WFD_Code
		WHEN MEN.fkTransitionalWater_ID			IS NOT NULL	THEN ENTTW.WFD_Code
		WHEN MEN.fkWasteWater_ID				IS NOT NULL	THEN ''
	END AS [WFD Code]
	, CASE
		WHEN MEN.fkBathingWater_ID				IS NOT NULL	THEN ENTBW.BathingWater_Name
		WHEN MEN.fkCoastalWater_ID				IS NOT NULL	THEN ENTCW.Coastal_Name
		WHEN MEN.fkScheme_ID					IS NOT NULL	THEN ENTDW.Sch_Name
		WHEN MEN.fkGroundWater_ID				IS NOT NULL	THEN ENTGW.GroundWater_Name
		WHEN MEN.fkLake_Id						IS NOT NULL	THEN ENTLW.Lake_Name
		WHEN MEN.fkRiver_ID						IS NOT NULL	THEN ENTRW.River_Name
		WHEN MEN.fkTransitionalWater_ID			IS NOT NULL	THEN ENTTW.Trans_Name
		WHEN MEN.fkWasteWater_ID				IS NOT NULL	THEN ENTWW.WW_Name
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
	, SAM.Samp_Code			AS [Sample Code]
	, SAM.Samp_ID
	, SAM.Samp_Date			AS [Sample Date]
	, SAM.Comp_Date			AS [Sample Complete Date]
	, SAM.Samp_LabName
	, SCT.SamCtg_Desc
	, STY.SamTyp_Desc
	, SAM.SampleMethod_ID
	, SMT.SampleMethod_Name
	------, MEA.Meas_ID
	--, MEA.Hchk_ID	AS	[Validated]
	----, HCK.Hchk_Desc
	, PRM.Prm_Desc			AS [Parameter]
	, UOM.Unit_Code			AS [UOM]
	--------, UOM.EdenUnit
	--, MEA.Meas_Result
	--, MEA.Meas_TextResult
	--, MEA.Report_Meas_TextResult
	--, MEA.Report_Meas_Result
	--, MEA.Report_ResultString
	--, MEA.ResultString
	--, MEA.AccreditedResult
	------, MEA.VerifiedStatus
	------, MEA.LimitOfDetection
	--------, SAM.MonLoc_ID
FROM		dbo.Sample						SAM
LEFT JOIN	dbo.Measurements				MEA		ON MEA.Samp_ID				= SAM.Samp_ID
LEFT JOIN	dbo.MonitoredEntity				MEN		ON MEN.MonEnt_ID			= SAM.MonEnt_ID
LEFT JOIN	dbo.SampleType					STY		ON STY.SamTyp_id			= SAM.SampTyp_ID
LEFT JOIN	dbo.SampleCategory				SCT		ON SCT.SamCtg_id			= SAM.SamCtg_ID
LEFT JOIN	dbo.SampleMethod				SMT		ON SMT.SampleMethod_ID		= SAM.SampleMethod_ID
LEFT JOIN	dbo.MonitoredLocation			MLC		ON MLC.MonitoredLocation_ID = SAM.MonLoc_ID
LEFT JOIN	dbo.Organisations				ORG		ON ORG.Org_Id				= MLC.Org_ID
LEFT JOIN	dbo.Theme						THM		ON THM.Theme_id				= MEN.Theme_ID
LEFT JOIN	dbo.Parameter					PRM		ON PRM.Prm_id				= MEA.Prm_ID
LEFT JOIN	dbo.UnitOfMeasure				UOM		ON UOM.Unit_ID				= MEA.Unit_ID
LEFT JOIN	dbo.HealthCheck					HCK		ON HCK.Hchk_id				= MEA.Hchk_ID
LEFT JOIN	dbo.ReturnTypes					RTY		ON RTY.RetTyp_ID			= SAM.RetTyp_ID
LEFT JOIN	dbo.BathingWaterStation			STABW	ON STABW.Station_ID			= MLC.fkBathingWaterStation_ID
LEFT JOIN	dbo.CoastalWaterStation			STACW	ON STACW.Station_ID			= MLC.fkCoastalWaterStation_ID
LEFT JOIN	dbo.GroundWaterStation			STAGW	ON STAGW.Station_ID			= MLC.fkGroundWaterStation_ID
LEFT JOIN	dbo.LakeStation					STALW	ON STALW.Station_ID			= MLC.fkLakeStation_Id
LEFT JOIN	dbo.RiverStation				STARW	ON STARW.Station_ID			= MLC.fkRiverStation_ID
LEFT JOIN	dbo.SchemeStation				STADW	ON STADW.Station_ID			= MLC.fkSchemeStation_ID
LEFT JOIN	dbo.TransitionalWaterStation	STATW	ON STATW.Station_ID			= MLC.fkTransitionalWaterStation_ID
LEFT JOIN	dbo.WasteWaterStation			STAWW	ON STAWW.Station_ID			= MLC.fkWasteWaterStation_ID
LEFT JOIN	dbo.BathingWater				ENTBW	ON ENTBW.BathingWater_ID	= MEN.fkBathingWater_ID
LEFT JOIN	dbo.CoastalWater				ENTCW	ON ENTCW.Coastal_ID			= MEN.fkCoastalWater_ID
LEFT JOIN	dbo.GroundWater					ENTGW	ON ENTGW.GroundWater_ID		= MEN.fkGroundWater_ID
LEFT JOIN	dbo.Lake 						ENTLW	ON ENTLW.Lake_ID			= MEN.fkLake_Id
LEFT JOIN	dbo.River 						ENTRW	ON ENTRW.River_ID			= MEN.fkRiver_ID
LEFT JOIN	dbo.Scheme 						ENTDW	ON ENTDW.Sch_id				= MEN.fkScheme_ID
LEFT JOIN	dbo.TransitionalWater			ENTTW	ON ENTTW.Transitional_ID	= MEN.fkTransitionalWater_ID
LEFT JOIN	dbo.WasteWater					ENTWW	ON ENTWW.WW_ID				= MEN.fkWasteWater_ID
LEFT JOIN	dbo.Scheme						SCH		ON SCH.EdenMonitoredEntity	= MEN.MonEnt_Code

WHERE	ORG.Org_Name			LIKE 'MEATH%'
AND		THM.Theme_Desc			LIKE '%DRINK%'
AND		YEAR(SAM.Samp_Date)		= 2015
AND		MEA.AccreditedResult	= 1
--AND		MEA.AccreditedResult	IN ('0')
--AND		PRM.Prm_Desc			IN ('Odour', 'Taste', 'Dissolved Organic Carbon')

ORDER BY PRM.Prm_Desc, ORG.Org_Name, SAM.Samp_Code /*[Return Type], */, [Mon Ent Name], [Monitored Entity]--, [Station National Code], SAM.Samp_Code

