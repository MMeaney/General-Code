SELECT
	Samp_Code
	, Samp_Date
	, Samp_LabName
	, Trans_Name
	, EdenNationalCode
	, StationLocation
	, Station_Name
	, SampleMethod_Code
	, [307]		AS Time_sampled
	, [140]		AS Depth_m
	, [789]		AS Salinity_oo
	, [847]		AS Salinity_ppt
	, [851]		AS Salinity_psu
	, [4561]	AS Salinitylab_00
	, [300]		AS Temperature_C
	, [247]		AS PH
	, [291]		AS SuspendedSolids_mgl
	, [153]		AS DissolvedOxygen_sat
	, [154]		AS DissolvedOxygen_mgl
	, [797]		AS DissolvedOxygen_O2
	, [82]		AS BOD5days_mgl
	, [468]		AS BODwithinhibition_mgl
	, [321]		AS TON_mgl
	, [61]		AS Ammonia_Total_N_mgl
	, [116]		AS Chlorophyll_ugl
	, [117]		AS Chlorophyll_mgm3
	, [276]		AS Silica_Si02_mgl
	, [241]		AS Ortho_Phosphate_P_unspecified_mgl
	, [240]		AS Ortho_Phosphate_P_unspecified_ugl
	, [319]		AS Total_Nitrogen_mgl
	, [320]		AS TOC_NPOC_mgl
	, [110]		AS COD_mgl
	, [129]		AS Conductivity_25C
	, [327]		AS TotalPhosphorous_mgl
	, [342]		AS TrueColour_Hazen
	, [343]		AS Turbidity_FTU
	, [359]		AS TrueColour_PtCo
	, [836]		AS Colour_Descriptive
	, [8284]	AS TrueColour_mglPtco

FROM
(
SELECT 
	Samp_Code
	, Samp_Date
	, Samp_LabName
	, StationLocation
	, SampleMethod_Code
	,Trans_Name
	, EdenNationalCode
	, Station_Name
	, Prm_Code
	, CASE
		WHEN ENP.Prm_Code			= 307 
		AND	 Samp_LabName			= 'EPA Monaghan' 
		AND  Report_Meas_TextResult	IS NOT NULL 
		THEN
			CAST(SUBSTRING(MEA.Report_Meas_TextResult, 1,	CHARINDEX(':', MEA.Report_Meas_TextResult, 1)- 1) + '.' 
			+	 SUBSTRING(MEA.Report_Meas_TextResult,		CHARINDEX(':', MEA.Report_Meas_TextResult, 1)+ 1, (LEN(MEA.Report_Meas_TextResult) 
			-	 CHARINDEX(':', MEA.Report_Meas_TextResult, 1))) AS VARCHAR)
		ELSE
			MEA.Report_Meas_TextResult
		END
	AS	Report_Meas_Result 
FROM		Sample				SAM
INNER JOIN	Measurements		MEA	ON SAM.Samp_ID			= MEA.Samp_ID 
INNER JOIN	MonitoredLocation	MLC	ON SAM.MonLoc_ID		= MLC.MonitoredLocation_ID
INNER JOIN	TransitionalWaterStation	STA	ON STA.Station_ID		= MLC.fkTransitionalWaterStation_ID
INNER JOIN	MonitoredEntity		MEN	ON MEN.MonEnt_ID		= SAM.MonEnt_ID
INNER JOIN	TransitionalWater	BOD	ON BOD.Transitional_ID	= MEN.fkTransitionalWater_ID
INNER JOIN	SampleType			STY	ON STY.SamTyp_id		= SAM.SampTyp_ID
INNER JOIN	Parameter			ENP	ON ENP.Prm_id			= MEA.Prm_ID
INNER JOIN	Organisations		ORG	ON ORG.Org_Id			= MLC.Org_ID 
INNER JOIN	SampleMethod		SMT	ON SMT.SampleMethod_ID	= SAM.SampleMethod_ID 
) p
	PIVOT
	(
	MAX(Report_Meas_Result)
		FOR Prm_Code IN
		(
			[468], [117], [140], [307], [327], [789], [342], [343], [359], [797], [847], [851], [4561], [836], [300], [247], [291], [153], [110], [82], [321], [116], [154], [276], [61], [241], [240], [319], [320], [129], [8284]
		)
	)
pvt
