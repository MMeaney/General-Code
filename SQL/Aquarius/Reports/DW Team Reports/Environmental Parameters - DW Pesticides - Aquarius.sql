USE [EPACentral_Aquarius]

SELECT DISTINCT
	ORG.Org_Name				AS	[Organisation]
	, SCH.Sch_Name				AS	[SchemeName]
	, SCH.Sch_Code				AS	[SchemeCode]
	, SUP.Sup_code				AS	[SupplyType]
	, SRC.Src_Code				AS	[SourceType]
	, SCY.SchYr_Population		AS	[PopulationServed]
	, SCY.SchYr_Volume			AS	[VolumeSupplied]
	, SMP.Samp_Date				AS	[SampleDate]
	, SST.Station_Name			AS	[SampleLocation]
	, PRM.Prm_Desc				AS	[ParameterName]
	, MEA.Report_Meas_Result	AS	[Result]
	, MEA.Meas_TextResult		AS	[ResultText]
	, UOM.Unit_Code				AS	[UnitCode]
	, UOM.Unit_Name				AS	[UnitName]
	, MEA.AccreditedResult		AS	[Accredited]
	, RTY.RetTyp_Desc
	, SCY.SchYr_Year
	
FROM		dbo.Sample				SMP
INNER JOIN	dbo.Measurements		MEA	ON MEA.Samp_ID				= SMP.Samp_ID
INNER JOIN	dbo.MonitoredEntity		MON	ON MON.MonEnt_ID			= SMP.MonEnt_ID
INNER JOIN	dbo.Organisations		ORG	ON ORG.Org_Id				= MON.Org_ID
INNER JOIN	dbo.SampleType			STY	ON STY.SamTyp_id			= SMP.SampTyp_ID
INNER JOIN	dbo.SampleCategory		SCT	ON SCT.SamCtg_id			= SMP.SamCtg_ID
INNER JOIN	dbo.SampleMethod		SMT	ON SMT.SampleMethod_ID		= SMP.SampleMethod_ID
INNER JOIN	dbo.MonitoredLocation	MLC	ON MLC.MonitoredLocation_ID = SMP.MonLoc_ID
INNER JOIN	dbo.Parameter			PRM	ON PRM.Prm_id				= MEA.Prm_ID
INNER JOIN	dbo.ParameterGroupMembership	PGM	ON PGM.Prm_Id		= PRM.Prm_ID
INNER JOIN	dbo.ParameterGroup		PGR	ON PGR.PrmGrp_Id			= PGM.PrmGrp_Id
INNER JOIN	dbo.Theme				THM	ON THM.Theme_id				= PRM.Theme_ID
INNER JOIN	dbo.UnitOfMeasure		UOM	ON UOM.Unit_ID				= PRM.Unit_ID
INNER JOIN	dbo.HealthCheck			HCK	ON HCK.Hchk_id				= MEA.Hchk_ID
LEFT JOIN	dbo.ReturnTypes			RTY	ON RTY.RetTyp_ID			= SMP.RetTyp_ID
LEFT JOIN	dbo.Scheme				SCH	ON SCH.EdenMonitoredEntity	= MON.MonEnt_Code
LEFT JOIN	dbo.SchemeYears			SCY	ON SCY.Sch_id				= SCH.Sch_id
LEFT JOIN	dbo.SchemeStation		SST	ON SST.Station_Code			= MLC.MonitoredLocation_Code
LEFT JOIN	dbo.SupplyType			SUP	ON SUP.Sup_id				= SCY.Sup_ID
LEFT JOIN	dbo.SourceType			SRC	ON SRC.Src_id				= SCY.Src_ID

WHERE	PRM.Theme_ID	IN	('6', '15')
AND		SCY.SchYr_Year	=	'2014'
AND		DATEPART(YEAR, SMP.Samp_Date) = '2014'
AND		PGR.Name		=	'DW Pesticide'

ORDER BY ORG.Org_Name, PRM.Prm_Desc





--USE [EPACentral_Aquarius]

--SELECT DISTINCT
--	PRM.Prm_id
--	, PRM.Prm_Code
--	, PRM.Prm_Desc
--	, THM.Theme_Desc
--	, PTY.PrmTyp_Desc
--	, UOM.Unit_Name
--	, UOM.Unit_Code
--	, UOM.EdenUnit

--FROM		dbo.Parameter		PRM
--LEFT JOIN	dbo.UnitOfMeasure	UOM	ON UOM.Unit_ID	= PRM.Unit_ID
--LEFT JOIN	dbo.Theme			THM	ON THM.Theme_id	= PRM.Theme_ID
--LEFT JOIN	dbo.ParameterType	PTY ON PTY.PrmTyp_id = PRM.PrmTyp_ID
--WHERE	PRM.Theme_ID	IN	('6', '15')
--AND		PRM.Prm_Desc	IN
--(
--'2,4-D',	
--'2,6-dichlorobenzamide',	
--'asulam',	
--'atrazine',	
--'bentazone',	
--'Bromacil ',	
--'clopyralid',	
--'cypermethrin',	
--'dichlobenil ',	
--'dichlorprop',	
--'diuron',	
--'Fenpropidin',	
--'glyphosate',	
--'imazapyr',	
--'isoproturon',
--'linuron',	
--'MCPA',	
--'mecoprop',	
--'metaldehyde',	
--'Metoxuron',	
--'propyzamide',	
--'Prothioconazole',	
--'simazine',	
--'Terbuthylazine',	
--'tert–Amyl Methyl Ether',
--'Maneb',
--'Zibeb',
--'2,4,5-T Acid Herbicide',			--'Acid Herbicides' -- No Match
--'2,4-Dichlorophenoxyacetic acid',	-- No Match
--'Atrazine-Desethyl',				-- No Match
--'BAM',								-- No Match
--'Bentazon',							-- No Match
--'Desethylatrazine',					-- No Match	
--'Lindane',							-- No Match
--'MCP',								-- No Match
--'S-Metachlor'						-- No Match
--)
--ORDER BY PRM.Prm_Desc






/*
-- *********************************
-- *** Sandbox
	--, MEA.Meas_Result
	--, MEA.Report_Meas_TextResult
	--, MEA.Report_ResultString
--*/--*/