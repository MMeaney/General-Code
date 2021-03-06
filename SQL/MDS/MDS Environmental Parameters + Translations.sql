USE [EdenMDS-PRD]

SELECT DISTINCT
	ENP.Name_enp								AS	[EDEN Parameter]
	, PTR.Name_ptr								AS	[LIMS Parameter]
	, ENP.EnvironmentalParameterID_enp			AS	[EDEN Param ID]
	, PTR.Parameter_ptr							AS	[LIMS Param ID]
	, ENP.Code_enp								AS	[Param EDEN Code]
	, PMX.ParameterMeasurementUnitMatrixId_pmx	AS	[PMXId]
	, MEU.Code_meu								AS	[UOM EDEN Code]
	, MEU.LongDescription_meu					AS	[UOM Description]
	, MEU.ShortDescription_meu					AS	[UOM]
	, MEUX.ShortDescription_meu					AS	[UOMPTR]
	, MET.Name_met								AS	[Data Type]
	, PTR.InstallationId_lim
	, LIM.Name_lim
	, LIM.Description_lim
	--, SPT.Name_spt
	--, STT.StaticName_stt
	--, SAP.Code_sap
	, LTRIM(RTRIM(UPT.FirstName_usr)) + ' ' + LTRIM(RTRIM(UPT.LastName_usr)) AS	[PrmTrnslSetBy]
    , PTR.LastUpdateDate_spt

FROM		dbo.tblEnvironmentalParameter_enp			ENP
LEFT JOIN	dbo.tblParameterTranslation_ptr				PTR  ON	PTR.EnvironmentalParameterID_enp	= ENP.EnvironmentalParameterID_enp
LEFT JOIN	dbo.tblUser_usr								UPT  ON	UPT.UserID_usr						= PTR.LastUpdatedBy_usr
LEFT JOIN	dbo.tblLimsInstallations_lim				LIM	 ON	LIM.InstallationId_lim				= PTR.InstallationId_lim
LEFT JOIN	dbo.tblParameterMeasurementUnitMatrix_pmx	PMX	 ON	PMX.EnvironmentalParameterId_enp	= ENP.EnvironmentalParameterID_enp
LEFT JOIN	dbo.tblParameterTranslation_ptr				PTRX ON	(
																PTRX.EnvironmentalParameterID_enp	= ENP.EnvironmentalParameterID_enp
																AND
																PTRX.InstallationId_lim				= PTR.InstallationId_lim
																)
LEFT JOIN	dbo.tblMeasurementUnit_meu					MEU	 ON	MEU.MeasurementUnitID_meu			= PMX.MeasurementUnitId_meu
LEFT JOIN	dbo.tblMeasurementUnit_meu					MEUX ON	MEUX.MeasurementUnitID_meu			= PMX.MeasurementUnitID_meu
LEFT JOIN	dbo.tblMonitoredEntityType_met				MET	 ON	MET.MonitoredEntityTypeID_met		= PMX.DataTypeId_met
LEFT JOIN	dbo.tblSamplePurposeTranslation_spt			SPT	 ON	SPT.InstallationId_lim				= PTR.InstallationId_lim
LEFT JOIN	dbo.tblSamplePurpose_sap					SAP	 ON	SAP.SamplePurposeID_sap				= SPT.SamplePurposeID_sap
LEFT JOIN	dbo.tblStationType_stt						STT	 ON	(
																STT.MonitoredEntityTypeId_met		= MET.MonitoredEntityTypeID_met
																AND
																STT.StationTypeId_stt				= SAP.StationType_stt
																AND
																STT.StationTypeId_stt				= SPT.StationType_stt
																)

WHERE	
PTR.Name_ptr LIKE 'Tin%'
--ENP.Name_enp LIKE '%CONDUCT%'
AND		LIM.Name_lim LIKE '%EPA%'
--AND		MET.Name_met LIKE '%RIVER%'
--AND		PTR.Name_ptr = 'Field Conductivity @ 25°C'
--AND		MEU.Code_meu LIKE 'MEASUREMENT_UNIT_32'
--AND		PTR.InstallationId_lim	= 'dc9c1f9a-f832-4d7b-9635-6edd176b80c6'
--AND		STT.StaticName_stt	IS NOT NULL

ORDER BY	PTR.LastUpdateDate_spt DESC, LIM.Name_lim, ENP.Name_enp, MEU.LongDescription_meu, MET.Name_met--, LIM.Name_lim



/*

	--, ENP.*
	--, PTR.*
	--, LIM.*
	--, PMX.*
	--, MEU.*
	--, MET.*


SELECT TOP 2 * FROM tblEnvironmentalParameter_enp
SELECT TOP 2 * FROM tblMeasurementUnit_meu
SELECT TOP 2 * FROM tblParameterTranslation_ptr
SELECT TOP 2 * FROM tblParameterMeasurementUnitMatrix_pmx
SELECT TOP 2 * FROM tblSamplePurpose_sap


--LEFT JOIN	dbo.tblMeasurement_mea				MEA	ON	(
--														MEA.EnvironmentalParameterID_enp	= ENP.EnvironmentalParameterID_enp
--														AND
--														MEA.SourceSystem_lim				= PTR.InstallationId_lim
--														)


--*/