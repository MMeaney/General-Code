USE [EdenMDS-PRD]

SELECT DISTINCT
	ENP.Name_enp
	, 	PTR.Name_ptr
	, ENP.Code_enp
	, PMX.ParameterMeasurementUnitMatrixId_pmx AS [PMXId]
	, MEU.Code_meu
	, MEU.LongDescription_meu
	, MEU.ShortDescription_meu
	, MET.Name_met
	, PTR.InstallationId_lim
	, LIM.Name_lim
	, LIM.Description_lim
	--, SPT.Name_spt
	--, STT.StaticName_stt
	--, SAP.Code_sap
	, LTRIM(RTRIM(UPT.FirstName_usr)) + ' ' + LTRIM(RTRIM(UPT.LastName_usr)) AS	[PrmTrnslSetBy]
    --, PTR.LastUpdateDate_spt

FROM		dbo.tblEnvironmentalParameter_enp			ENP
LEFT JOIN	dbo.tblParameterTranslation_ptr				PTR ON	PTR.EnvironmentalParameterID_enp	= ENP.EnvironmentalParameterID_enp
LEFT JOIN	dbo.tblUser_usr								UPT ON	UPT.UserID_usr						= PTR.LastUpdatedBy_usr
LEFT JOIN	dbo.tblLimsInstallations_lim				LIM	ON	LIM.InstallationId_lim				= PTR.InstallationId_lim
LEFT JOIN	dbo.tblParameterMeasurementUnitMatrix_pmx	PMX	ON	PMX.EnvironmentalParameterId_enp	= ENP.EnvironmentalParameterID_enp
LEFT JOIN	dbo.tblMeasurementUnit_meu					MEU	ON	MEU.MeasurementUnitID_meu			= PMX.MeasurementUnitId_meu
LEFT JOIN	dbo.tblMonitoredEntityType_met				MET	ON	MET.MonitoredEntityTypeID_met		= PMX.DataTypeId_met
LEFT JOIN	dbo.tblSamplePurposeTranslation_spt			SPT	ON	SPT.InstallationId_lim				= PTR.InstallationId_lim
LEFT JOIN	dbo.tblSamplePurpose_sap					SAP	ON	SAP.SamplePurposeID_sap				= SPT.SamplePurposeID_sap
LEFT JOIN	dbo.tblStationType_stt						STT	ON	(
																STT.MonitoredEntityTypeId_met		= MET.MonitoredEntityTypeID_met
																AND
																STT.StationTypeId_stt				= SAP.StationType_stt
																AND
																STT.StationTypeId_stt				= SPT.StationType_stt
																)

WHERE	ENP.Name_enp IN
(
'1,2-Dichloroethane',
'Aluminium - filtered',
'Aluminium - unfiltered',
'Aluminium - unspecified',
'Benzene',
'Bromodichloromethane',
'Bromoform',
'Cadmium - filtered',
'Cadmium - unfiltered',
'Cadmium - unspecified',
'Cadmium and Thallium',
'Calcium - filtered',
'Calcium - unfiltered',
'Calcium - unspecified',
'Calcium Hardness (as Ca)',
'Calcium Hardness (as CaCO3)',
'Calcium IC - filtered',
'Calcium IC - unfiltered',
'Calcium IC - unspecified',
'Chloroform',
'Chromium - filtered',
'Chromium - unfiltered',
'Chromium - unspecified',
'Chromium VI - filtered',
'Chromium VI - unfiltered',
'Chromium VI - unspecified',
'Clostridium Perfringens after 24 hours',
'Clostridium Perfringens after 48 hours',
'Copper - filtered',
'Copper - unfiltered',
'Copper - unspecified',
'Cryptosporidium',
'Dibromochloromethane',
'Free Residual Chlorine',
'Giardia',
'Total Hardness (as Ca)',
'Total Hardness (as CaCO3)',
'Iron - filtered',
'Iron - unfiltered',
'Iron - unspecified',
'Lead - filtered',
'Lead - unfiltered',
'Lead - unspecified',
'Magnesium - filtered',
'Magnesium - unfiltered',
'Magnesium - unspecified',
'Magnesium IC - filtered',
'Magnesium IC - unfiltered',
'Magnesium IC - unspecified',
'Manganese - filtered',
'Manganese - unfiltered',
'Manganese - unspecified',
'Nickel - filtered',
'Nickel - unfiltered',
'Nickel - unspecified',
'Odour',
'Potassium - filtered',
'Potassium - unfiltered',
'Potassium - unspecified',
'Potassium IC - filtered',
'Potassium IC - unfiltered',
'Potassium IC - unspecified',
'Sodium - filtered',
'Sodium - unfiltered',
'Sodium - unspecified',
'Sodium IC - filtered',
'Sodium IC - unfiltered',
'Sodium IC - unspecified',
'Taste',
'Tetrachloroethene & Trichloroethene (Total)',
'Total Residual Chlorine',
'Trihalomethanes - Total'
)
AND		LIM.Name_lim LIKE '%CORK COUNTY%'
AND		MET.Name_met LIKE '%DRINKING%'
--AND		PTR.Name_ptr = 'Tetrachloroethene & Trichloroethene (Total)'
--AND		MEU.Code_meu LIKE 'MEASUREMENT_UNIT_32'
--AND		PTR.InstallationId_lim	= '76E9d41f-faFA-969E-4f6B-1fB2dbD5e89B'
--AND		STT.StaticName_stt	IS NOT NULL

--ORDER BY	--ENP.Name_enp--, MEU.LongDescription_meu, MET.Name_met, LIM.Name_lim



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