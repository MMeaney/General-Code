-- ******************************************
-- *** Display samples and/or measurements
-- *** Lake and river 
-- ******************************************

/* ******************************************
For the parameters:
•	BOD
•	COD
•	SS
•	TN
•	TP
•	Ortho P
•	Ammonia
****************************************** */

USE [EPACentral_Aquarius]

DECLARE @Samp_Year	VARCHAR(4) = '';
SET		@Samp_Year	= '2015'

SELECT DISTINCT
	ORG.Org_Name			AS [LA Name]
	, ORG.Org_Code			AS [LA Code]
	, RTY.RetTyp_Desc		AS [Return Type]
	, MEN.MonEnt_Code		AS [Monitored Entity]
	, CASE
		WHEN MEN.fkBathingWater_ID				IS NOT NULL	THEN MENBW.BathingWater_Name
		WHEN MEN.fkCoastalWater_ID				IS NOT NULL	THEN MENCW.Coastal_Name
		WHEN MEN.fkScheme_ID					IS NOT NULL	THEN MENDW.Sch_Name
		WHEN MEN.fkGroundWater_ID				IS NOT NULL	THEN MENGW.GroundWater_Name
		WHEN MEN.fkLake_Id						IS NOT NULL	THEN MENLW.Lake_Name
		WHEN MEN.fkRiver_ID						IS NOT NULL	THEN MENRW.River_Name
		WHEN MEN.fkTransitionalWater_ID			IS NOT NULL	THEN MENTW.Trans_Name
		WHEN MEN.fkWasteWater_ID				IS NOT NULL	THEN MENWW.WW_Name
	END AS [Entity Name]
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
		WHEN MLC.fkBathingWaterStation_ID		IS NOT NULL	THEN REPLACE(REPLACE(STABW.Station_Name, CHAR(13), ''), CHAR(10), '')
		WHEN MLC.fkCoastalWaterStation_ID		IS NOT NULL	THEN REPLACE(REPLACE(STACW.Station_Name, CHAR(13), ''), CHAR(10), '')
		WHEN MLC.fkSchemeStation_ID				IS NOT NULL	THEN REPLACE(REPLACE(STADW.Station_Name, CHAR(13), ''), CHAR(10), '')
		WHEN MLC.fkGroundWaterStation_ID		IS NOT NULL	THEN REPLACE(REPLACE(STAGW.Station_Name, CHAR(13), ''), CHAR(10), '')
		WHEN MLC.fkLakeStation_Id				IS NOT NULL	THEN REPLACE(REPLACE(STALW.Station_Name, CHAR(13), ''), CHAR(10), '')
		WHEN MLC.fkRiverStation_ID				IS NOT NULL	THEN REPLACE(REPLACE(STARW.Station_Name, CHAR(13), ''), CHAR(10), '')
		WHEN MLC.fkTransitionalWaterStation_ID	IS NOT NULL	THEN REPLACE(REPLACE(STATW.Station_Name, CHAR(13), ''), CHAR(10), '')
		WHEN MLC.fkWasteWaterStation_ID			IS NOT NULL	THEN REPLACE(REPLACE(STAWW.Station_Name, CHAR(13), ''), CHAR(10), '')
	END AS [Station Name]
	, SAM.Samp_Code			AS [Sample Code]
	, SAM.Samp_Date			AS [Sample Date]
	, SAM.Comp_Date			AS [Sample Complete Date]
	, ENP.Prm_Desc			AS [Parameter]
	, UOM.Unit_Code			AS [UOM]
	, MEA.Meas_Result
	, MEA.Meas_TextResult
	, MEA.Report_Meas_TextResult
	, MEA.Report_Meas_Result
	, MEA.Report_ResultString
	, MEA.ResultString
	, MEA.VerifiedStatus
	, MEA.LimitOfDetection
	, SAM.Samp_LabName
	, SCT.SamCtg_Desc

FROM		dbo.Sample						SAM
LEFT JOIN	dbo.Measurements				MEA		ON MEA.Samp_ID				= SAM.Samp_ID
LEFT JOIN	dbo.MonitoredEntity				MEN		ON MEN.MonEnt_ID			= SAM.MonEnt_ID
LEFT JOIN	dbo.SampleType					STY		ON STY.SamTyp_id			= SAM.SampTyp_ID
LEFT JOIN	dbo.SampleCategory				SCT		ON SCT.SamCtg_id			= SAM.SamCtg_ID
LEFT JOIN	dbo.SampleMethod				SMT		ON SMT.SampleMethod_ID		= SAM.SampleMethod_ID
LEFT JOIN	dbo.MonitoredLocation			MLC		ON MLC.MonitoredLocation_ID = SAM.MonLoc_ID
LEFT JOIN	dbo.Organisations				ORG		ON ORG.Org_Id				= MLC.Org_ID
LEFT JOIN	dbo.Theme						THM		ON THM.Theme_id				= MEN.Theme_ID
LEFT JOIN	dbo.Parameter					ENP		ON ENP.Prm_id				= MEA.Prm_ID
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
LEFT JOIN	dbo.BathingWater				MENBW	ON MENBW.BathingWater_ID	= MEN.fkBathingWater_ID
LEFT JOIN	dbo.CoastalWater				MENCW	ON MENCW.Coastal_ID			= MEN.fkCoastalWater_ID
LEFT JOIN	dbo.GroundWater					MENGW	ON MENGW.GroundWater_ID		= MEN.fkGroundWater_ID
LEFT JOIN	dbo.Lake 						MENLW	ON MENLW.Lake_ID			= MEN.fkLake_Id
LEFT JOIN	dbo.River 						MENRW	ON MENRW.River_ID			= MEN.fkRiver_ID
LEFT JOIN	dbo.Scheme 						MENDW	ON MENDW.Sch_id				= MEN.fkScheme_ID
LEFT JOIN	dbo.TransitionalWater			MENTW	ON MENTW.Transitional_ID	= MEN.fkTransitionalWater_ID
LEFT JOIN	dbo.WasteWater					MENWW	ON MENWW.WW_ID				= MEN.fkWasteWater_ID
LEFT JOIN	dbo.Scheme						SCH		ON SCH.EdenMonitoredEntity	= MEN.MonEnt_Code

WHERE	ENP.Theme_ID	IN ('0', '1')
AND		YEAR(SAM.Samp_Date) = @Samp_Year
AND
(
		ENP.Prm_Desc	LIKE '%BOD%'
	OR	ENP.Prm_Desc	LIKE '%COD%'
	OR	ENP.Prm_Desc	LIKE '%Ammonia%'
	OR	ENP.Prm_Desc	LIKE '%Diss%Ox%'
	OR	ENP.Prm_Desc	LIKE '%Nitrogen%'
	OR	ENP.Prm_Desc	LIKE '%Ortho%p%'
	OR	ENP.Prm_Desc	LIKE '%Phosphorus%'
	OR	ENP.Prm_Desc	LIKE '%Susp%'
)

ORDER BY ORG.Org_Name, RTY.RetTyp_Desc, SAM.Samp_Date, SAM.Samp_Code, ENP.Prm_Desc