-- *******************************************************
-- *** List of Units of MEasure (UOM) in Eden MDS
-- *******************************************************

USE [EdenMDS-PRD]

SELECT DISTINCT
	MEU.Code_meu						--AS [EdenMeasUnit]
	, MEU.ShortDescription_meu			--AS [MeasUnit]
	, MEU.LongDescription_meu			--AS [MeasUnitDesc]
	--, ENP.Code_enp						--AS [EdenCode]
	--, ENP.Name_enp						--AS [EnvironmentalParameter]
	--, MET.StaticName_met				--AS [MonitoredEntityTypeStatic]
	--, MET.Name_met						--AS [MonitoredEntityType]
	--, MET.MonitoredEntityTypeID_met		--AS [MonEntTypeId]

FROM		[EdenMDS-PRD].[dbo].[tblMeasurementUnit_meu]				MEU	

LEFT JOIN	[EdenMDS-PRD].[dbo].[tblParameterMeasurementUnitMatrix_pmx]	PMX	ON PMX.MeasurementUnitID_meu = MEU.MeasurementUnitId_meu
LEFT JOIN	[EdenMDS-PRD].[dbo].[tblEnvironmentalParameter_enp]			ENP	ON ENP.EnvironmentalParameterId_enp = PMX.EnvironmentalParameterId_enp
LEFT JOIN	[EdenMDS-PRD].[dbo].[tblMonitoredEntityType_met]			MET	ON MET.MonitoredEntityTypeID_met = PMX.DataTypeId_met
LEFT JOIN	[EdenMDS-PRD].[dbo].[tblParameterTranslation_ptr]			PTR ON PTR.EnvironmentalParameterID_enp = ENP.EnvironmentalParameterID_enp
LEFT JOIN	[EdenMDS-PRD].[dbo].[tblLimsInstallations_lim]				LIM ON LIM.InstallationId_lim = PTR.InstallationId_lim

WHERE	MEU.Code_meu	IN ('MEASUREMENT_UNIT_35')
--WHERE	ENP.Name_enp	LIKE '%E. Coli%'
--WHERE	ENP.Name_enp		LIKE '%BOD%'
--OR		ENP.Name_enp		LIKE '%DO%'
--OR		ENP.Name_enp		LIKE '%Ammonia%'
--OR		ENP.Name_enp		LIKE '%nitrogen%'
--OR		ENP.Name_enp		LIKE '%Ortho%phosphate%'
----OR		ENP.Name_enp		LIKE '%SS%'
----AND		MET.MonitoredEntityTypeID_met	IN	('3', '16')

ORDER BY	MEU.Code_meu--, MET.StaticName_met