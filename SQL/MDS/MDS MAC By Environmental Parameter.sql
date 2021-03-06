-- *******************************************************
-- *** List of Maximum Allowed Concentrations
-- *** by environmental parameters in Eden MDS
-- *******************************************************

USE [EdenMDS-PRD]

SELECT DISTINCT
	MEA.MaximumAllowedConcentration_mea
	, ENP.Name_enp	AS [Parameter]
	, SOR.Name		AS	[LA Name]


FROM		dbo.tblMeasurement_mea				MEA
LEFT JOIN	dbo.tblEnvironmentalParameter_enp	ENP	ON	ENP.EnvironmentalParameterID_enp	= MEA.EnvironmentalParameterID_enp
LEFT JOIN	dbo.tblSample_sam					SAM	ON	MEA.SampleID_sam					= SAM.SampleID_sam
LEFT JOIN	dbo.tblStation_sta					STA	ON	STA.StationId_sta					= SAM.StationID_sta
LEFT JOIN	dbo.tblMeasurementUnit_meu			MEU	ON	MEU.MeasurementUnitID_meu			= MEA.MeasurementUnitID_meu
LEFT JOIN	dbo.tblOrganisation_org				ORG	ON	ORG.OrganisationId_org				= STA.LocalAuthorityId_org
LEFT JOIN	[EdenSSO-PRD].dbo.Organisation		SOR	ON	SOR.Code							= ORG.StaticName_org

WHERE	SOR.Name = 'Wexford County Council'
AND
	(
			ENP.Name_enp	LIKE '%Coliform Bacteria%'
		OR	ENP.Name_enp	LIKE '%E. Coli%'
	)


ORDER BY 2, 1