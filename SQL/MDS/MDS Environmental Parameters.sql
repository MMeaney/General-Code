-- *******************************************************
-- *** List of Environmental Parameters in Eden MDS
-- *******************************************************

USE [EdenMDS-PRD]

SELECT DISTINCT
	ENP.Code_enp						--AS [EdenCode]
	, ENP.Name_enp						--AS [EnvironmentalParameter]
	, MEU.Code_meu						--AS [EdenMeasUnit]
	, MEU.ShortDescription_meu			--AS [MeasUnit]
	, MEU.LongDescription_meu			--AS [MeasUnitDesc]
	, MET.StaticName_met				--AS [MonitoredEntityTypeStatic]
	, MET.Name_met						--AS [MonitoredEntityType]
	, MET.MonitoredEntityTypeID_met		--AS [MonEntTypeId]
	--, ENP.*
	, PMX.*
	--, MEU.*
	--, MET.*	
FROM		dbo.tblEnvironmentalParameter_enp			ENP
LEFT JOIN	dbo.tblParameterMeasurementUnitMatrix_pmx	PMX	ON PMX.EnvironmentalParameterId_enp = ENP.EnvironmentalParameterId_enp
LEFT JOIN	dbo.tblMeasurementUnit_meu					MEU	ON MEU.MeasurementUnitID_meu		= PMX.MeasurementUnitId_meu
LEFT JOIN	dbo.tblMonitoredEntityType_met				MET	ON MET.MonitoredEntityTypeID_met	= PMX.DataTypeId_met
LEFT JOIN	dbo.tblParameterTranslation_ptr				PTR ON PTR.EnvironmentalParameterID_enp	= ENP.EnvironmentalParameterID_enp
LEFT JOIN	dbo.tblLimsInstallations_lim				LIM ON LIM.InstallationId_lim			= PTR.InstallationId_lim

WHERE	ENP.Name_enp	LIKE 'ph %'

--WHERE	ENP.Name_enp	IN (
--'Uranium',
--'Magnesium',
--'Potassium',
--'Sodium',
--'Calcium'
--)
--WHERE	
--(
--		ENP.Name_enp	LIKE '%Calcium%unspecified'
--	OR	ENP.Name_enp	LIKE '%Magnesium%unspecified'
--	OR	ENP.Name_enp	LIKE '%Potassium%unspecified'
--	OR	ENP.Name_enp	LIKE '%Sodium%unspecified'
--	OR	ENP.Name_enp	LIKE '%Uranium%unspecified'
--)

--WHERE	MEU.Code_meu	=	'MEASUREMENT_UNIT_3'
--OR		ENP.Name_enp		LIKE '%DO%'
--OR		ENP.Name_enp		LIKE '%Ammonia%'
--OR		ENP.Name_enp		LIKE '%nitrogen%'
--OR		ENP.Name_enp		LIKE '%Ortho%phosphate%'
----OR		ENP.Name_enp		LIKE '%SS%'
----AND		MET.MonitoredEntityTypeID_met	IN	('3', '16')



AND		MET.Name_met	=	 'Urban Waste Water'
ORDER BY	ENP.Name_enp, MEU.Code_meu, MET.StaticName_met









/*
WHERE		ENP.Code_enp	IN	('EP_00987', 'EP_00988', 'EP_00990')
	ENP.Name_enp	LIKE '%FORMAL%'

MEU.Code_meu IN	('MEASUREMENT_UNIT_35', 'MEASUREMENT_UNIT_86')
AND			LIM.InstallationId_lim = 'A08D8042-70EF-A3B0-6E3A-ED67EB5B639C'
AND			MET.StaticName_met = 'URBAN_WASTE_WATER'

*/

/*

	, PTR.InstallationId_lim
	--, PTR.Parameter_ptr
	, PTR.EnvironmentalParameterID_enp
	, PTR.Default_ptr
	, PTR.Name_ptr
	, PTR.Symbol_ptr
	, PTR.AutoAnalysisName_ptr
	--, PTR.LastUpdatedBy_usr
	--, PTR.LastUpdateDate_spt
	--, LIM.Name_lim
	--, LIM.InstallationId_lim
	--, LIM.Name_lim
	--, LIM.Description_lim
	--, LIM.ContactName_lim
	--, LIM.ContactTitle_lim
	--, LIM.ContactPhone_lim
	--, LIM.ContactFax_lim
	--, LIM.ContactEmail_lim
	--, LIM.ContactMobile_lim
	--, LIM.OwnerOrganisationId_org
	--, LIM.LastUpdatedBy_usr
	--, LIM.LastUpdateDate_liM
*/